# https://github.com/Zeronetsec/Chprompt

function module::Inject() {
    local arg1="${1}"
    local PREFIX="${PREFIX:-/usr}"

    if [[ -z "${arg1}" ]]; then
        utils::missingArgument
        return 1
    fi

    local folder="$(
        echo -e "${arg1}" | \
        command cut -d '/' -f 1
    )"

    local file="$(
        echo -e "${arg1}" | \
        command cut -d '/' -f 2
    )"

    if [[ ! -d "${PREFIX}" ]]; then
        command mkdir -p "${PREFIX}"
    fi

    if [[ ! -f "${root}/plugin/${folder}_line/${file}.chp" ]]; then
        echo -e "${R}[!] ${N}Prompt: ${GG}${folder}/${file} ${N}not found!"
        return 1
    fi

    command cat "${lhome}" | \
        command grep -vE '^\s*chprompt --use */*' \
            > "${PREFIX}/tmp/chprompt_bashrc.tmp"

    echo -e "chprompt --use ${folder}/${file}" \
        >> "${PREFIX}/tmp/chprompt_bashrc.tmp"

    command cat "${PREFIX}/tmp/chprompt_bashrc.tmp" \
        > "${lhome}"

    command rm -f "${PREFIX}/tmp/chprompt_bashrc.tmp"

    source <(
        printf 'export PS1=%q\n' "$(
            utils::getblock 'Execute' \
            "${root}/plugin/${folder}_line/${file}.chp" | \
            command grep -vE '^\s*(#|$)' | \
            command tr -d '\n' | \
            command sed 's/%space%/ /g'
        )"
    )

    return 0
}

# Copyright (c) 2026 Zeronetsec