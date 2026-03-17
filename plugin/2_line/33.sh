#!/usr/bin/env bash
# Chprompt Project

echo -ne "
\033[1;42;30m $(command whoami)@$(command hostname) \033[0m\033[1;46;30m ~/$(command basename "$(pwd)") \033[0m
→
"

export PS1='\[\033[0m\]\n\[\033[1;42;30m\] \u@\h \[\033[0m\]\[\033[1;46;30m\] \w \[\033[0m\]\n→ '

# Copyright (c) 2026 Zeronetsec