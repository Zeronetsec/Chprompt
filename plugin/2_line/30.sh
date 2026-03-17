#!/usr/bin/env bash
# Chprompt Project

echo -ne "
\033[0;36m┏━━[\033[1;31m$(command whoami)@$(command hostname)\033[0;36m]━━[\033[1;31m~/$(command basename "$(pwd)")\033[0;36m]\033[0m
\033[0;36m┗▶\033[0m
"

export PS1='\[\033[0m\]\n\[\033[0;36m\]┏━━[\[\033[1;31m\]\u@\h\[\033[0;36m\]]━━[\[\033[1;31m\]\w\[\033[0;36m\]]\[\033[0m\] \n\[\033[0;36m\]┗▶\[\033[0m\] '

# Copyright (c) 2026 Zeronetsec