#!/usr/bin/env bash
# Chprompt Project

echo -ne "
\033[1;34mDirectory: ~/$(command basename "$(pwd)")
\033[1;32mUser: $(command whoami) \033[1;37m>>\033[0m
"

export PS1='\[\033[0m\]\n\[\033[1;34m\]Directory: \w\n\[\033[1;32m\]User: \u \[\033[1;37m\]>>\[\033[0m\] '

# Copyright (c) 2026 Zeronetsec