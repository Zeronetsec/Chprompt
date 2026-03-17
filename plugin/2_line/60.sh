#!/usr/bin/env bash
# Chprompt Project

echo -ne "
\033[38;5;51m╱╲  $(command whoami)@$(command hostname)  ╱╲
\033[38;5;198m╲╱  ~/$(command basename "$(pwd)")  ╲╱ ❯\033[0m
"

export PS1='\[\033[0m\]\n\[\033[38;5;51m\]╱╲  \u@\h  ╱╲\n\[\033[38;5;198m\]╲╱  \w  ╲╱ ❯\[\033[0m\] '

# Copyright (c) 2026 Zeronetsec