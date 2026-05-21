#!/usr/bin/env bash
# https://github.com/Zeronetsec/Chprompt

function chprompt() {
    export chppath="$(command chprompt 2>/dev/null)"
    local excode

    source "${chppath}/utils/include.sh"

    include : '(
        utils/color
        utils/helper
        utils/uwu
        utils/version
        utils/list
        utils/preview
        utils/inject
        utils/use
        utils/getblock
        utils/chuser
        utils/chhost
        utils/reset_plugin
        utils/audit_plugin
    )' || excode=1

    if [[ -z "${chppath}" ]]; then
        echo -e "${R}[!] ${N}Chprompt path not found!"
        excode=1
    fi

    case "${1}" in
        "")
            echo -e "${R}[!] ${N}Invalid input!"
            echo -e "${R}[!] ${N}Try: ${GG}chprompt --help${N}"
            excode=0
            ;;
        "--list")
            utils::List
            excode=$?
            ;;
        "--preview")
            utils::Preview "${2}"
            excode=$?
            ;;
        "--use")
            utils::Use "${2}"
            excode=$?
            ;;
        "--inject")
            utils::Inject "${2}"
            excode=$?
            ;;
        "--chuser")
            shift
            utils::Chuser "${@}"
            excode=$?
            ;;
        "--chhost")
            shift
            utils::Chhost "${@}"
            excode=$?
            ;;
        "--reset")
            utils::ResetPlugin
            excode=$?
            ;;
        "--audit")
            utils::AuditPlugin
            excode=$?
            ;;
        "--uwu")
            utils::Uwu
            excode=$?
            ;;
        "--version")
            utils::Version
            excode=$?
            ;;
        "--help")
            utils::Helper
            excode=$?
            ;;
        *)
            echo -e "${R}[!] ${N}Invalid input: ${GG}${1}${N}"
            echo -e "${R}[!] ${N}Try: ${GG}chprompt --help${N}"
            excode=1
            ;;
    esac

    unsetvar=(
        "N"
        "R"
        "B"
        "DG"
        "GG"
        "BB"
        "CC"
        "WW"
        "chppath"
        "plugin"
        "pattern"
        "excode"
    )

    for itr in "${unsetvar[@]}"; do
        unset "${itr}"
    done

    unsetfnc=(
        "include"
        "utils::List"
        "utils::Preview"
        "utils::Use"
        "utils::Inject"
        "utils::Helper"
        "utils::Version"
        "utils::Uwu"
        "utils::Chuser"
        "utils::Chhost"
        "utils::ResetPlugin"
        "utils::AuditPlugin"
        "utils::getblock"
    )

    for itr in "${unsetfnc[@]}"; do
        unset -f "${itr}"
    done

    unset unsetvar
    unset unsetfnc
    unset itr

    return ${excode}
}

# Copyright (c) 2026 Zeronetsec