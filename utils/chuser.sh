# https://github.com/Zeronetsec/Chprompt

function chuser() {
    local target="${chppath}/plugin"

    if [[ -z "${1}" ]]; then
        echo -e "${R}[!] ${N}Missing argument!"
        return 1
    fi

    if [[ -z "${2}" ]]; then
        local newuser="${1}"
        echo -e "${B}[*] ${N}Replacing: ${GG}\\u ${N}and ${GG}\$(command whoami) ${DG}=> ${GG}${newuser} ${N}on all plugins"
        command find "${target}" \
            -type f \
            -name "*.chp" \
            -exec sed -Ei "s/\\\\u|\\\\\$\(command whoami\)/${newuser}/g" {} +
    else
        local old="${1}"
        local new="${2}"
        echo -e "${B}[*] ${N}Replacing: ${GG}${old} ${DG}=> ${GG}${new} ${N}on all plugins"
        command find "${target}" \
            -type f \
            -name "*.chp" \
            -exec sed -i "s/${old}/${new}/g" {} +
    fi

    return 0
}

# Copyright (c) 2026 Zeronetsec