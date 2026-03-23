#!/usr/bin/env bash
# Chprompt Project

echo -ne "
\033[48;5;235m\033[38;5;196m▛▀▀▀▀▀▜ $(command whoami)@$(command hostname) ▛▀▀▀▀▀▜\033[0m
\033[48;5;236m\033[38;5;207m▌ Dir: ~/$(command basename "$(pwd)") ▌
\033[48;5;237m\033[38;5;82m▌❯\033[0m
"

export PS1='\[\033[0m\]\n\[\033[48;5;235m\]\[\033[38;5;196m\]▛▀▀▀▀▀▜ \u@\h ▛▀▀▀▀▀▜\[\033[0m\]\n\[\033[48;5;236m\]\[\033[38;5;207m\]▌ Dir: \w ▌\n\[\033[48;5;237m\]\[\033[38;5;82m\]▌❯\[\033[0m\] '

# Copyright (c) 2026 Zeronetsec