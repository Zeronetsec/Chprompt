# https://github.com/Zeronetsec/Chprompt

function utils::birthday() {
    local birth_date="03-10"
    local today="$(command date '+%m-%d')"
    if [[ "${today}" == "${birth_date}" ]]; then
        echo -e "${R}› ${N}Happy birthday for ${GG}chprompt ${N}🎉"
        printf '\n'
    fi
}

# Copyright (c) 2026 Zeronetsec