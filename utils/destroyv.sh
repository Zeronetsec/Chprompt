# https://github.com/Zeronetsec/Chprompt

function destroyv() {
    if [[ "${1}" != ":" ]]; then
        return 1
    fi

    shift
    local input_data="${1}"
    if [[ -z "${input_data}" ]]; then
        return 1
    fi

    local line
    local inside_bracket=0

    while read -r line; do
        line="${line#"${line%%[![:space:]]*}"}"
        line="${line%"${line##*[![:space:]]}"}"
        if [[ "${line}" == *"("* ]]; then
            inside_bracket=1
            continue
        fi

        if [[ "${line}" == *")"* ]]; then
            inside_bracket=0
            continue
        fi

        if (( inside_bracket )); then
            [[ -z "${line}" ]] && continue
            [[ "${line}" =~ ^# ]] && continue
            unset "${line}"
        fi
    done <<< "${input_data}"
    return 0
}

# Copyright (c) 2026 Zeronetsec