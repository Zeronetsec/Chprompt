#!/usr/bin/env bash
# Chprompt Project

echo -ne "
\033[1;35m+====================+
\033[1;36m| User: $(command whoami)
| Host: $(command hostname)
| Dir:  ~/$(command basename "$(pwd)")
\033[1;35m+====================+
\033[1;32m❯❯❯\033[0m
"

export PS1='\[\033[0m\]\n\[\033[1;35m\]+====================+\n\[\033[1;36m\]| User: \u\n| Host: \h\n| Dir:  \w\n\[\033[1;35m\]+====================+\n\[\033[1;32m\]❯❯❯\[\033[0m\] '

# Copyright (c) 2026 Zeronetsec