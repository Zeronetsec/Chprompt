# https://github.com/Zeronetsec/Chprompt

function module::Reset() {
    if [[ ! -f "${root}/plugin_backup.zip" ]]; then
        echo -e "${color_R}[!] ${color_N}Plugin backup: ${color_GG}${root}/plugin_backup.zip ${color_N}not found!"
        return 1
    fi

    command rm -rf "${root}/plugin/"
    command mkdir -p "${root}/plugin"

    command cp \
        "${root}/plugin_backup.zip" \
        "${root}/plugin/"

    command unzip -q "${root}/plugin_backup.zip" -d "${root}/" || {
        echo -e "${color_R}[!] ${color_N}Error: ${color_GG}unzip error with exit code ${color_GG}${?}${color_N}"
        return 1
    }

    module::Use "$(utils::cprompt)"
    return 0
}

# Copyright (c) 2026 Zeronetsec