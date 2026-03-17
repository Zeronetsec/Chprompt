#!/usr/bin/env bash
# Chprompt Project

echo -ne "
\033[1;30m$(command date '+%Y-%m-%d %H:%M:%S')
\033[1;37m~/$(command basename "$(pwd)") \033[1;30m
$(if [[ "$EUID" -eq 0 ]]; then echo '#'; else echo '$'; fi)\033[0m
"

export PS1='\[\033[0m\]\n\[\033[1;30m\]\D{%F %T}\n\[\033[1;37m\]\w \[\033[1;30m\]\n\$\[\033[0m\] '

# Copyright (c) 2026 Zeronetsec