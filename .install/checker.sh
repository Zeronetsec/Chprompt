function install::checker() {
    if command -v ${targetins} &>/dev/null; then
        echo -e "${GG}[+] ${N}${targetins^} installed!"
        echo -e "${GG}[+] ${N}Usage: ${GG}source ~/.bashrc && ${targetins} --help ${N}to reload the shell configuration and show helper"
        return 0
    else
        echo -e "${R}[!] ${N}Failed installing: ${GG}${targetins}${N}"
        return 1
    fi
}; readonly -f install::checker