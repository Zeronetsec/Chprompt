#!/usr/bin/env bash
# https://github.com/Zeronetsec/Chprompt

src="${BASH_SOURCE[0]}"
while [[ -h "${src}" ]]; do
    dir="$(cd -P "$(
            command dirname "${src}"
        )" >/dev/null 2>&1 && pwd
    )"

    src="$(command readlink "${src}")"
    [[ "${src}" != /* ]] && src="${dir}/${src}"
done

dir="$(cd -P "$(
        command dirname "${src}"
        )" >/dev/null 2>&1 && pwd
    )"

export chprompt_root="$(cd "${dir}/.." && pwd)"
echo -e "${chprompt_root}"

# Copyright (c) 2026 Zeronetsec