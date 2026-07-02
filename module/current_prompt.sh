# https://github.com/Zeronetsec/Chprompt

function CurrentPrompt() {
    local cprompt=$(
        utils::cprompt
    )
    echo -ne "${B}[*] ${N}Current prompt: ${GG}${cprompt}${N}"
    module::Preview "${cprompt}"
}

# Copyright (c) 2026 Zeronetsec