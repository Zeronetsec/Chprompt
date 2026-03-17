#!/usr/bin/env bash
# Chprompt Project

echo -ne "
\033[48;5;53;97m $(command whoami)@$(command hostname) \033[48;5;91m \033[48;5;163m \033[48;5;198;30m ~/$(command basename "$(pwd)") \033[0m
λ
"

export PS1='\[\033[0m\]\n\[\033[48;5;53;97m\] \u@\h \[\033[48;5;91m\] \[\033[48;5;163m\] \[\033[48;5;198;30m\] \w \[\033[0m\]\nλ '

# Copyright (c) 2026 Zeronetsec