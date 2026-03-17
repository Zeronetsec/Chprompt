#!/usr/bin/env bash
# Chprompt Project

echo -ne "
\033[38;5;46m>>> USER=$(command whoami) | HOST=$(command hostname) | DIR=~/$(command basename "$(pwd)") <<<
\033[0m>>> ❯
"

export PS1='\[\033[0m\]\n\[\033[38;5;46m\]>>> USER=\u | HOST=\h | DIR=\w <<<\n\[\033[0m\]>>> ❯ '

# Copyright (c) 2026 Zeronetsec