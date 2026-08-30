#!/usr/bin/env bash

set -o errexit

src="${BASH_SOURCE[0]}"
while [[ -h "${src}" ]]; do
    dir="$(
        cd -P "$(
            command dirname "${src}"
        )" > /dev/null 2>&1 && pwd
    )"
    src="$(command readlink "${src}")"
    [[ "${src}" != /* ]] && src="${dir}/${src}"
done

dir="$(
    cd -P "$(
        command dirname "${src}"
    )" > /dev/null 2>&1 && pwd
)"

export root="${dir}"; readonly root
source "${root}/.install/include.sh"

include : '(
    .install/color
    .install/variable
    .install/error
    .install/getinstall
)'

HOME="${HOME}"
__RMBK__=false
__RMC__=false
__RC__=".bashrc"

while [[ ${#} -gt 0 ]]; do
    case "${1}" in
        "--home="*) export HOME="${1#*=}" ;;
        "--remove-backup") export __RMBK__=true ;;
        "--no-remove-code") export __RMC__=true ;;
        "--rc="*) export __RC__="$(command basename "${1#*=}")"
    esac
    shift
done

if [[ "${__RMBK__}" == true ]]; then
    install::getinstall \
        "command rm -f ${opt}/${targetins}_*.zip.bak" \
        "Removing all backup..."
fi

install::getinstall \
    "command rm -rf ${opt}/${targetins}" \
    "Removing: ${color_GG}${opt}/${targetins}${color_N}"

install::getinstall \
    "command rm -f ${bin}/${targetins}" \
    "Removing: ${color_GG}${bin}/${targetins}${color_N}"

if [[ "${__RMC__}" == false ]]; then
    install::getinstall \
        "
            command cat ${HOME}/${__RC__} | \
                command grep -v '${targetins}' \
                > ${tmp}/${targetins}_uninstall
        " \
        "Filtering: ${color_GG}${HOME}/${__RC__} ${color_DG}-> ${color_GG}${tmp}/${targetins}_uninstall${color_N}"

    install::getinstall \
        "
            command mv \
                ${tmp}/${targetins}_uninstall \
                ${HOME}/${__RC__}
        " \
        "Moving: ${color_GG}${tmp}/${targetins}_uninstall ${color_DG}-> ${color_GG}${HOME}/${__RC__}${color_N}"
fi

echo -e "${color_GG}[+] ${color_N}${targetins^} removed!"

trap - EXIT
exit ${?}