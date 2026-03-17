#!/usr/bin/env bash
# Chprompt Project

echo -ne "
\033[1;34mdefault@chprompt\033[0m:\033[1;31m~/$(command basename "$(pwd)") \033[0m$(if [[ "$EUID" -eq 0 ]]; then echo '#'; else echo '$'; fi)
"

export PS1='\[\033[0m\]\n\[\033[1;34m\]default@chprompt\[\033[0m\]:\[\033[1;31m\]\w \[\033[0m\]\$ '

# Copyright (c) 2026 Zeronetsec