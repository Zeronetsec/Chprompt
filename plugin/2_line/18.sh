#!/usr/bin/env bash
# Chprompt Project

echo -ne "
\033[1;32m[$(command whoami)]\033[0m-\033[1;34m[$(command hostname)]\033[0m-\033[1;33m[~/$(command basename "$(pwd)")]\033[0m
→
"

export PS1='\[\033[0m\]\n\[\033[1;32m\][\u]\[\033[0m\]-\[\033[1;34m\][\h]\[\033[0m\]-\[\033[1;33m\][\w]\[\033[0m\]\n→ '

# Copyright (c) 2026 Zeronetsec