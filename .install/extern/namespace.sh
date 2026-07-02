function install::extern::Namespace() {
    local dir=""
    local exfile=""
    local exdir=""
    local rdonly="true"

    while [[ ${#} -gt 0 ]]; do
        case "${1}" in
            "--exfile") exfile="${2}"; shift 2 ;;
            "--exdir") exdir="${2}"; shift 2 ;;
            "--rdonly") rdonly="${2}"; shift 2 ;;
            *) dir="${1}"; shift ;;
        esac
    done

    if [[ -z "${dir}" ]]; then
        return 1
    fi

    local exclude_files=()
    if [[ -n "${exfile}" ]]; then
        IFS=':' read -r -a files_array <<< "${exfile}"
        for file in "${files_array[@]}"; do
            exclude_files+=("-o" "-name" "${file}")
        done
    fi

    local exclude_dirs=()
    if [[ -n "${exdir}" ]]; then
        IFS=':' read -r -a dirs_array <<< "${exdir}"
        for idx in "${!dirs_array[@]}"; do
            if [[ "${idx}" -eq 0 ]]; then
                exclude_dirs+=(
                    "-name"
                    "${dirs_array[${idx}]}"
                )
            else
                exclude_dirs+=(
                    "-o"
                    "-name"
                    "${dirs_array[${idx}]}"
                )
            fi
        done
    fi

    function __namespacing__() {
        local filepath="${1}"
        local apply_readonly="${2}"

        local clean_path="$(
            echo -e "${filepath}" | \
                command sed 's|//*|/|g'
        )"

        local base_dir="${dir%/}"
        clean_path="${clean_path#${base_dir}/}"
        clean_path="${clean_path#./}"

        local dirname="$(
            command dirname "${clean_path}"
        )"

        local namespace=""
        if [[ "${dirname}" != "." ]]; then
            namespace="$(
                echo -e "${dirname}" | \
                    command sed 's/\//::/g'
            )"
        fi

        local tmp_file="$(command mktemp)"
        local readonly_queues=()
        local brace_level=0
        local display_path="${clean_path%.sh}"

        while IFS= read -r line <&3 || [[ -n "${line}" ]]; do
            if [[ ${brace_level} -eq 0 ]] && \
                [[ "${line}" =~ ^[[:space:]]*(function[[:space:]]+)?([a-zA-Z0-9_:-]+)[[:space:]]*\(\) ]]; then
                    local func_name="${BASH_REMATCH[2]}"
                    local new_func_name="${func_name}"

                    if [[ -n "${namespace}" ]]; then
                        if [[ "${func_name}" != "${namespace}"::* ]]; then
                            new_func_name="${namespace}::${func_name}"
                        fi
                    fi

                    if [[ "${line}" =~ "function " ]]; then
                        line="${line/function ${func_name}/function ${new_func_name}}"
                    else
                        line="${line/${func_name}/${new_func_name}}"
                    fi

                    readonly_queues+=("${new_func_name}")
                    echo -e "${DG}-> ${N}Namespacing: ${GG}${display_path} ${DG}(${GG}${func_name} ${DG}-> ${GG}${new_func_name}${DG})${N}"
            fi

            echo -e "${line}" >> "${tmp_file}"

            local open_braces="$(
                echo -e "${line}" | \
                    command tr -cd '{' | \
                    command wc -c
            )"

            local close_braces="$(
                echo -e "${line}" | \
                    command tr -cd '}' | \
                    command wc -c
            )"

            brace_level=$((brace_level + open_braces - close_braces))
        done 3< "${filepath}"

        if [[ "${apply_readonly}" == true ]]; then
            for func in "${readonly_queues[@]}"; do
                echo -e "readonly -f ${func}" >> "${tmp_file}"
            done
        fi
        command mv "${tmp_file}" "${filepath}"
    }

    if [[ "${#exclude_dirs[@]}" -gt 0 ]]; then
        while read -r file; do
            __namespacing__ "${file}" "${rdonly}"
        done < <(
            command find "${dir}" \
                -type d "(" "${exclude_dirs[@]}" ")" \
                -prune -o \
                -type f \
                -name "*.sh" \
                ! "(" -name "namespace.sh" "${exclude_files[@]}" ")" \
                -print
        )
    else
        while read -r file; do
            __namespacing__ "${file}" "${rdonly}"
        done < <(
            command find "${dir}" \
                -type f \
                -name "*.sh" \
                ! "(" -name "namespace.sh" "${exclude_files[@]}" ")" \
                -print
        )
    fi

}; readonly -f install::extern::Namespace