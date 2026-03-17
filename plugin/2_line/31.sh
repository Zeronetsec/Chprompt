#!/usr/bin/env bash
# Chprompt Project

echo -ne "
\033[1;44;37m $(command whoami)@$(command hostname) \033[0m\033[1;46;30m ~/$(command basename "$(pwd)")
\033[0mλ
"

export PS1='\[\033[0m\]\n\[\033[1;44;37m\] \u@\h \[\033[0m\]\[\033[1;46;30m\] \w \[\033[0m\]\nλ '

# Copyright (c) 2026 Zeronetsec