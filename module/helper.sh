# https://github.com/Zeronetsec/Chprompt

function module::Helper() {
    local engine="${root}/utils/perl/json_parser.pl"
    if [[ -f "${engine}" ]]; then
        utils::banner
        utils::birthday

        echo -e "${color_N}Usage: ${color_GG}chprompt ${color_CC}<option> [<args>]${color_N}"
        printf '\n'
        echo -e "${color_N}Available options:"

        [[ ! -x "${engine}" ]] && {
            command chmod +x "${engine}"
        }

        "${engine}"
        return ${?}
    else
        echo -e "${color_R}[!] ${color_N}Engine: ${color_GG}${engine} ${color_N}not found!"
        return 1
    fi

    return 0
}

# Copyright (c) 2026 Zeronetsec