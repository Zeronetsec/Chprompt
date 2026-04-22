# https://github.com/Zeronetsec/Chprompt

function helper() {
    local birth_date="03-10"
    local today="$(command date '+%m-%d')"

    if [[ "$today" == "$birth_date" ]]; then
        echo -e "${R}› ${N}Happy birthday for ${GG}chprompt ${N}🎉"
        printf '\n'
    fi

    echo -e "${N}Usage: ${GG}chprompt ${CC}<command> [<args>]${N}"
    printf '\n'
    echo -e "${N}Available commands:"
    echo -e "    ${GG}--preview ${DG}<${CC}line/prompt_number${DG}> ${N}to preview prompt"
    echo -e "    ${GG}--use ${DG}<${CC}line/prompt_number${DG}> ${N}to use prompt"
    echo -e "    ${GG}--inject ${DG}<${CC}line/prompt_number${DG}> ${N}to inject prompt into ${CC}${shcfg}${N}"
    echo -e "    ${GG}--list ${N}to list all available prompts number"
    echo -e "    ${GG}--version ${N}to show version"
    echo -e "    ${GG}--help ${N}to show helper message"

    return $?
}

# Copyright (c) 2026 Zeronetsec