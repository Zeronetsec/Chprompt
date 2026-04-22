# https://github.com/Zeronetsec/Chprompt

function uwu() {
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

    echo -ne "\033[?25l"
    while (( SECONDS < duration )); do
        for face in "${faces[@]}"; do
            (( SECONDS >= duration )) && break
            printf "\r%s\033[K" "$face"
            command sleep "$delay"
        done
    done
    echo -ne "\033[?25h\n"

    return $?
}

# Copyright (c) 2026 Zeronetsec