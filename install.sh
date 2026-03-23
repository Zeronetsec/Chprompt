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

function install() {
    local cmd="$1"
    local desc="$2"
    echo -e "\n${B}[*] ${N}${desc}"
    eval "${cmd}" >/dev/null
    local status=$?
    echo -e "    ${N}exit: ${GG}${status}${N}"
}

function getinstall() {
    if command -v apt >/dev/null 2>&1; then
        installw="command apt install -y"
    elif command -v apk >/dev/null 2>&1; then
        installw="command apk add"
    elif command -v pacman >/dev/null 2>&1; then
        installw="command pacman -S --noconfirm"
    else
        exit 1
    fi

    echo -e "$1" | while IFS= read -r line; do
        [[ -z "$line" ]] && continue
        IFS="::" read -ra pkgs <<< "$line"
        for pkg in "${pkgs[@]}"; do
            pkg="$(echo -e "$pkg" | command xargs)"
            if eval "$installw $pkg" 2>/dev/null; then
                break
            fi
        done
    done
}

printf '\n'
echo -e "${N}Enter path to your ${GG}chprompt ${N}folder"
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
    install \
        "getinstall ${i}" \
        "Installing: ${GG}${i}${N}"
done

if [[ ! -d "$base" ]]; then
    install \
        "command mkdir -p ${base}" \
        "Created directory: ${GG}${base}${N}"
fi

if [[ -d "$base/chprompt" ]]; then
    echo -ne "\033[?25h\n"
    read -p "$(echo -e "${N}Do you wan't to backup ${GG}${base}/chprompt${N}? (y/n) ")" chs
    echo -ne "\033[?25l"

    if [[ "$chs" == 'y' ]]; then
        cd "$base"
        install \
            "command zip -r chprompt_${bkdate}.bak.zip chprompt" \
            "Backup: ${GG}${base}/chprompt ${DG}=> ${GG}${base}/chprompt_${bkdate}.bak.zip${N}"
        cd
    fi

    install \
        "command rm -rf ${base}/chprompt" \
        "Removing: ${GG}old chprompt${N}"
fi

install \
    "command mv ${path} ${base}/chprompt" \
    "Moving: ${GG}${path} ${DG}=> ${GG}${base}/chprompt${N}"

install \
    "command chmod +x -R ${base}/chprompt" \
    "Setting up permission"

if [[ ! -f "$bashrc" ]]; then
    install \
        "command touch ${bashrc}" \
        "Touch: ${GG}${bashrc}${N}"
fi

echo -ne "\033[?25h\n"
read -p "$(echo -e "${N}Do you wan't to backup ${GG}${bashrc}${N}? (y/n) ")" chs
echo -ne "\033[?25l"

if [[ "$chs" == 'y' ]]; then
    install \
        "command cp ${bashrc} ${bashrc}.${bkdate}.bak" \
        "Backup: ${GG}${bashrc} ${DG}=> ${GG}${bashrc}.${bkdate}.bak${N}"
fi

install \
    "
        command cat ${bashrc} | \
        command grep -Ev 'source ${base}/chprompt/chprompt.sh|chprompt --use' \
        > ${bashrc}.tmp || true
    " \
    "Filtering: ${GG}${bashrc}${N}"

current_theme="$(
    command grep "chprompt --use" "${bashrc}" | \
    command head -n 1 | \
    command sed 's/.*chprompt --use //'
)"

if [[ -z "$current_theme" ]]; then
    current_theme="default/default"
fi

install \
    "
        {
            echo -e 'source ${base}/chprompt/chprompt.sh'
            echo -e chprompt --use ${current_theme}
        } >> ${bashrc}.tmp
    " \
    "Add command: ${GG}source ${base}/chprompt/chprompt.sh ${DG}=> ${GG}${bashrc}.tmp${N}"

install \
    "command mv ${bashrc}.tmp ${bashrc}" \
    "Moving: ${GG}${bashrc}.tmp ${DG}=> ${GG}${bashrc}${N}"

echo -e "\n${GG}[+] ${N}Chprompt installed!"
echo -e "${GG}[+] ${N}Type: ${GG}source ~/.bashrc && chprompt --help ${N}to reload the shell configuration"
echo -ne "\033[?25h\n"
exit 0

# Copyright (c) 2026 Zeronetsec