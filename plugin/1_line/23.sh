#!/usr/bin/env bash
# Chprompt Project

echo -ne "
\033[38;5;214m󱑒 $(command date +%T) \033[38;5;141m ~/$(command basename "$(pwd)") \033[38;5;141m\033[0m
"

export PS1='\[\033[0m\]\n\[\033[38;5;214m\]󱑒 \t \[\033[38;5;141m\] \w \[\033[38;5;141m\]\[\033[0m\] '

# Copyright (c) 2026 Zeronetsec