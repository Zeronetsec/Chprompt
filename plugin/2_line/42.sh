#!/usr/bin/env bash
# Chprompt Project

echo -ne "
\033[36m┌── \033[32m$(command whoami) \033[37mat \033[33m~/$(command basename "$(pwd)")
\033[36m└─ \033[35m$(if [[ "$EUID" -eq 0 ]]; then echo '#'; else echo '$'; fi)\033[0m
"

export PS1='\[\033[0m\]\n\[\033[36m\]┌── \[\033[32m\]\u \[\033[37m\]at \[\033[33m\]\w\n\[\033[36m\]└─ \[\033[35m\]\$\[\033[0m\] '

# Copyright (c) 2026 Zeronetsec