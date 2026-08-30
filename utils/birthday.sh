# https://github.com/Zeronetsec/Chprompt

function utils::birthday() {
    local birth_date="03-10"
    local today="$(command date '+%m-%d')"
    if [[ "${today}" == "${birth_date}" ]]; then
        echo -e "${color_R}› ${color_N}Happy birthday for ${color_GG}Chprompt ${color_N}🎉"
        printf '\n'
    fi
}

# Copyright (c) 2026 Zeronetsec