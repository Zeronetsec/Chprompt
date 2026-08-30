# https://github.com/Zeronetsec/Chprompt

function module::Version() {
    local name="Chprompt"
    local version="v0.1"
    local creator="Zeronetsec"
    local homepage="https://github.com/Zeronetsec/Chprompt"

    echo -e "${color_N}Name: ${color_GG}${name}${color_N}"
    echo -e "${color_N}Version: ${color_GG}${version}${color_N}"
    echo -e "${color_N}Creator: ${color_GG}${creator}${color_N}"
    echo -e "${color_N}Homepage: ${color_GG}${homepage}${color_N}"

    return 0
}

# Copyright (c) 2026 Zeronetsec