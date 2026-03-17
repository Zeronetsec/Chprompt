#!/usr/bin/env bash
# Chprompt Project

echo -ne "
\033[1;35m$(command whoami)@$(command hostname)\033[0m
\033[1;32m~/$(command basename "$(pwd)")\033[0m $(if [[ "$EUID" -eq 0 ]]; then echo '#'; else echo '$'; fi)
"

export PS1='\[\033[0m\]\n\[\033[1;35m\]\u@\h\[\033[0m\]\n\[\033[1;32m\]\w\[\033[0m\] \$ '

# Copyright (c) 2026 Zeronetsec