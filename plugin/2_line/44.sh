#!/usr/bin/env bash
# Chprompt Project

echo -ne "
\033[1;31m[ \033[35m$(command date +%T) \033[31m] \033[32m$(command hostname) \033[37min \033[33m~/$(command basename "$(pwd)")
\033[1;31m╰─>\033[0m
"

export PS1='\[\033[0m\]\n\[\033[1;31m\][ \[\033[35m\]\t \[\033[31m\]] \[\033[32m\]\h \[\033[37m\]in \[\033[33m\]\w\n\[\033[1;31m\]╰─>\[\033[0m\] '

# Copyright (c) 2026 Zeronetsec