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

    builtin lhome || return 1
    echo -e "${color_B}[*] ${color_N}Set bashrc: ${color_GG}${home}${color_N}"
}

# Copyright (c) 2026 Zeronetsec