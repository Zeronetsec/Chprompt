#!/usr/bin/env bash
# Chprompt Project

echo -ne "
\033[1;34m┌──(\033[1;31m$(command whoami)\033[1;90m@\033[1;31m$(command hostname)\033[1;34m)-(\033[0;36m~/$(command basename "$(pwd)")\033[1;34m)
\033[1;34m└──\033[1;31m$(if [[ "$EUID" -eq 0 ]]; then echo '#'; else echo '$'; fi)\033[0m
"

export PS1='\[\033[0m\]\n\[\033[1;34m\]┌──(\[\033[1;31m\]\u\[\033[1;90m\]@\[\033[1;31m\]\h\[\033[1;34m\])-(\[\033[0;36m\]\w\[\033[1;34m\])\n\[\033[0;34m\]└──\[\033[1;31m\]\$\[\033[0m\] '

# Copyright (c) 2026 Zeronetsec