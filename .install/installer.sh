function install::installer() {
    (
        cd "${opt}/${targetins}"
        install::getinstall \
            "
                command zip -r \
                    plugin_backup.zip \
                    plugin
            " \
            "Create zip: ${GG}${opt}/${targetins}/plugin ${DG}-> ${GG}${opt}/${targetins}/plugin_backup.zip${N}"
        cd
    )

    install::getinstall \
        "
            command gcc \
                -O3 -march=native -flto \
                -s ${opt}/${targetins}/${targetsyml}.c \
                -o ${opt}/${targetins}/${targetsyml}
        " \
        "Compiling: ${GG}${targetins}${N}"

    local clib
    command mapfile -t clibs < <(
        command ls \
            "${opt}/${targetins}/utils/c/" \
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
                    -s ${opt}/${targetins}/utils/c/${libname}.c \
                    -o ${opt}/${targetins}/utils/c/${libname}.so \
                    -I${prefix}/include/bash \
                    -I${prefix}/include/bash/include \
                    -I${prefix}/include/bash/builtins
            " \
            "Compiling: ${GG}${libname}.so${N}"
    done


    if [[ ! -f "${HOME}/${__RC__}" ]]; then
        install::getinstall \
            "command touch ${HOME}/${__RC__}" \
            "Create file: ${GG}${HOME}/${__RC__}${N}"
    fi

    if [[ "${__BACKUP__}" == "true" ]]; then
        install::getinstall \
            "
                command cp \
                    ${HOME}/${__RC__} \
                    ${HOME}/${__RC__}_${bkdate}.bak
            " \
            "Backup: ${GG}${HOME}/${__RC__} ${DG}-> ${GG}${HOME}/${__RC__}_${bkdate}.bak${N}"
    fi

    install::getinstall \
        "
            command cat ${HOME}/${__RC__} | \
                command grep -Ev \
                    'source ${opt}/${targetins}/${targetins}.sh|${targetins} --use' \
                    > ${HOME}/${__RC__}.tmp || true
        " \
        "Filtering: ${GG}${HOME}/${__RC__}${N}"

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
        "Add line: ${GG}source ${opt}/${targetins}/${targetins}.sh ${DG}-> ${GG}${HOME}/${__RC__}.tmp${N}"

    install::getinstall \
        "
            command mv \
                ${HOME}/${__RC__}.tmp \
                ${HOME}/${__RC__}
        " \
        "Moving: ${GG}${HOME}/${__RC__}.tmp ${DG}-> ${GG}${HOME}/${__RC__}${N}"
}; readonly -f install::installer