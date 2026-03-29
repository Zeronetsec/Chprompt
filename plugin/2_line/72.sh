#!/usr/bin/env bash
# Chprompt Project

echo -ne "
\033[38;5;110m╭─($(command whoami)@$(command hostname))─╮\033[0m
\033[38;5;147m╰─(~/$(command basename "$(pwd)"))─❯\033[0m
"

export PS1='\[\033[0m\]\n\[\033[38;5;110m\]╭─(\u@\h)─╮\[\033[0m\]\n\[\033[38;5;147m\]╰─(\w)─❯\[\033[0m\] '

# Copyright (c) 2026 Zeronetsec