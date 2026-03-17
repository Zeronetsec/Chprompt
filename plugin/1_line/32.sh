#!/usr/bin/env bash
# Chprompt Project

echo -ne "
\033[48;5;39;38;5;232m  ~/$(command basename "$(pwd)") \033[48;5;208;38;5;232m$(command git branch 2>/dev/null | command grep "^*" | command sed "s/* /  /")\033[0m \033[38;5;39m\033[0m
"

export PS1='\[\033[0m\]\n\[\033[48;5;39;38;5;232m\]  \w \[\033[48;5;208;38;5;232m\]$(command git branch 2>/dev/null | command grep "^*" | command sed "s/* /  /")\[\033[0m\] \[\033[38;5;39m\]\[\033[0m\] '

# Copyright (c) 2026 Zeronetsec