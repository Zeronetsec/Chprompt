# https://github.com/Zeronetsec/Chprompt

function preview() {
    local arg1="${1}"

    local folder="$(
        echo -e "${arg1}" | \
        command cut -d '/' -f 1
    )"

    local file="$(
        echo -e "${arg1}" | \
        command cut -d '/' -f 2
    )"

    if [[ ! -f "${chppath}/plugin/${folder}_line/${file}.chp" ]]; then
        echo -e "${R}[!] ${N}Prompt: ${GG}${folder}/${file} ${N}not found!"
        return 1
    fi

    eval "echo -e \"$(
        getblock 'Preview' \
        "${chppath}/plugin/${folder}_line/${file}.chp" | \
        command grep -vE '^\s*(#|$)' | \
        command tr -d '\n' | \
        command sed 's/%space%/ /g'
    )\""
}

# Copyright (c) 2026 Zeronetsec