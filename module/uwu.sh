# https://github.com/Zeronetsec/Chprompt

function module::Uwu() {
    local engine="${root}/utils/perl/nyanners.pl"

    if [[ -f "${engine}" ]]; then
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