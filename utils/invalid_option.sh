# https://github.com/Zeronetsec/Chprompt

function utils::invalidOption() {
    local input="${1}"
    echo -e "${color_R}[!] ${color_N}Invalid option: ${color_GG}${input}${color_N}"
    echo -e "${color_R}[!] ${color_N}Try: ${color_GG}chprompt --help${color_N}"
    return 1
}

# Copyright (c) 2026 Zeronetsec