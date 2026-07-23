function install::installer() {
    if [[ "${__BACKUP__}" == "true" && -d "${opt}/chprompt" ]]; then
        (
            cd "${opt}"
            install::getinstall \
                "
                    command zip -r \
                        chprompt_${bkdate}.bak.zip \
                        chprompt
                " \
                "Backup: ${GG}${opt}/chprompt ${DG}-> ${GG}${opt}/chprompt_${bkdate}.bak.zip${N}"
            cd
        )
    fi

    if [[ -d "${opt}/chprompt" ]]; then
        install::getinstall \
            "command rm -rf ${opt}/chprompt" \
            "Removing old source..."
    fi

    install::getinstall \
        "command mv ${root} ${opt}/chprompt" \
        "Moving: ${GG}${root} ${DG}-> ${GG}${opt}/chprompt${N}"

    (
        cd "${opt}/chprompt"
        install::getinstall \
            "
                command zip -r \
                    plugin_backup.zip \
                    plugin
            " \
            "Create zip: ${GG}${opt}/chprompt/plugin ${DG}-> ${GG}${opt}/chprompt/plugin_backup.zip${N}"
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
                    'source ${opt}/chprompt/chprompt.sh|chprompt --use' \
                    > ${HOME}/.bashrc.tmp || true
        " \
        "Filtering: ${GG}${HOME}/.bashrc${N}"

    current_theme="$(
        command grep "chprompt --use" \
        "${HOME}/.bashrc" | \
        command head -n 1 | \
        command sed 's/.*chprompt --use //'
    )"

    if [[ -z "${current_theme}" ]]; then
        current_theme="default/default"
    fi

    install::getinstall \
        "
            {
                echo -e \
                    'source ${opt}/chprompt/chprompt.sh'
                echo -e \
                    'chprompt --use ${current_theme}'
            } >> ${HOME}/.bashrc.tmp
        " \
        "Add line: ${GG}source ${opt}/chprompt/chprompt.sh ${DG}-> ${GG}${HOME}/.bashrc.tmp${N}"

    install::getinstall \
        "
            command mv \
                ${HOME}/.bashrc.tmp \
                ${HOME}/.bashrc
        " \
        "Moving: ${GG}${HOME}/.bashrc.tmp ${DG}-> ${GG}${HOME}/.bashrc${N}"

    install::getinstall \
        "
            command ln -sf \
                ${opt}/chprompt/bin/chprompt.sh \
                ${bin}/chprompt
        " \
        "Symlink: ${GG}${opt}/chprompt/bin/chprompt.sh ${DG}-> ${GG}${bin}/chprompt${N}"
}; readonly -f install::installer