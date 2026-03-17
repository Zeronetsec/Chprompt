#!/usr/bin/env bash
# Chprompt Project

echo -ne "
\033[1;31m[ $(command date +%T) ] ◉ $(command whoami)@$(command hostname)\033[0m
\033[1;34m[ ~/$(command basename "$(pwd)") ]\033[0m $(EXIT_CODE=$?; if [[ $EXIT_CODE -eq 0 ]]; then echo -e "\033[1;32mλ"; else echo -e "\033[1;31m$EXIT_CODE"; fi) \033[1;37m» \033[0m
"

export PS1='\[\033[0m\]\n\[\033[1;31m\][ \t ] ◉ \u@\h\[\033[0m\]\n\[\033[1;34m\][ \w ]\[\033[0m\] $(EXIT_CODE=$?; if [[ $EXIT_CODE -eq 0 ]]; then echo -e "\[\033[1;32m\]λ"; else echo -e "\[\033[1;31m\]$EXIT_CODE"; fi) \[\033[1;37m\]»\[\033[0m\] '

# Copyright (c) 2026 Zeronetsec