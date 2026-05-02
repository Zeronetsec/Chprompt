# https://github.com/Zeronetsec/Chprompt

function resetplugin() {
    if [[ ! -f "${chppath}/plugin_backup.zip" ]]; then
        echo -e "${R}[!] ${N}Plugin backup: ${GG}${chppath}/plugin_backup.zip ${N}not found!"
        return 1
    fi

    command rm -rfv "${chppath}/plugin/"
    command mkdir -p "${chppath}/plugin"

    command cp -v \
        "${chppath}/plugin_backup.zip" \
        "${chppath}/plugin/"

    command unzip "${chppath}/plugin_backup.zip" -d "${chppath}/"
}

# Copyright (c) 2026 Zeronetsec