# https://github.com/Zeronetsec/Chprompt

function resetplugin() {
    if [[ ! -f "${chppath}/plugin_backup.zip" ]]; then
        echo -e "${R}[!] ${N}Plugin backup: ${GG}${chppath}/plugin_backup.zip ${N}not found!"
        return 1
    fi

    echo -e "${B}[*] ${N}Resetting plugins to default"
    command rm -rf "${chppath}/plugin/"
    command mkdir -p "${chppath}/plugin"

    command cp -v \
        "${chppath}/plugin_backup.zip" \
        "${chppath}/plugin/"

    command unzip -q "${chppath}/plugin_backup.zip" -d "${chppath}/" || {
        echo -e "${R}[!] ${N}Error: ${GG}unzip error with exit code ${GG}${?}${N}"
        return 1
    }
}

# Copyright (c) 2026 Zeronetsec