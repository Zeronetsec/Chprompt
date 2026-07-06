# https://github.com/Zeronetsec/Chprompt

function utils::missingArgument() {
    echo -e "${R}[!] ${N}Missing argument!"
    echo -e "${R}[!] ${N}Try: ${GG}chprompt --help${N}"
    return 1
}

# Copyright (c) 2026 Zeronetsec