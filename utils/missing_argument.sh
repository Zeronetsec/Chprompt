# https://github.com/Zeronetsec/Chprompt

function utils::missingArgument() {
    echo -e "${color_R}[!] ${color_N}Missing argument!"
    echo -e "${color_R}[!] ${color_N}Try: ${color_GG}chprompt --help${color_N}"
    return 1
}

# Copyright (c) 2026 Zeronetsec