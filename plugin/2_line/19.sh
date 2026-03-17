#!/usr/bin/env bash
# Chprompt Project

echo -ne "
\033[0;32m$(command whoami)@$(command hostname)\033[0m \033[0;37m~/$(command basename "$(pwd)")\033[0m
>
"

export PS1='\[\033[0m\]\n\[\033[0;32m\]\u@\h\[\033[0m\] \[\033[0;37m\]\w\[\033[0m\]\n> '

# Copyright (c) 2026 Zeronetsec