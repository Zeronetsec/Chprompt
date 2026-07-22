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

while [[ ${#} -gt 0 ]]; do
    case "${1}" in
        "--home="*) export HOME="${1#*=}" ;;
        "--remove-backup") export __RMBK__=true ;;
        "--no-remove-code") export __RMC__=true ;;
    esac
    shift
done

if [[ "${__RMBK__}" == true ]]; then
    install::getinstall \
        "command rm -f ${opt}/chprompt_*.zip.bak" \
        "Removing all backup..."
fi

install::getinstall \
    "command rm -rf ${opt}/chprompt" \
    "Removing: ${GG}${opt}/chprompt${N}"

install::getinstall \
    "command rm -f ${bin}/chprompt" \
    "Removing: ${GG}${bin}/chprompt${N}"

if [[ "${__RMC__}" == false ]]; then
    install::getinstall \
        "
            command cat ${HOME}/.bashrc | \
                command grep -v 'chprompt' \
                > ${tmp}/chprompt_uninstall
        " \
        "Filtering: ${GG}${HOME}/.bashrc ${GG}-> ${GG}${tmp}/chprompt_uninstall"

    install::getinstall \
        "
            command mv \
                ${tmp}/chprompt_uninstall \
                ${HOME}/.bashrc
        " \
        "Moving: ${GG}${tmp}/chprompt_uninstall ${DG}-> ${GG}${HOME}/.bashrc${N}"
fi

echo -e "${GG}[+] ${N}Chprompt removed"

trap - EXIT
exit ${?}