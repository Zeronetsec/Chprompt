# https://github.com/Zeronetsec/Chprompt

function version() {
    local tools="Chprompt"
    local version="v1.0"
    local creator="Zeronetsec"
    local homepage="https://github.com/Zeronetsec/Chprompt"

    echo -e "${N}Project: ${GG}${tools}${N}"
    echo -e "${N}Version: ${GG}${version}${N}"
    echo -e "${N}Creator: ${GG}${creator}${N}"
    echo -e "${N}Homepage: ${GG}${homepage}${N}"

    return $?
}

# Copyright (c) 2026 Zeronetsec