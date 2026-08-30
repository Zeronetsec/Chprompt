function install::installer() {
    (
        cd "${opt}/${targetins}"
        install::getinstall \
            "
                command zip -r \
                    plugin_backup.zip \
                    plugin
            " \
            "Create zip: ${color_GG}${opt}/${targetins}/plugin ${color_DG}-> ${color_GG}${opt}/${targetins}/plugin_backup.zip${color_N}"
        cd
    )

    install::getinstall \
        "
            command gcc \
                -O3 -march=native -flto \
                -s ${opt}/${targetins}/${targetsyml}.c \
                -o ${opt}/${targetins}/${targetsyml}
        " \
        "Compiling: ${color_GG}${targetins}${color_N}"

    local clibs
    command mapfile -t clibs < <(
        command ls \
            "${opt}/${targetins}/utils/libso/" \
            --color=never \
            2>/dev/null
    )

    local lib
    for lib in "${clibs[@]}"; do
        local libname="${lib%%.*}"
        install::getinstall \
            "
                command gcc \
                    -fPIC -shared -O3 -march=native \
                    -s ${opt}/${targetins}/utils/libso/${libname}.c \
                    -o ${opt}/${targetins}/utils/libso/${libname}.so \
                    -I${prefix}/include/bash \
                    -I${prefix}/include/bash/include \
                    -I${prefix}/include/bash/builtins
            " \
            "Compiling: ${color_GG}${libname}.so${color_N}"
    done

    if [[ ! -f "${HOME}/${__RC__}" ]]; then
        install::getinstall \
            "command touch ${HOME}/${__RC__}" \
            "Create file: ${color_GG}${HOME}/${__RC__}${color_N}"
    fi

    if [[ "${__BACKUP__}" == "true" ]]; then
        install::getinstall \
            "
                command cp \
                    ${HOME}/${__RC__} \
                    ${HOME}/${__RC__}_${bkdate}.bak
            " \
            "Backup: ${color_GG}${HOME}/${__RC__} ${color_DG}-> ${color_GG}${HOME}/${__RC__}_${bkdate}.bak${color_N}"
    fi

    install::getinstall \
        "
            command cat ${HOME}/${__RC__} | \
                command grep -Ev \
                    'source ${opt}/${targetins}/${targetins}.sh|${targetins} --use' \
                    > ${HOME}/${__RC__}.tmp || true
        " \
        "Filtering: ${color_GG}${HOME}/${__RC__}${color_N}"

    current_theme="$(
        command grep "${targetins} --use" \
        "${HOME}/${__RC__}" | \
        command head -n 1 | \
        command sed "s/.*${targetins} --use //"
    )"

    if [[ -z "${current_theme}" ]]; then
        current_theme="default/default"
    fi

    install::getinstall \
        "
            {
                echo -e \
                    'source ${opt}/${targetins}/${targetins}.sh'
                echo -e \
                    '${targetins} --use ${current_theme}'
            } >> ${HOME}/${__RC__}.tmp
        " \
        "Add line: ${color_GG}source ${opt}/${targetins}/${targetins}.sh ${color_DG}-> ${color_GG}${HOME}/${__RC__}.tmp${color_N}"

    install::getinstall \
        "
            command mv \
                ${HOME}/${__RC__}.tmp \
                ${HOME}/${__RC__}
        " \
        "Moving: ${color_GG}${HOME}/${__RC__}.tmp ${color_DG}-> ${color_GG}${HOME}/${__RC__}${color_N}"
}; readonly -f install::installer