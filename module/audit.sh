# https://github.com/Zeronetsec/Chprompt

function module::Audit() {
    local engine="${root}/utils/perl/audit_plugin.pl"

    export plugin="${root}/plugin"
    export pattern="${root}/data/patterns.txt"

    if [[ -f "${engine}" ]]; then
        [[ ! -x "${engine}" ]] && {
            command chmod +x "${engine}"
        }

        echo -e "${B}[*] ${N}Audit plugin: ${GG}${plugin}/${N}"
        command perl "${engine}"
        return ${?}
    else
        echo -e "${R}[!] ${N}Engine: ${GG}${engine} ${N}not found!"
        return 1
    fi

    return 0
}

# Copyright (c) 2026 Zeronetsec