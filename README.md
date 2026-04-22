<!-- https://github.com/Zeronetsec/Chprompt -->

[![version](https://img.shields.io/badge/Chprompt-Version%201.0-blue.svg?maxAge=259200)]()
[![os](https://img.shields.io/badge/Supported%20OS-Linux-blue.svg)]()
[![license](https://img.shields.io/badge/License-MIT-blue.svg)](LICENSE)

# Chprompt
Chprompt is a simple, lightweight, and zero-dependency tool to switch your Linux PS1 prompt instantly. <br>
Choose from over 100+ built-in prompt styles.

## Features
- Native PS1 Management
- Live Preview Mode
- Session-Based Styling
- Persistent Configuration

## Disclaimer
This tool modifies your `~/.bashrc` and executes raw code in plugins. <br>
Please read the
[DISCLAIMER](https://github.com/Zeronetsec/Chprompt/blob/main/DISCLAIMER.md)
before use. <br>
Use at your own risk.

## Installation
```bash
git clone https://github.com/Zeronetsec/Chprompt.git
cd Chprompt
chmod +x install.sh
./install.sh

# for backup
./install.sh --backup
```

## Usage
``` bash
chprompt --preview <line>/<prompt_number>
chprompt --use <line>/<prompt_number>
chprompt --inject <line>/<prompt_number>
chprompt --list
```
And more commands.

## License
This project is licensed under the MIT License. <br>

<!-- Copyright (c) 2026 Zeronetsec -->