#!/usr/bin/env bash
# Chprompt Project

N='\033[0m'
R='\033[1;31m'
B='\033[1;34m'
GG='\033[0;32m'
DG='\033[1;90m'

base="$PREFIX/opt"
bashrc="$HOME/.bashrc"
bkdate="$(command date +%Y_%b_%d_%H_%M_%S)"

function spinner() {
    local cmd=""
    local msg="Running command"

    for args in "$@"; do
        case "$args" in
            --command=*)
                cmd="${args#*=}"
                ;;
            --message=*)
                msg="${args#*=}"
                ;;
        esac
    done

    function spinner_anim() {
        local pid=$1
        local delay=0.1
        local spinstr='|/-\'

        while kill -0 "$pid" 2>/dev/null; do
            local temp="${spinstr#?}"
            printf " \033[0m[\033[0;32m%c\033[0m] " "$spinstr"
            spinstr="$temp${spinstr%"$temp"}"
            command sleep "$delay"
            printf "\b\b\b\b\b"
        done
        printf "     \b\b\b\b\b"
    }

    echo -ne "${B}[*] ${N}${msg}${N}"
    command bash -c "${cmd}" > /dev/null 2>&1 &
    local pid=$!

    spinner_anim "$pid"
    wait "$pid"
    local status=$?

    if [[ "$status" -eq 0 ]]; then
        echo -ne " ${DG}- ${N}[${GG}✔ ${N}Success]\n"
    else
        echo -ne " ${DG}- ${N}[${R}✖ ${N}Failed (exit code: ${GG}${status}${N})]\n"
        echo -ne "\033[?25h"
        exit $status
    fi
}

printf '\n'
echo -e "${B}[*] ${N}Enter path to your chprompt folder"
read -p "$(echo -e "${N}Path: ")" path
declare -A varmap=(
    ["~"]="$HOME"
    ["\$HOME"]="$HOME"
    ["\$PREFIX"]="$PREFIX"
    ["\$PWD"]="$PWD"
)

for exp in "${!varmap[@]}"; do
    path="${path/#$exp/${varmap[$exp]}}"
done

if [[ ! -d "$path" ]]; then
    echo -e "\n${R}[!] ${N}Folder: ${GG}${path} ${N}not found! \n"
    exit 1
fi

echo -ne "\033[?25l"
echo -e "\n${B}[*] ${N}Installing: ${GG}Chprompt${N}"

pack=(
    "bash"
    "coreutils"
    "sed"
    "grep"
    "gawk"
    "zip"
    "git"
)

for i in "${pack[@]}"; do
    spinner \
        --command="command apt install \"${i}\" -y" \
        --message="Installing: ${GG}${i}${N}"
done

if [[ ! -d "$base" ]]; then
    spinner \
        --command="command mkdir -p \"${base}\"" \
        --message="Created directory: ${GG}${base}${N}"
fi

echo -ne "\033[?25h\n"
read -p "$(echo -e "${B}[*] ${N}Do you wan't to backup ${GG}${base}/chprompt${N}? (y/n) ")" chs
echo -ne "\033[?25l\n"

if [[ "$chs" == 'y' ]]; then
    if [[ -d "$base/chprompt" ]]; then
        cd "$base"
        spinner \
            --command="command zip -r \"chprompt_${bkdate}.bak.zip\" \"chprompt\"" \
            --message="Backup: ${GG}${base}/chprompt ${DG}=> ${GG}${base}/chprompt_${bkdate}.bak.zip${N}"
        cd
    fi
fi

if [[ -d "$base/chprompt" ]]; then
    spinner \
        --command="command rm -rf \"${base}/chprompt\"" \
        --message="Removing: ${GG}old chprompt${N}"
fi

spinner \
    --command="command mv \"${path}\" \"${base}/chprompt\"" \
    --message="Moving: ${GG}${path} ${DG}=> ${GG}${base}/chprompt${N}"

spinner \
    --command="command chmod +x -R \"${base}/chprompt\"" \
    --message="Setting up permission"

if [[ ! -f "$bashrc" ]]; then
    spinner \
        --command="command touch \"${bashrc}\"" \
        --message="Touch: ${GG}${bashrc}${N}"
fi

echo -ne "\033[?25h\n"
read -p "$(echo -e "${B}[*] ${N}Do you wan't to backup ${GG}${bashrc}${N}? (y/n) ")" chs
echo -ne "\033[?25l\n"

if [[ "$chs" == 'y' ]]; then
    spinner \
        --command="command cp \"${bashrc}\" \"${bashrc}.${bkdate}.bak\"" \
        --message="Backup: ${GG}${bashrc} ${DG}=> ${GG}${bashrc}.${bkdate}.bak${N}"
fi

spinner \
    --command="
        command cat \"${bashrc}\" | \
        command grep -Ev 'source \"${base}/chprompt/chprompt.sh\"|chprompt use' \
        > \"${bashrc}.tmp\" || true
    " \
    --message="Filtering: ${GG}${bashrc}${N}"

current_theme="$(
    command grep "chprompt use" "${bashrc}" | \
    command head -n 1 | \
    command sed 's/.*chprompt use //'
)"

if [[ -z "$current_theme" ]]; then
    current_theme="default/default"
fi

spinner \
    --command="
        {
            echo -e 'source \"${base}/chprompt/chprompt.sh\"'
            echo -e \"chprompt use ${current_theme}\"
        } >> \"${bashrc}.tmp\"
    " \
    --message="Add command: ${GG}source ${base}/chprompt/chprompt.sh ${DG}=> ${GG}${bashrc}.tmp${N}"

spinner \
    --command="command mv \"${bashrc}.tmp\" \"$bashrc\"" \
    --message="Moving: ${GG}${bashrc}.tmp ${DG}=> ${GG}${bashrc}${N}"

echo -e "\n${GG}[+] ${N}Chprompt installed!"
echo -e "${GG}[+] ${N}Type: ${GG}source ~/.bashrc && chprompt --help ${N}to reload the shell configuration"
echo -ne "\033[?25h\n"
exit 0

# Copyright (c) 2026 Zeronetsec