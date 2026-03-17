#!/usr/bin/env bash
# Chprompt Project

echo -ne "
\033[38;5;196m⛩️  鬼  $(command whoami)@$(command hostname)  鬼  ⛩️
\033[38;5;39m⚡ ~/$(command basename "$(pwd)") ⚡ ❯\033[0m
"

export PS1='\[\033[0m\]\n\[\033[38;5;196m\]⛩️  鬼  \u@\h  鬼  ⛩️\n\[\033[38;5;39m\]⚡ \w ⚡ ❯\[\033[0m\] '

# Copyright (c) 2026 Zeronetsec