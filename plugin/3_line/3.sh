#!/usr/bin/env bash
# Chprompt Project

echo -ne "
\033[48;5;52m\033[38;5;45m╔═▸─[ $(command whoami)@$(command hostname) ]─▸═╗\033[0m
\033[48;5;52m\033[38;5;207m║ Dir: ~/$(command basename "$(pwd)") ░ Shell: $(command basename "$SHELL") ║
\033[48;5;52m\033[38;5;82m╚═▸ ❯\033[0m
"

export PS1='\[\033[0m\]\n\[\033[48;5;52m\]\[\033[38;5;45m\]╔═▸─[ \u@\h ]─▸═╗\[\033[0m\]\n\[\033[48;5;52m\]\[\033[38;5;207m\]║ Dir: \w ░ Shell: $(command basename "$SHELL") ║\n\[\033[48;5;52m\]\[\033[38;5;82m\]╚═▸ ❯\[\033[0m\] '

# Copyright (c) 2026 Zeronetsec