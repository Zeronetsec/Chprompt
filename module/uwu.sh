# https://github.com/Zeronetsec/Chprompt

function module::Uwu() {
    local faces=(
        "(｡◕‿◕｡)"
        "(≧◡≦)"
        "ʕ•ᴥ•ʔ"
        "(・ω・)"
        "(๑˃ᴗ˂)ﻭ"
        "(ง'̀-'́)ง"
        "(=^･ω･^=)"
    )

    local delay=0.2
    local duration=5

    SECONDS=0

    echo -ne "\x1b[?25l"
    while (( SECONDS < duration )); do
        for face in "${faces[@]}"; do
            (( SECONDS >= duration )) && break
            printf "\r%s\x1b[K" "${face}"
            command sleep "${delay}"
        done
    done
    echo -ne "\x1b[?25h\n"

    return 0
}

# Copyright (c) 2026 Zeronetsec