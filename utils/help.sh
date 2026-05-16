# https://github.com/Zeronetsec/Chprompt

function helper() {
    local birth_date="03-10"
    local today="$(command date '+%m-%d')"

    export myroot="$(command chprompt 2>/dev/null)"
    local engine="${myroot}/utils/python/json_parser.py"

    if [[ -z "${myroot}" ]]; then
        echo -e "${R}[!] ${N}Chprompt path not found!"
    fi

    if [[ -f "${engine}" ]]; then
        if [[ "${today}" == "${birth_date}" ]]; then
            echo -e "${R}› ${N}Happy birthday for ${GG}chprompt ${N}🎉"
            printf '\n'
        fi

        echo -e "${N}Usage: ${GG}chprompt ${CC}<command> [<args>]${N}"

        printf '\n'
        echo -e "${N}Available commands:"

        [[ ! -x "${engine}" ]] && {
            command chmod +x "${engine}"
        }

        command python3 "${engine}"
        return $?
    else
        echo -e "${R}[!] ${N}Engine: ${GG}${engine} ${N}not found!"
        return 1
    fi
}

# Copyright (c) 2026 Zeronetsec