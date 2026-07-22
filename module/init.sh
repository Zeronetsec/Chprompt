# https://github.com/Zeronetsec/Chprompt

function module::Init() {
    local bashrc="${2}"

    if [[ -z "${bashrc}" ]]; then
        echo -e "${R}[!] ${N}Bashrc not set!"
        echo -e "${R}[!] ${N}Fallback to: ${GG}${lhome}${N}"
        bashrc="${lhome}"
    fi

    if [[ ! -f "${bashrc}" ]]; then
        echo -e "${R}[!] ${N}Bashrc: ${GG}${bashrc} ${N}not found!"
        echo -e "${R}[!] ${N}Fallback to: ${GG}${lhome}${N}"
        bashrc="${lhome}"
    fi

    if ! command -v chprompt &>/dev/null; then
        echo -e "${R}[!] ${N}Chprompt binary not found!"
        return 1
    fi

    command chprompt --init "${bashrc}"
    return ${?}
}

# Copyright (c) 2026 Zeronetsec