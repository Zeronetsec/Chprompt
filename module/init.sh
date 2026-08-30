# https://github.com/Zeronetsec/Chprompt

function module::Init() {
    local bashrc="${1}"

    if [[ -z "${bashrc}" ]]; then
        echo -e "${color_R}[!] ${color_N}Bashrc not set!"
        echo -e "${color_R}[!] ${color_N}Fallback to: ${color_GG}${lhome}${color_N}"
        bashrc="${lhome}"
    fi

    if [[ ! -f "${bashrc}" ]]; then
        echo -e "${color_R}[!] ${color_N}Bashrc: ${color_GG}${bashrc} ${color_N}not found!"
        echo -e "${color_R}[!] ${color_N}Fallback to: ${color_GG}${lhome}${color_N}"
        bashrc="${lhome}"
    fi

    if ! command -v chprompt &>/dev/null; then
        echo -e "${color_R}[!] ${color_N}Chprompt binary not found!"
        return 1
    fi

    command chprompt --init "${bashrc}"
    echo "" >> "${bashrc}"

    return ${?}
}

# Copyright (c) 2026 Zeronetsec