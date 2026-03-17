#!/usr/bin/env bash
# Chprompt Project

echo -ne "
\033[0m╔═[$(command whoami)@$(command hostname)]══[ ~/$(command basename "$(pwd)") ]
╚➤
"

export PS1='\[\033[0m\]\n╔═[\u@\h]══[ \w ]\n╚➤ '

# Copyright (c) 2026 Zeronetsec