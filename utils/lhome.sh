# https://github.com/Zeronetsec/Chprompt

function utils::lhome() {
    local config_file="${root}/config/chprompt_bashrc.txt"
    if [[ ! -f "${config_file}" ]]; then
        echo -e "${R}[!] ${N}File: ${GG}${config_file} ${N}not found!"
        return 1
    fi

    local raw_line
    raw_line="$(
        command grep -v -E \
            '^[[:space:]]*(#|$)' \
            "${config_file}" | \
            command head -n 1
    )"

    if [[ -z "${raw_line}" ]]; then
        echo -e "${R}[!] ${N}Bashrc not set!"
        echo -e "${R}[!] ${N}Fallback to: ${GG}${HOME}/.bashrc${N}"

        echo -ne "${HOME}/.bashrc" > "${config_file}"
        export lhome="${HOME}/.bashrc"
        return 1
    fi

    raw_line="${raw_line/#\~/${HOME}}"
    export lhome="${raw_line}"

    if [[ ! -f "${lhome}" ]]; then
        echo -e "${R}[!] ${N}Bashrc: ${GG}${lhome} ${N}not found!"
        echo -e "${R}[!] ${N}Fallback to: ${GG}${HOME}/.bashrc${N}"

        echo -ne "${HOME}/.bashrc" > "${config_file}"
        export lhome="${HOME}/.bashrc"
        return 1
    fi
}

# Copyright (c) 2026 Zeronetsec