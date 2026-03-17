#!/usr/bin/env bash
# Chprompt Project

echo -ne "
\033[0m$ sudo cat > \"/bin/bash\" << EOF
>
"

export PS1='\[\033[0m\]\n$ sudo cat > "/bin/bash" << EOF\n> '

# Copyright (c) 2026 Zeronetsec