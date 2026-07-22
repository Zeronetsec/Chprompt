# https://github.com/Zeronetsec/Chprompt

function module::Chbashrc() {
    local home="${1}"
    if [[ -z "${home}" ]]; then
        utils::missingArgument
        return 1
    fi

    echo -ne "${home}" \
        > "${root}/config/chprompt_bashrc.txt" || \
        return 1

    utils::lhome || return 1
    echo -e "${B}[*] ${N}Set bashrc: ${GG}${home}${N}"
}

# Copyright (c) 2026 Zeronetsec