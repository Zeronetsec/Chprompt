#!/usr/bin/env bash
# Chprompt Project

echo -ne "
\033[48;5;52m\033[38;5;208m🏮 $(command whoami)@$(command hostname) 🏮\033[48;5;53m\033[38;5;220m ~/$(command basename "$(pwd)") 🏮\033[0m
\033[48;5;54m\033[38;5;82m❯\033[0m
"

export PS1='\[\033[0m\]\n\[\033[48;5;52m\]\[\033[38;5;208m\]🏮 \u@\h 🏮\[\033[48;5;53m\]\[\033[38;5;220m\] \w 🏮\[\033[0m\]\n\[\033[48;5;54m\]\[\033[38;5;82m\]❯\[\033[0m\] '

# Copyright (c) 2026 Zeronetsec