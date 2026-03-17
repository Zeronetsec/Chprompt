#!/usr/bin/env bash
# Chprompt Project

echo -ne "
\033[90m╭─[ $(command date +%T) ] ━ \033[1;37m$(command whoami)@$(command hostname)\033[90m
╰─[ \033[1;37m~/$(command basename "$(pwd)")\033[90m ] ━ \033[0m$(EXIT_CODE=$?; if [[ $EXIT_CODE -eq 0 ]]; then echo -e "\033[1;32m✔"; else echo -e "\033[1;31m✖ ($EXIT_CODE)"; fi)\033[90m ›\033[0m
"

export PS1='\[\033[0m\]\n\[\033[90m\]╭─[ \t ] ━ \[\033[1;37m\]\u@\h\[\033[90m\]\n\[\033[90m\]╰─[ \[\033[1;37m\]\w\[\033[90m\] ] ━ \[\033[0m\]$(EXIT_CODE=$?; if [[ $EXIT_CODE -eq 0 ]]; then echo -e "\[\033[1;32m\]✔"; else echo -e "\[\033[1;31m\]✖ ($EXIT_CODE)"; fi)\[\033[90m\] ›\[\033[0m\] '

# Copyright (c) 2026 Zeronetsec