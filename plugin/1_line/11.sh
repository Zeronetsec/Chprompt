#!/usr/bin/env bash
# Chprompt Project

echo -ne "
\033[1;90m(\033[1;31m$(command date +%H:%M)\033[1;90m)-(\033[0;31m$(command basename "$(pwd)")\033[1;90m) \033[1;32m$(command whoami)\033[0m@\033[35m$(command hostname)\033[0m:\033[0;34m~/$(command basename "$(pwd)")\033[0m:\033[0;37m$(if [[ "$EUID" -eq 0 ]]; then echo '#'; else echo '$'; fi)\033[0m
"

export PS1='\[\033[0m\]\n\[\033[1;90m\](\[\033[1;31m\]\A\[\033[1;90m\])-(\[\033[0;31m\]$(command basename "$(pwd)")\[\033[1;90m\]) \[\033[1;32m\]\u\[\033[0m\]@\[\033[35m\]\h\[\033[0m\]:\[\033[0;34m\]\w\[\033[0m\]:\[\033[0;37m\]\$\[\033[0m\] '

# Copyright (c) 2026 Zeronetsec