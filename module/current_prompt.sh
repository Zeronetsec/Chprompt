# https://github.com/Zeronetsec/Chprompt

function module::CurrentPrompt() {
    local cprompt=$(
        utils::cprompt
    )
    echo -ne "${B}[*] ${N}Current prompt: ${GG}${cprompt}${N}"
    module::Preview "${cprompt}"
}

# Copyright (c) 2026 Zeronetsec