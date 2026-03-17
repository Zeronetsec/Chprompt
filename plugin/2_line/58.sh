#!/usr/bin/env bash
# Chprompt Project

echo -ne "
\033[38;5;250m[== $(command whoami)@$(command hostname) ==]
\033[38;5;250m[== ~/$(command basename "$(pwd)") ==] ➤\033[0m
"

export PS1='\[\033[0m\]\n\[\033[38;5;250m\][== \u@\h ==]\n\[\033[38;5;250m\][== \w ==] ➤\[\033[0m\] '

# Copyright (c) 2026 Zeronetsec