#!/usr/bin/env bash
# Chprompt Project

echo -ne "
\033[1;32mλ \033[1;34m$(command whoami)@$(command hostname)\033[0m:\033[1;36m~/$(command basename "$(pwd)")\033[0m
λ
"

export PS1='\[\033[0m\]\n\[\033[1;32m\]λ \[\033[1;34m\]\u@\h\[\033[0m\]:\[\033[1;36m\]\w\[\033[0m\]\nλ '

# Copyright (c) 2026 Zeronetsec