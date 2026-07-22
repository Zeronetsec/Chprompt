#!/usr/bin/env bash
# https://github.com/Zeronetsec/Chprompt

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

export root="$(cd "${dir}/.." && pwd)"

if [[ "${1}" == '--init' ]]; then
    bashrc="${2:-${HOME}/.bashrc}"

    echo -ne "source ${root}/chprompt.sh" \
        >> "${bashrc}"
    ex=${?}

    echo -e "${B}[*] ${N}Injected code: ${GG}source ${root}/chprompt.sh ${DG}-> ${GG}${bashrc}${N}"
    exit ${ex}
fi

echo -ne "${root}"

# Copyright (c) 2026 Zeronetsec