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

    if [[ ! -f "${bashrc}" ]]; then
        command touch "${bashrc}"
    fi

    echo -ne "source ${root}/chprompt.sh" \
        >> "${bashrc}"
    ex=${?}

    echo -e "\x1b[1;34m[*] \x1b[0mInjected code: \x1b[0;32msource ${root}/chprompt.sh \x1b[1;90m-> \x1b[0;32m${bashrc}\x1b[0m"
    exit ${ex}
fi

echo -ne "${root}"

# Copyright (c) 2026 Zeronetsec