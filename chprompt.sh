#!/usr/bin/env bash
# https://github.com/Zeronetsec/Chprompt

function chprompt() {
    export chppath="${PREFIX}/opt/chprompt"

    local require=(
        "utils/color"
        "utils/help"
        "utils/uwu"
        "utils/version"
        "utils/list"
        "utils/preview"
        "utils/inject"
        "utils/use"
        "utils/getblock"
        "utils/chuser"
        "utils/chhost"
        "utils/reset"
    )

    for chload in "${require[@]}"; do
        source "${chppath}/${chload}.sh"
    done

    case "$1" in
        "")
            echo -e "${R}[!] ${N}Invalid input!"
            echo -e "${R}[!] ${N}Try: ${GG}chprompt --help${N}"
            ;;
        "--list")
            list
            ;;
        "--preview")
            preview "${2}"
            ;;
        "--use")
            use "${2}"
            ;;
        "--inject")
            inject "${2}"
            ;;
        "--chuser")
            shift
            chuser "${@}"
            ;;
        "--chhost")
            shift
            chhost "${@}"
            ;;
        "--reset")
            resetplugin
            ;;
        "--uwu")
            uwu
            ;;
        "--version")
            version
            ;;
        "--help")
            helper
            ;;
        *)
            echo -e "${R}[!] ${N}Invalid input: ${GG}${1}${N}"
            echo -e "${R}[!] ${N}Try: ${GG}chprompt --help${N}"
            ;;
    esac

    unsetvar=(
        "N"
        "R"
        "DG"
        "GG"
        "BB"
        "CC"
        "chppath"
        "require"
        "chload"
    )

    for itr in "${unsetvar[@]}"; do
        unset "${itr}"
    done

    unsetfnc=(
        "list"
        "preview"
        "use"
        "inject"
        "help"
        "version"
        "uwu"
        "getblock"
        "chuser"
        "chhost"
        "resetplugin"
    )

    for itr in "${unsetfnc[@]}"; do
        unset -f "${itr}"
    done

    unset unsetvar
    unset unsetfnc
    unset itr
}

# Copyright (c) 2026 Zeronetsec