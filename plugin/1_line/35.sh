#!/usr/bin/env bash
# Chprompt Project

echo -ne "
\033[31m$(command whoami)\033[m@\033[34m$(command hostname)\033[m:\033[32m~/$(command basename "$(pwd)")\033[0m$(if [[ "$EUID" -eq 0 ]]; then echo '#'; else echo '$'; fi)
"

export PS1='\[\033[0m\]\n\[\033[31m\]\u\[\033[m\]@\[\033[34m\]\h\[\033[m\]:\[\033[32m\]\w\[\033[0m\]\$ '

# Copyright (c) 2026 Zeronetsec