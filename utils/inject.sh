# https://github.com/Zeronetsec/Chprompt

function inject() {
    local arg1="${1}"

    local folder="$(
        echo -e "${arg1}" | \
        command cut -d '/' -f 1
    )"

    local file="$(
        echo -e "${arg1}" | \
        command cut -d '/' -f 2
    )"

    if [[ ! -f "${chppath}/plugin/${folder}_line/${file}.chp" ]]; then
        echo -e "${R}[!] ${N}Prompt: ${GG}${folder}/${file} ${N}not found!"
        return 1
    fi

    command cat "${HOME}/.bashrc" | \
        command grep -vE '^\s*chprompt --use */*' \
            > "${PREFIX}/tmp/chprompt_bashrc.tmp"

    echo -e "chprompt --use ${folder}/${file}" \
        >> "${PREFIX}/tmp/chprompt_bashrc.tmp"

    command cat "${PREFIX}/tmp/chprompt_bashrc.tmp" \
        > "${HOME}/.bashrc"

    command rm -f "${PREFIX}/tmp/chprompt_bashrc.tmp"

    source <(
        printf 'export PS1=%q\n' "$(
            getblock 'Execute' \
            "${chppath}/plugin/${folder}_line/${file}.chp" | \
            command grep -vE '^\s*(#|$)' | \
            command tr -d '\n' | \
            command sed 's/%space%/ /g'
        )"
    )
}

# Copyright (c) 2026 Zeronetsec