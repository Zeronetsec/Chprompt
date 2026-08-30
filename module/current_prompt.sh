# https://github.com/Zeronetsec/Chprompt

function module::CurrentPrompt() {
    local cprompt=$(
        utils::cprompt
    )

    if [[ -z "${cprompt}" ]]; then
        echo -e "${color_R}[!] ${color_N}Current prompt not found!"
        return 1
    fi

    echo -ne "${color_B}[*] ${color_N}Current prompt: ${color_GG}${cprompt}${color_N}"
    module::Preview "${cprompt}"
}

# Copyright (c) 2026 Zeronetsec