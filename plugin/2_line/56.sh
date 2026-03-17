#!/usr/bin/env bash
# Chprompt Project

echo -ne "
\033[38;5;39m󰀵 \033[38;5;75m~/$(command basename "$(pwd)") \033[38;5;172m$(command git branch 2>/dev/null | command grep "^*" | command sed "s/* / /") \033[38;5;220m
󰇙\033[0m
"

export PS1='\[\033[0m\]\n\[\033[38;5;39m\]󰀵 \[\033[38;5;75m\]\w \[\033[38;5;172m\]$(command git branch 2>/dev/null | command grep "^*" | command sed "s/* / /") \[\033[38;5;220m\]\n\[\033[38;5;220m\]󰇙\[\033[0m\] '

# Copyright (c) 2026 Zeronetsec