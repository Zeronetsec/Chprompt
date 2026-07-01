# https://github.com/Zeronetsec/Chprompt

function module::Helper() {
    local engine="${root}/utils/python/json_parser.py"
    if [[ -f "${engine}" ]]; then
        utils::banner
        utils::birthday

        echo -e "${N}Usage: ${GG}chprompt ${CC}<option> [<args>]${N}"
        printf '\n'
        echo -e "${N}Available options:"

        [[ ! -x "${engine}" ]] && {
            command chmod +x "${engine}"
        }

        command python3 "${engine}"
        return ${?}
    else
        echo -e "${R}[!] ${N}Engine: ${GG}${engine} ${N}not found!"
        return 1
    fi

    return 0
}

# Copyright (c) 2026 Zeronetsec