#!/usr/bin/env bash
# Chprompt Project

echo -ne "
\033[1;31m▁\033[1;90m▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁\033[1;31m▁▁▁▁
\033[1;31m▌ Current Directory\033[1;90m: ~/$(command basename "$(pwd)") ($(command basename "$(pwd)"))
\033[1;31m▌ Total File\033[1;90m: $(command ls 2>/dev/null | command wc -l)
\033[1;31m▌ Shell\033[1;90m: $(command basename "$SHELL")
\033[1;31m▌ IP\033[1;90m: $(command hostname -i)
\033[1;31m▌ \033[1;34m$(command whoami)\033[1;90m@\033[0;32m$(command hostname) \033[0;33m❯❯❯\033[0m
"

export PS1='\[\033[0m\]\n\[\033[1;31m\]▁\[\033[1;90m\]▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁\[\033[1;31m\]▁▁▁▁\n\[\033[1;31m\]▌ Current Directory\[\033[1;90m\]: \w ($(command basename "$(pwd)"))\n\[\033[1;31m\]▌ Total File\[\033[1;90m\]: $(command ls 2>/dev/null | command wc -l)\n\[\033[1;31m\]▌ Shell\[\033[1;90m\]: $(command basename "$SHELL")\n\[\033[1;31m\]▌ IP\[\033[1;90m\]: $(command hostname -i)\n\[\033[1;31m\]▌ \[\033[1;34m\]\u\[\033[1;90m\]@\[\033[0;32m\]\h \[\033[0;33m\]❯❯❯\[\033[0m\] '

# Copyright (c) 2026 Zeronetsec