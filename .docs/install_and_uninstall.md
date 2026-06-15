<!-- https://github.com/Zeronetsec/Chprompt -->

# Installation
`install.sh` optional options (can be used together):
- `--backup`
- `--home=<path>`

Use `--backup` to create a backup of the existing Chprompt installation before replacing it. </br>
Use `--home=<path>` when running the installer with sudo to ensure the target home directory is used instead of `/root`.

## Termux & Linux (root)
```bash
git clone https://github.com/Zeronetsec/Chprompt
cd Chprompt
chmod +x install.sh
./install.sh
```

## Linux (user)
```bash
git clone https://github.com/Zeronetsec/Chprompt
cd Chprompt
chmod +x install.sh
sudo ./install.sh --home=/home/<target_user>
```

# Uninstallation
```bash
export prefix="${PREFIX:-/usr}"
rm -f "${prefix}/bin/chprompt"
rm -rfv "${prefix}/opt/chprompt"
cat ~/.bashrc | grep -v "chprompt" > ~/.bashrc.tmp
cat ~/.bashrc.tmp > ~/.bashrc
source ~/.bashrc
```

<!-- Copyright (c) 2026 Zeronetsec -->