#!/usr/bin/env bash
# Chprompt Project

echo -ne "
\033[38;5;244m┌ ~/$(command basename "$(pwd)")
\033[38;5;244m└─\033[38;5;250m»\033[0m
"

export PS1='\[\033[0m\]\n\[\033[38;5;244m\]┌ \w\n\[\033[38;5;244m\]└─\[\033[38;5;250m\]»\[\033[0m\] '

# Copyright (c) 2026 Zeronetsec