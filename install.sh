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
    .install/checker
    .install/error
    .install/getinstall
    .install/inpackages
    .install/installer
    .install/prepdir
    .install/zinstall
    .install/zparser
    .install/chmod
)'

__BACKUP__=false
HOME="${HOME}"

while [[ ${#} -gt 0 ]]; do
    case "${1}" in
        "--backup") export __BACKUP__=true ;;
        "--home="*) export HOME="${1#*=}" ;;
    esac
    shift
done

install::inpackages
install::prepdir
install::installer
install::chmod
install::checker

trap - EXIT
exit ${?}