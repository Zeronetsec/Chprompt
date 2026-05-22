# https://github.com/Zeronetsec/Chprompt

function utils::invalidInput() {
    echo -e "${R}[!] ${N}Invalid input!"
    echo -e "${R}[!] ${N}Try: ${GG}chprompt --help${N}"
    return 1
}

# Copyright (c) 2026 Zeronetsec