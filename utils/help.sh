# https://github.com/Zeronetsec/Chprompt

function helper() {
    local birth_date="03-10"
    local today="$(command date '+%m-%d')"

    if [[ "${today}" == "${birth_date}" ]]; then
        echo -e "${R}› ${N}Happy birthday for ${GG}chprompt ${N}🎉"
        printf '\n'
    fi

    echo -e "${N}Usage: ${GG}chprompt ${CC}<command> [<args>]${N}"
    printf '\n'
    echo -e "${N}Available commands:"
    echo -e "    ${DG}* ${GG}--preview ${DG}<${CC}line/prompt_number${DG}> ${N}preview a specific prompt"
    echo -e "    ${DG}* ${GG}--use ${DG}<${CC}line/prompt_number${DG}> ${N}set a specific prompt as active"
    echo -e "    ${DG}* ${GG}--inject ${DG}<${CC}line/prompt_number${DG}> ${N}inject a prompt into the ${CC}~/.bashrc ${N}configuration"
    echo -e "    ${DG}* ${GG}--chuser ${DG}<${CC}user${DG}> [<${CC}new_user${DG}>] ${N}replace username in all plugins"
    echo -e "    ${DG}* ${GG}--chhost ${DG}<${CC}host${DG}> [<${CC}new_host${DG}>] ${N}replace hostname in all plugins"
    echo -e "    ${DG}* ${GG}--reset ${N}restore plugins to default (removes custom plugins)"
    echo -e "    ${DG}* ${GG}--list ${N}list all available prompt numbers"
    echo -e "    ${DG}* ${GG}--version ${N}show version information"
    echo -e "    ${DG}* ${GG}--help ${N}show this help message"

    return $?
}

# Copyright (c) 2026 Zeronetsec