#!/usr/bin/env bash
# Chprompt Project

echo -ne "
\033[38;5;160m刀  $(command whoami)@$(command hostname)
\033[38;5;81m刀  ~/$(command basename "$(pwd)") ❯\033[0m
"

export PS1='\[\033[0m\]\n\[\033[38;5;160m\]刀  \u@\h\n\[\033[38;5;81m\]刀  \w ❯\[\033[0m\] '

# Copyright (c) 2026 Zeronetsec