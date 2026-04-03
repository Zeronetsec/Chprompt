<!-- Chprompt Project -->

[![version](https://img.shields.io/badge/Chprompt-Version%201.0-blue.svg?maxAge=259200)]()
[![os](https://img.shields.io/badge/Supported%20OS-Linux-blue.svg)]()
[![license](https://img.shields.io/badge/License-MIT-blue.svg)](LICENSE)

# Chprompt
Chprompt is a simple, lightweight, and zero-dependency tool to switch your Linux PS1 prompt instantly. <br>
Choose from over 100+ built-in prompt styles.

## Preview
<details>
<summary>Show Preview</summary>
<br>
<img src=".preview/preview_1.png" width="500">
<br><br>
<img src=".preview/preview_2.png" width="500">
<br><br>
<img src=".preview/preview_3.png" width="500">
<br>
</details>

## Features
- Native PS1 Management
- Live Preview Mode
- Session-Based Styling
- Persistent Configuration

## Disclaimer
Chprompt modifies your **~/.bashrc**. While it is theoretically safe—as it filters line-by-line and creates a backup of your original **~/.bashrc**—please use it only if you are confident with these changes. <br>
This tool is specifically designed for Bash (.bashrc). Forcing it to run on Zsh (.zshrc) or other shells may lead to compatibility issues. <br>
Some advanced prompt styles require Nerd Fonts to display icons and symbols correctly.

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
```

## License
This project is licensed under the MIT License. <br>

<!-- Copyright (c) 2026 Zeronetsec -->