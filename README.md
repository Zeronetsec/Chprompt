<!-- https://github.com/Zeronetsec/Chprompt -->

<div style="display: flex; gap: 5px; justify-content: left;">
    <img src="https://img.shields.io/badge/Chprompt-Version%200.1-blue.svg?style=square&logo=gnu-bash" />
    <img src="https://img.shields.io/badge/Supported%20OS-Linux-blue.svg?style=square&logo=linux" />
    <img src="https://img.shields.io/badge/License-MIT-blue.svg?style=square&logo=github" />
</div>

# Chprompt
Chprompt is a tool for managing and customizing Bash prompts easily and efficiently.

## Features
- Preview available prompts.
- Apply prompts instantly.
- Inject prompts into your shell configuration.
- Change user/host name references inside prompt templates.
- And more features.

## Disclaimer
Please read [.docs/disclaimer.md](.docs/disclaimer.md) before using this tool. </br>
Use this software at your own risk. </br>
The author is not responsible for any damage, data loss, or issues that may result from its use.

## Installation
Quick install:
```bash
git clone https://github.com/Zeronetsec/Chprompt
cd Chprompt
chmod +x install.sh
./install.sh
```
For more detailed installation and uninstallation instructions, see [.docs/install_and_uninstall.md](.docs/install_and_uninstall.md).

## Usage Example
```bash
chprompt --inject 2/52
chprompt --chuser user
chprompt --chuser user newuser
chprompt --show-source 2/52
chprompt --show-ps1 2/52
```
And more commands.

## License
This project is licensed under the MIT License.

<!-- Copyright (c) 2026 Zeronetsec -->