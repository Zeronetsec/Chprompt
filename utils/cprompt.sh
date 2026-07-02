# https://github.com/Zeronetsec/Chprompt

function cprompt() {
    local cprompt=$(
        command grep -oP \
        'chprompt --use \K[^ ]+' "${HOME}/.bashrc"
    )
    echo -e "${cprompt}"
}

# Copyright (c) 2026 Zeronetsec