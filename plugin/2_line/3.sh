#!/usr/bin/env bash
# Chprompt Project

echo -ne "
\033[38;5;244m┌──(\033[1;31m$(command whoami)\033[38;5;244m(𖤍)\033[1;31m$(command hostname)\033[38;5;244m)-(\033[0;33m~/$(command basename "$(pwd)")\033[38;5;244m)
\033[38;5;244m└──\033[38;5;254m$(if [[ "$EUID" -eq 0 ]]; then echo '#'; else echo '$'; fi)\033[0m
"

export PS1='\[\033[0m\]\n\[\033[38;5;244m\]┌──(\[\033[1;31m\]\u\[\033[38;5;244m\](𖤍)\[\033[1;31m\]\h\[\033[38;5;244m\])-(\[\033[0;33m\]\w\[\033[38;5;244m\])\n\[\033[38;5;244m\]└──\[\033[38;5;254m\]\$\[\033[0m\] '

# Copyright (c) 2026 Zeronetsec