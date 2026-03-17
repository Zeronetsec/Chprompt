#!/usr/bin/env bash
# Chprompt Project

echo -ne "
\033[0;36m┌──(\033[0;32m$(command whoami)\033[1;90m(/\)\033[0;32m$(command hostname)\033[0;36m)-(\033[0;31m~/$(command basename "$(pwd)")\033[0;36m)
\033[0;36m└──\033[1;90m$(if [[ "$EUID" -eq 0 ]]; then echo '#'; else echo '$'; fi)\033[0m
"

export PS1='\[\033[0m\]\n\[\033[0;36m\]┌──(\[\033[0;32m\]\u\[\033[1;90m\](/\)\[\033[0;32m\]\h\[\033[0;36m\])-(\[\033[0;31m\]\w\[\033[0;36m\])\n\[\033[0;36m\]└──\[\033[1;90m\]\$\[\033[0m\] '

# Copyright (c) 2026 Zeronetsec