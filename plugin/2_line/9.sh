#!/usr/bin/env bash
# Chprompt Project

echo -ne "
\033[38;5;93m$(command whoami)@$(command hostname) \033[1;31m$(command date +%H:%M) \033[38;5;80m[\033[0m~/$(command basename "$(pwd)")\033[38;5;80m]
\033[38;5;199m▻\033[0m
"

export PS1='\[\033[0m\]\n\[\033[38;5;93m\]\u@\h \[\033[1;31m\]\A \[\033[38;5;80m\][\[\033[0m\]\w\[\033[38;5;80m\]]\n\[\033[38;5;199m\]▻\[\033[0m\] '

# Copyright (c) 2026 Zeronetsec