#!/usr/bin/env bash
# Chprompt Project

echo -ne "
\033[1;32m┌──(\033[1;34m$(command whoami)㉿$(command hostname)\033[1;32m)-[\033[0m~/$(command basename "$(pwd)")\033[1;32m]
\033[1;32m└──\033[1;34m$(if [[ "$EUID" -eq 0 ]]; then echo '#'; else echo '$'; fi)\033[0m
"

export PS1='\[\033[0m\]\n\[\033[1;32m\]┌──(\[\033[1;34m\]\u㉿\h\[\033[1;32m\])-[\[\033[0m\]\w\[\033[1;32m\]]\n\[\033[1;32m\]└──\[\033[1;34m\]\$\[\033[0m\] '

# Copyright (c) 2026 Zeronetsec