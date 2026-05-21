# https://github.com/Zeronetsec/Chprompt

function utils::Helper() {
    local birth_date="03-10"
    local today="$(command date '+%m-%d')"
    local engine="${chppath}/utils/python/json_parser.py"

    if [[ -z "${chppath}" ]]; then
        echo -e "${R}[!] ${N}Chprompt path not found!"
        return 1
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

    return 0
}

# Copyright (c) 2026 Zeronetsec