# https://github.com/Zeronetsec/Chprompt

function ShowSource() {
    local arg1="${1}"
    if [[ -z "${arg1}" ]]; then
        utils::missingArgument
        return 1
    fi

    local folder="$(
        echo -e "${arg1}" | \
        command cut -d '/' -f 1
    )"

    local file="$(
        echo -e "${arg1}" | \
        command cut -d '/' -f 2
    )"

    if [[ ! -f "${root}/plugin/${folder}_line/${file}.chp" ]]; then
        echo -e "${R}[!] ${N}Prompt: ${GG}${folder}/${file} ${N}not found!"
        return 1
    fi

    echo "$(
        command bat "${root}/plugin/${folder}_line/${file}.chp" \
        --paging=never \
        --color=always \
        --language=bash \
        --plain | \
            command grep -v 'https://github.com/Zeronetsec/' | \
            command grep -v 'Copyright (c)'
    )"

    return 0
}

# Copyright (c) 2026 Zeronetsec