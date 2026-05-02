# https://github.com/Zeronetsec/Chprompt

function chhost() {
    local target="${chppath}/plugin"

    if [[ -z "${1}" ]]; then
        echo -e "${R}[!] ${N}Missing arguments!"
        return 1
    fi

    if [[ -z "${2}" ]]; then
        local newhost="${1}"
        local current_host="$(command hostname)"
        echo -e "${B}[*] ${N}Replacing: ${GG}\\h ${N}and ${GG}${current_host} ${DG}=> ${GG}${newhost} ${N}on all plugins"
        command find "${target}" \
            -type f \
            -name "*.chp" \
            -exec sed -Ei "s/\\\\h|${current_host}/${newhost}/g" {} +
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