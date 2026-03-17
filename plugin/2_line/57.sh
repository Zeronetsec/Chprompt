#!/usr/bin/env bash
# Chprompt Project

echo -ne "
\033[1;34m┌──(\033[1;32m󰭹 $(command whoami)\033[1;34m)-[\033[0;37m~/$(command basename "$(pwd)")\033[1;34m]$(command git branch 2>/dev/null | command grep "^*" | command sed "s/* /—[ /; s/$/]/")
\033[1;34m└─\033[1;32m\033[0m
"

export PS1='\[\033[0m\]\n\[\033[1;34m\]┌──(\[\033[1;32m\]󰭹 \u\[\033[1;34m\])-[\[\033[0;37m\]\w\[\033[1;34m\]]$(command git branch 2>/dev/null | command grep "^*" | command sed "s/* /—[ /; s/$/]/")\n\[\033[1;34m\]└─\[\033[1;32m\]\[\033[0m\] '

# Copyright (c) 2026 Zeronetsec