#!/usr/bin/env bash
# Chprompt Project

echo -ne "
\033[1m[\033[36m$(command whoami)@$(command hostname)\033[37m] \033[34m~/$(command basename "$(pwd)")\033[0m
$(EXIT_CODE=$?; if [[ $EXIT_CODE -eq 0 ]]; then echo -e "\033[32m✔"; else echo -e "\033[31m✖ ($EXIT_CODE)"; fi) \033[37m>\033[0m
"

export PS1='\[\033[0m\]\n\[\033[1m\][\[\033[36m\]\u@\h\[\033[37m\]] \[\033[34m\]\w\[\033[0m\]\n$(EXIT_CODE=$?; if [[ $EXIT_CODE -eq 0 ]]; then echo -e "\[\033[32m\]✔"; else echo -e "\[\033[31m\]✖ ($EXIT_CODE)"; fi) \[\033[37m\]>\[\033[0m\] '

# Copyright (c) 2026 Zeronetsec