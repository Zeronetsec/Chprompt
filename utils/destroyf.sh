# https://github.com/Zeronetsec/Chprompt

function destroyf() {
    local input_data
    local line
    local ecode

    if [[ "${1}" != ":" ]]; then
        return 1
    fi

    shift
    input_data="${1}"

    if [[ -z "${input_data}" ]]; then
        return 1
    fi

    input_data="$(
        echo -e "${input_data}" | \
        command sed -n '/(/,/)/ {
            s/[()]//g;
            s/^[[:space:]]*//;
            s/[[:space:]]*$//;
            /^$/d;
            p;
        }'
    )"

    while read -r line; do
        [[ -z "${line}" ]] && continue
        [[ "${line}" =~ ^# ]] && continue
        unset -f "${line}"
    done <<< "${input_data}"

    return 0
}

# Copyright (c) 2026 Zeronetsec