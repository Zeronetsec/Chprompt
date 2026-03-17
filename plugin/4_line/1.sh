#!/usr/bin/env bash
# Chprompt Project

echo -ne "
\033[1;32m▌░░ \033[1;31m[$(command date +%T)] \033[1;32m░░▌
\033[1;36m▌ User:$(command whoami)  Host:$(command hostname)  Exit:$? ▌
\033[1;35m▌ Dir:~/$(command basename "$(pwd)") ▌
\033[1;32m▶\033[0m
"

export PS1='\[\033[0m\]\n\[\033[1;32m\]▌░░ \[\033[1;31m\][\t] \[\033[1;32m\]░░▌\n\[\033[1;36m\]▌ User:\u  Host:\h  Exit:$? ▌\n\[\033[1;35m\]▌ Dir:\w ▌\n\[\033[1;32m\]▶\[\033[0m\] '

# Copyright (c) 2026 Zeronetsec