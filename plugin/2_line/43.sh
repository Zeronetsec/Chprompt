#!/usr/bin/env bash
# Chprompt Project

echo -ne "
\033[44;37m $(command whoami) \033[0m\033[34m \033[42;30m ~/$(command basename "$(pwd)") \033[0m\033[32m \033[0m
\033[31m❯\033[0m
"

export PS1='\[\033[0m\]\n\[\033[44;37m\] \u \[\033[0m\033[34m\] \[\033[42;30m\] \w \[\033[0m\033[32m\] \[\033[0m\]\n\[\033[31m\]❯\[\033[0m\] '

# Copyright (c) 2026 Zeronetsec