#!/usr/bin/env bash
# Chprompt Project

echo -ne "
\033[38;5;46m▌Ξ user:$(command whoami) host:$(command hostname) exit:$? Ξ▌
\033[0m▌Ξ path:~/$(command basename "$(pwd)") Ξ▌❯\033[0m
"

export PS1='\[\033[0m\]\n\[\033[38;5;46m\]▌Ξ user:\u host:\h exit:$(echo -e "$?") Ξ▌\n▌Ξ path:\w Ξ▌❯\[\033[0m\] '

# Copyright (c) 2026 Zeronetsec