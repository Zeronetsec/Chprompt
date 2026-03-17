#!/usr/bin/env bash
# Chprompt Project

echo -ne "
\033[38;5;23m ~/$(command basename "$(pwd)") \033[38;5;33m💀 \033[38;5;81m❯\033[0m
"

export PS1='\[\033[0m\]\n\[\033[38;5;23m\] \w \[\033[38;5;33m\]💀 \[\033[38;5;81m\]❯\[\033[0m\] '

# Copyright (c) 2026 Zeronetsec