# https://github.com/Zeronetsec/Chprompt

function utils::banner() {
    local banner="${root}/data/banner.txt"
    echo -ne "${color_B}"
    command cat "${banner}"
    echo -ne "${color_N}"
    printf '\n'
}

# Copyright (c) 2026 Zeronetsec