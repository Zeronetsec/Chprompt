#!/usr/bin/env bash
# Chprompt Project

echo -ne "
\033[48;5;236;97m ❮ $(command whoami)@$(command hostname):~/$(command basename "$(pwd)") ❯ \033[48;5;240m \033[48;5;245m \033[48;5;250m \033[0m
→
"

export PS1='\[\033[0m\]\n\[\033[48;5;236;97m\] ❮ \u@\h:\w ❯ \[\033[48;5;240m\] \[\033[48;5;245m\] \[\033[48;5;250m\] \[\033[0m\]\n→ '

# Copyright (c) 2026 Zeronetsec