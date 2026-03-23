#!/usr/bin/env bash
# Chprompt Project

function chprompt() {
    local N='\033[0m'
    local R='\033[1;31m'
    local DG='\033[1;90m'
    local GG='\033[0;32m'
    local BB='\033[0;34m'
    local CC='\033[0;36m'

    local path="$PREFIX/opt/chprompt/plugin"
    local folder="$(
        echo -e "$2" | \
        command cut -d '/' -f 1
    )"

    local file="$(
        echo -e "$2" | \
        command cut -d '/' -f 2
    )"

    local faces=(
        "(｡◕‿◕｡)"
        "(≧◡≦)"
        "ʕ•ᴥ•ʔ"
        "(・ω・)"
        "(๑˃ᴗ˂)ﻭ"
        "(ง'̀-'́)ง"
        "(=^･ω･^=)"
    )

    local delay=0.2
    local duration=5
    SECONDS=0
    local tools="chprompt"
    local version="1.0"
    local homepage="https://github.com/Zeronetsec/Chprompt"

    case "$1" in
        "")
            echo -e "${R}[!] ${N}Invalid input!"
            echo -e "${R}[!] ${N}Try: ${GG}chprompt --help${N}"
            return 1
            ;;
        "--preview")
            if [[ ! -f "$path/${folder}_line/${file}.sh" ]]; then
                echo -e "${R}[!] ${N}Prompt: ${GG}${folder}/${file} ${N}not found!"
                return 1
            fi

            command bash "$path/${folder}_line/${file}.sh"
            printf '\n'
            return 0
            ;;
        "--use")
            if [[ ! -f "$path/${folder}_line/${file}.sh" ]]; then
                echo -e "${R}[!] ${N}Prompt: ${GG}${folder}/${file} ${N}not found!"
                return 1
            fi

            source <(
                command cat "$path/${folder}_line/${file}.sh" | \
                command grep -vE '^\s*#|^\s*$' | \
                command grep 'export PS1='
            )
            return 0
            ;;
        "--inject")
            if [[ ! -f "$path/${folder}_line/${file}.sh" ]]; then
                echo -e "${R}[!] ${N}Prompt: ${GG}${folder}/${file} ${N}not found!"
                return 1
            fi

            command cat "$HOME/.bashrc" | \
                command grep -vE '^\s*chprompt --use */*' \
                > "$PREFIX/tmp/chprompt_bashrc.tmp"

            echo -e "chprompt --use ${folder}/${file}" \
                >> "$PREFIX/tmp/chprompt_bashrc.tmp"

            command cat "$PREFIX/tmp/chprompt_bashrc.tmp" \
                > "$HOME/.bashrc"

            command rm -f "$PREFIX/tmp/chprompt_bashrc.tmp"
            source <(
                command cat "$path/${folder}_line/${file}.sh" | \
                command grep -vE '^\s*#|^\s*$' | \
                command grep 'export PS1='
            )
            return 0
            ;;
        "--uwu")
            echo -ne "\033[?25l"
            while (( SECONDS < duration )); do
                for face in "${faces[@]}"; do
                    (( SECONDS >= duration )) && break
                    printf "\r%s\033[K" "$face"
                    command sleep "$delay"
                done
            done
            echo -ne "\033[?25h\n"
            ;;
        "--version")
            echo -e "${N}Project: ${GG}${tools}${N}"
            echo -e "${N}Version: ${GG}${version}${N}"
            echo -e "${N}Homepage: ${GG}${homepage}${N}"
            return 0
            ;;
        "--help")
            echo -ne "${BB}Chprompt is a simple tool to switching the PS1 prompt${N}

${N}Usage:
    ${GG}chprompt --preview ${DG}<${CC}line/prompt_number${DG}> ${N}to preview prompt
    ${GG}chprompt --use ${DG}<${CC}line/prompt_number${DG}> ${N}to use prompt
    ${GG}chprompt --inject ${DG}<${CC}line/prompt_number${DG}> ${N}to inject prompt into ${CC}${HOME}/.bashrc${N}
    ${GG}chprompt --version ${N}to show version
    ${GG}chprompt --help ${N}to show helper message

${N}List:
    ${DG}* ${GG}1${DG}/${GG}1-$(command ls "$path/1_line/" | command wc -l)${N}
    ${DG}* ${GG}2${DG}/${GG}1-$(command ls "$path/2_line/" | command wc -l)${N}
    ${DG}* ${GG}3${DG}/${GG}1-$(command ls "$path/3_line/" | command wc -l)${N}
    ${DG}* ${GG}4${GG}/${GG}1-$(command ls "$path/4_line/" | command wc -l)${N}
    ${DG}* ${GG}5${DG}/${GG}1-$(command ls "$path/5_line/" | command wc -l)${N}
    ${DG}* ${GG}6${DG}/${GG}1-$(command ls "$path/6_line/" | command wc -l)${N}

${N}Example:
    ${GG}chprompt --preview ${CC}2/10${N}
    ${GG}chprompt --use ${CC}2/10${N}
    ${GG}chprompt --inject ${CC}2/10${N}
"
            return 0
            ;;
        *)
            echo -e "${R}[!] ${N}Invalid options: ${GG}${1}${N}"
            echo -e "${R}[!] ${N}Try: ${GG}chprompt --help${N}"
            return 1
            ;;
    esac
}

# Copyright (c) 2026 Zeronetsec