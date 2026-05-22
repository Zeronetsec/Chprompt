# https://github.com/Zeronetsec/Chprompt

function utils::unknownCommand() {
    local input="${1}"
    echo -e "${R}[!] ${N}Unknown command: ${GG}${input}${N}"
    echo -e "${R}[!] ${N}Try: ${GG}chprompt --help${N}"
    return 1
}

# Copyright (c) 2026 Zeronetsec