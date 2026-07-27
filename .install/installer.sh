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

    if [[ ! -f "${HOME}/.bashrc" ]]; then
        install::getinstall \
            "command touch ${HOME}/.bashrc" \
            "Create file: ${GG}${HOME}/.bashrc${N}"
    fi

    if [[ "${__BACKUP__}" == "true" ]]; then
        install::getinstall \
            "
                command cp \
                    ${HOME}/.bashrc \
                    ${HOME}/.bashrc_${bkdate}.bak
            " \
            "Backup: ${GG}${HOME}/.bashrc ${DG}-> ${GG}${HOME}/.bashrc_${bkdate}.bak${N}"
    fi

    install::getinstall \
        "
            command cat ${HOME}/.bashrc | \
                command grep -Ev \
                    'source ${opt}/${targetins}/${targetins}.sh|${targetins} --use' \
                    > ${HOME}/.bashrc.tmp || true
        " \
        "Filtering: ${GG}${HOME}/.bashrc${N}"

    current_theme="$(
        command grep "${targetins} --use" \
        "${HOME}/.bashrc" | \
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
            } >> ${HOME}/.bashrc.tmp
        " \
        "Add line: ${GG}source ${opt}/${targetins}/${targetins}.sh ${DG}-> ${GG}${HOME}/.bashrc.tmp${N}"

    install::getinstall \
        "
            command mv \
                ${HOME}/.bashrc.tmp \
                ${HOME}/.bashrc
        " \
        "Moving: ${GG}${HOME}/.bashrc.tmp ${DG}-> ${GG}${HOME}/.bashrc${N}"
}; readonly -f install::installer