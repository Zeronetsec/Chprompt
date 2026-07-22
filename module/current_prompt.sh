# https://github.com/Zeronetsec/Chprompt

function module::CurrentPrompt() {
    local cprompt=$(
        utils::cprompt
    )

    if [[ -z "${cprompt}" ]]; then
        echo -e "${R}[!] ${N}Current prompt not found!"
        return 1
    fi

    echo -ne "${B}[*] ${N}Current prompt: ${GG}${cprompt}${N}"
    module::Preview "${cprompt}"
}

# Copyright (c) 2026 Zeronetsec