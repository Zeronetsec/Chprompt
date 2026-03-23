#!/usr/bin/env bash
# Chprompt Project

echo -ne "
\033[48;5;52m\033[38;5;196m刀── $(command whoami)@$(command hostname) ──刀\033[48;5;53m\033[38;5;45m Dir: ~/$(command basename "$(pwd)")\033[0m
\033[48;5;52m\033[38;5;82m❯\033[0m
"

export PS1='\[\033[0m\]\n\[\033[48;5;52m\]\[\033[38;5;196m\]刀── \u@\h ──刀\[\033[48;5;53m\]\[\033[38;5;45m\] Dir: \w\[\033[0m\]\n\[\033[48;5;52m\]\[\033[38;5;82m\]❯\[\033[0m\] '

# Copyright (c) 2026 Zeronetsec