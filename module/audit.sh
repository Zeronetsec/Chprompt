# https://github.com/Zeronetsec/Chprompt

function module::Audit() {
    local engine="${root}/utils/perl/audit_plugin.pl"

    export plugin="${root}/plugin"
    export pattern="${root}/data/patterns.txt"

    if [[ -f "${engine}" ]]; then
        [[ ! -x "${engine}" ]] && {
            command chmod +x "${engine}"
        }

        echo -e "${color_B}[*] ${color_N}Audit plugin: ${color_GG}${plugin}/${color_N}"
        "${engine}"
        return ${?}
    else
        echo -e "${color_R}[!] ${color_N}Engine: ${color_GG}${engine} ${color_N}not found!"
        return 1
    fi

    return 0
}

# Copyright (c) 2026 Zeronetsec