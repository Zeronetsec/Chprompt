<!-- https://github.com/Zeronetsec/Chprompt -->

# Installation
`install.sh` optional options (can be used together):
- `--home=<path>`
- └── override `$HOME` value.
- `--backup`
- └── crete backup of the exiting source installation before replacing it.

### Usage
```bash
git clone https://github.com/Zeronetsec/Chprompt
bash Chprompt/install.sh <options>
```

# Uninstallation
`uninstall.sh` optional options (can be used together):
- `--home=<path>`
- └── override `$HOME` value.
- `--remove-backup`
- └── remove all backups found.
- `--no-remove-code`
- └── do not remove code from `.bashrc`.

### Usage
```bash
export prefix="${PREFIX:-/usr}"
bash $prefix/opt/chprompt/uninstall.sh <options>
```

<!-- Copyright (c) 2026 Zeronetsec -->