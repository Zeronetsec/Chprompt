# https://github.com/Zeronetsec/Chprompt

function utils::Chuser() {
    local target="${chppath}/plugin"

    if [[ -z "${1}" ]]; then
        utils::missingArguments
        return $?
    fi

    if [[ -z "${2}" ]]; then
        local newuser="${1}"
        command find "${target}" \
            -type f \
            -name "*.chp" \
            -exec sed -Ei 's/\\u|\$\(command whoami\)/'"${newuser}"'/g' {} +
    else
        local old="${1}"
        local new="${2}"
        command find "${target}" \
            -type f \
            -name "*.chp" \
            -exec sed -i "s/${old}/${new}/g" {} +
    fi

    source "${HOME}/.bashrc"
    return 0
}

# Copyright (c) 2026 Zeronetsec