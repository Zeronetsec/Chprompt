#!/usr/bin/env bash
# Chprompt Project

echo -ne "
\033[0m-- \033[0;31m$(command whoami)\033[0;37m@\033[0;31m$(command hostname) \033[0m-- \033[38;5;61m~/$(command basename "$(pwd)")
\033[1;32m$(if [[ "$EUID" -eq 0 ]]; then echo '#'; else echo '$'; fi)\033[0m
"

export PS1='\[\033[0m\]\n\[\033[0m\]-- \[\033[0;31m\]\u\[\033[0;37m\]@\[\033[0;31m\]\h \[\033[0m\]-- \[\033[38;5;61m\]\w\n\[\033[1;32m\]\$\[\033[0m\] '

# Copyright (c) 2026 Zeronetsec