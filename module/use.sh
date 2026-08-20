# https://github.com/Zeronetsec/Chprompt

function module::Use() {
    local arg1="${1}"
    if [[ -z "${arg1}" ]]; then
        utils::missingArgument
        return 1
    fi

    builtin use "${arg1}"
    return ${?}
}

# Copyright (c) 2026 Zeronetsec