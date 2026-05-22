# https://github.com/Zeronetsec/Chprompt

function utils::missingArguments() {
    echo -e "${R}[!] ${N}Missing arguments!"
    echo -e "${R}[!] ${N}Try: ${GG}chprompt --help${N}"
    return 1
}

# Copyright (c) 2026 Zeronetsec