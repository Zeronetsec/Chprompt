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
    echo -e "    ${GG}--preview ${DG}<${CC}line/prompt_number${DG}> ${N}preview a specific prompt"
    echo -e "    ${GG}--use ${DG}<${CC}line/prompt_number${DG}> ${N}set a specific prompt as active"
    echo -e "    ${GG}--inject ${DG}<${CC}line/prompt_number${DG}> ${N}inject a prompt into the ${CC}~/.bashrc ${N}configuration"
    echo -e "    ${GG}--chuser ${DG}<${CC}user${DG}> [<${CC}new_user${DG}>] ${N}replace username in all plugins"
    echo -e "    ${GG}--chhost ${DG}<${CC}host${DG}> [<${CC}new_host${DG}>] ${N}replace hostname in all plugins"
    echo -e "    ${GG}--reset ${N}restore plugins to default (removes custom plugins)"
    echo -e "    ${GG}--list ${N}list all available prompt numbers"
    echo -e "    ${GG}--version ${N}show version information"
    echo -e "    ${GG}--help ${N}show this help message"

    return $?
}

# Copyright (c) 2026 Zeronetsec