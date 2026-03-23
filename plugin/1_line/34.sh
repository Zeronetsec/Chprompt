#!/usr/bin/env bash
# Chprompt Project

echo -ne "
\033[38;5;153m─≈─ $(command whoami)@$(command hostname) | ~/$(command basename "$(pwd)") ─≈─ ❯\033[0m
"

export PS1='\[\033[0m\]\n\[\033[38;5;153m\]─≈─ \u@\h | \w ─≈─ ❯\[\033[0m\] '

# Copyright (c) 2026 Zeronetsec