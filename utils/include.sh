# https://github.com/Zeronetsec/Chprompt

function include() {
    local input_data
    local line
    local ecode

    if [[ "${1}" != ":" ]]; then
        return 1
    fi

    shift
    input_data="${1}"

    if [[ -z "${input_data}" ]]; then
        return 1
    fi

    input_data="$(echo -e "${input_data}" | \
        command sed -n '/(/,/)/p' | \
        command sed 's/[()]//g' | \
        command sed 's/^[[:space:]]*[[:space:]]*//; s/^[[:space:]]*//; s/[[:space:]]*$//' | \
        command sed '/^$/d'
    )"

    while read -r line; do
        [[ -z "${line}" ]] && continue
        if [[ ! -f "${chppath}/${line}.sh" ]]; then
            echo -e "${R}[!] ${N}Include: ${GG}${line} ${N}not found!"
            ecode=1
        fi
        source "${chppath}/${line}.sh"
    done <<< "${input_data}"

    return ${ecode:-0}
}

# Copyright (c) 2026 Zeronetsec