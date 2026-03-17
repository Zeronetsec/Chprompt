#!/usr/bin/env bash
# Chprompt Project

echo -ne "
\033[1;35m╭─ \033[1;32m$(command whoami)@$(command hostname) \033[1;30m($(command date +%T))
\033[1;35m├─ \033[1;34mDirectory: ~/$(command basename "$(pwd)")
\033[1;35m├─ \033[1;33mJobs: $(jobs | command wc -l) \033[1;31m| \033[1;36mSH: $(command basename "$SHELL")
\033[1;35m├─ \033[1;37mMachine: \033[1;32m$(command uname -m)
\033[1;35m╰─>\033[0m
"

export PS1='\[\033[0m\]\n\[\033[1;35m\]╭─ \[\033[1;32m\]\u@\h \[\033[1;30m\](\t)\n\[\033[1;35m\]├─ \[\033[1;34m\]Directory: \w\n\[\033[1;35m\]├─ \[\033[1;33m\]Jobs: \j \[\033[1;31m\]| \[\033[1;36m\]SH: $(command basename "$SHELL")\n\[\033[1;35m\]├─ \[\033[1;37m\]Machine: \[\033[1;32m\]$(command uname -m)\n\[\033[1;35m\]╰─>\[\033[0m\] '

# Copyright (c) 2026 Zeronetsec