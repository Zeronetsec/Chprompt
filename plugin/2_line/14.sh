#!/usr/bin/env bash
# Chprompt Project

echo -ne "
\033[1;32m┌─[$(command whoami)@$(command hostname)]
\033[0m└─[~/$(command basename "$(pwd)")] $(if [[ "$EUID" -eq 0 ]]; then echo '#'; else echo '$'; fi)
"

export PS1='\[\033[0m\]\n\[\033[1;32m\]┌─[\u@\h]\n└─[\w] \$\[\033[0m\] '

# Copyright (c) 2026 Zeronetsec