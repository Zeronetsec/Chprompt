# https://github.com/Zeronetsec/Chprompt

function audit_plugin() {
    local engine="${chppath}/utils/python/audit_plugin.py"
    export plugin="${chppath}/plugin"
    export pattern="${chppath}/data/patterns.txt"

    if [[ -z "${chppath}" ]]; then
        echo -e "${R}[!] ${N}Chprompt path not found!"
    fi

    if [[ -f "${engine}" ]]; then
        [[ ! -x "${engine}" ]] && {
            command chmod +x "${engine}"
        }

        echo -e "${B}[*] ${N}Audit plugin: ${GG}${plugin}/${N}"
        command python3 "${engine}"
        return $?
    else
        echo -e "${R}[!] ${N}Engine: ${GG}${engine} ${N}not found!"
        return 1
    fi
}

# Copyright (c) 2026 Zeronetsec