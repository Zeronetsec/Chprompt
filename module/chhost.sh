# https://github.com/Zeronetsec/Chprompt

function Chhost() {
    local target="${root}/plugin"
    if [[ -z "${1}" ]]; then
        utils::missingArgument
        return 1
    fi

    if [[ -z "${2}" ]]; then
        local newhost="${1}"
        command find "${target}" \
            -type f \
            -name "*.chp" \
            -exec sed -i 's/\\h/'"${newhost}"'/g; s/\$(command hostname)/'"${newhost}"'/g' {} +
    else
        local old="${1}"
        local new="${2}"
        command find "${target}" \
            -type f \
            -name "*.chp" \
            -exec sed -i "s/\<${old}\>/${new}/g" {} +
    fi

    module::Use "$(utils::cprompt)"
    return 0
}

# Copyright (c) 2026 Zeronetsec