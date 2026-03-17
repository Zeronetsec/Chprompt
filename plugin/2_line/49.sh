#!/usr/bin/env bash
# Chprompt Project

echo -ne "
\033[38;5;46m┌──(\033[38;5;220m$(command whoami)@$(command hostname)\033[38;5;46m)─[\033[0m~/$(command basename "$(pwd)")\033[38;5;46m]
└──╼ \033[38;5;196m$(if [[ "$EUID" -eq 0 ]]; then echo '#'; else echo '$'; fi)\033[0m
"

export PS1='\[\033[0m\]\n\[\033[38;5;46m\]┌──(\[\033[38;5;220m\]\u@\h\[\033[38;5;46m\])─[\[\033[0m\]\w\[\033[38;5;46m\]]\n└──╼ \[\033[38;5;196m\]\$\[\033[0m\] '

# Copyright (c) 2026 Zeronetsec