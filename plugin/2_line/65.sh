#!/usr/bin/env bash
# Chprompt Project

echo -ne "
\033[48;5;235m\033[38;5;153m╭─[ $(command whoami)@$(command hostname) ]─╮\033[48;5;238m\033[38;5;219m Dir: ~/$(command basename "$(pwd)")\033[0m
\033[48;5;240m\033[38;5;82m╰─❯\033[0m
"

export PS1='\[\033[0m\]\n\[\033[48;5;235m\]\[\033[38;5;153m\]╭─[ \u@\h ]─╮\[\033[48;5;238m\]\[\033[38;5;219m\] Dir: \w\[\033[0m\]\n\[\033[48;5;240m\]\[\033[38;5;82m\]╰─❯\[\033[0m\] '

# Copyright (c) 2026 Zeronetsec