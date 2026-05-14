# https://github.com/Zeronetsec/Chprompt

function helper() {
    local birth_date="03-10"
    local today="$(command date '+%m-%d')"
    local myroot="$(command chprompt 2>/dev/null)"

    if [[ -z "${myroot}" ]]; then
        echo -e "${R}[!] ${N}Chprompt path not found!"
    fi

    if [[ "${today}" == "${birth_date}" ]]; then
        echo -e "${R}› ${N}Happy birthday for ${GG}chprompt ${N}🎉"
        printf '\n'
    fi

    echo -e "${N}Usage: ${GG}chprompt ${CC}<command> [<args>]${N}"

    printf '\n'
    echo -e "${N}Available commands:"

    for file in "${myroot}/metadata"/*.json; do
        command="$(command jq -r '.Command' "${file}")"
        args="$(command jq -r '.Args' "${file}")"
        desc="$(command jq -r '.Description' "${file}")"

        if [[ -n "${args}" ]]; then
            fullcmd="${GG}${command} ${CC}${args}${N}"
        else
            fullcmd="${GG}${command}${N}"
        fi

        echo -e "    ${DG}* ${fullcmd} ${DG}- ${WW}${desc}${N}"
    done

    return $?
}

# Copyright (c) 2026 Zeronetsec