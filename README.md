<!-- https://github.com/Zeronetsec/Chprompt -->

[![version](https://img.shields.io/badge/Chprompt-Version%200.1-blue.svg?maxAge=259200)]()
[![os](https://img.shields.io/badge/Supported%20OS-Linux-blue.svg)]()
[![license](https://img.shields.io/badge/License-MIT-blue.svg)](LICENSE)

# Chprompt
Chprompt is a simple, and lightweight tool to switch your Linux PS1 prompt instantly. <br>
Choose from over 100+ built-in prompt styles.

## Features
- Native PS1 Management
- Live Preview Mode
- Session-Based Styling
- Persistent Configuration
- And more.

## Disclaimer
This tool modifies your `~/.bashrc` and executes raw code in plugins. <br>
Please read the
[DISCLAIMER](DISCLAIMER.md)
before use. <br>
Use at your own risk.

## Installation
```bash
git clone https://github.com/Zeronetsec/Chprompt
cd Chprompt
chmod +x install.sh

# termux / linux (root)
./install.sh # --backup

# linux (user)
sudo HOME=$HOME ./install.sh # --backup
```

## Usage
``` bash
chprompt --preview <line>/<prompt_number>
chprompt --use <line>/<prompt_number>
chprompt --inject <line>/<prompt_number>
chprompt --audit
chprompt --list
```
And more commands.

## License
This project is licensed under the MIT License.

<!-- Copyright (c) 2026 Zeronetsec -->