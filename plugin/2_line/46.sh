#!/usr/bin/env bash
# Chprompt Project

echo -ne "
\033[48;5;24;97m ❮ $(command whoami)@$(command hostname):~/$(command basename "$(pwd)") ❯ \033[48;5;31m \033[48;5;38m \033[48;5;44m \033[0m
$(if [[ "$EUID" -eq 0 ]]; then echo '#'; else echo '$'; fi)
"

export PS1='\[\033[0m\]\n\[\033[48;5;24;97m\] ❮ \u@\h:\w ❯ \[\033[48;5;31m\] \[\033[48;5;38m\] \[\033[48;5;44m\] \[\033[0m\]\n\$ '

# Copyright (c) 2026 Zeronetsec