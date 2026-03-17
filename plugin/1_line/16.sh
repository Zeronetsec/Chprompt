#!/usr/bin/env bash
# Chprompt Project

echo -ne "
\033[1;46;30m $(command whoami)@$(command hostname) \033[49m\033[1;37m→\033[1;45;37m ~/$(command basename "$(pwd)") \033[49m $(EXIT_CODE=$?; if [[ $EXIT_CODE -eq 0 ]]; then echo -e "\033[1;32mλ"; else echo -e "\033[1;31m✖"; fi) \033[1;37m❯\033[0m
"

export PS1='\[\033[0m\]\n\[\033[1;46;30m\] \u@\h \[\033[49m\]\[\033[1;37m\]→\[\033[1;45;37m\] \w \[\033[49m\] $(EXIT_CODE=$?; if [[ $EXIT_CODE -eq 0 ]]; then echo -e "\[\033[1;32m\]λ"; else echo -e "\[\033[1;31m\]✖"; fi) \[\033[1;37m\]❯\[\033[0m\] '

# Copyright (c) 2026 Zeronetsec