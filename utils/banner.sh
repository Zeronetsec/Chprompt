# https://github.com/Zeronetsec/Chprompt

function banner() {
    local banner="${root}/data/banner.txt"
    echo -ne "${B}"
    command cat "${banner}"
    echo -ne "${N}"
    printf '\n'
}

# Copyright (c) 2026 Zeronetsec