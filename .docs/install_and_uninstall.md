<!-- https://github.com/Zeronetsec/Chprompt -->

# Installation
`install.sh` optional options (can be used together):
- `--backup`
- └── crete backup of the exiting source installation before replacing it.
- `--home=<path>`
- └── when running the installer with sudo to ensure the target home directory is used instead of `/root`.

### Usage
```bash
git clone https://github.com/Zeronetsec/Chprompt
bash Chprompt/install.sh <options>
```

# Uninstallation
`uninstall.sh` optional options (can be used together):
- `--remove-backup`
- └── remove all backups found.
- `--home=<path>`
- └── when running the installer with sudo to ensure the target home directory is used instead of `/root`.
- `--no-remove-code`
- └── do not remove code from `.bashrc`.
- `--no-remove-config`
- └── do not remove `~/.chprompt_bashrc`

### Usage
```bash
export prefix="${PREFIX:-/usr}"
bash $prefix/opt/chprompt/uninstall.sh <options>
```

<!-- Copyright (c) 2026 Zeronetsec -->