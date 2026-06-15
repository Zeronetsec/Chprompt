#!/usr/bin/env python3
# https://github.com/Zeronetsec/Chprompt

import os
import glob
import json

N = "\x1b[0m"
R = "\x1b[1;31m"
GG = "\x1b[0;32m"
CC = "\x1b[0;36m"
DG = "\x1b[1;90m"
WW = "\x1b[0;37m"

target_metadata = os.getenv("root")

if not target_metadata:
    print(f"{R}[!] {N}Variable: {GG}root {N}not found!")
    exit(1)

metadata_path = os.path.join(target_metadata, "metadata", "*.json")

for file_path in glob.glob(metadata_path):
    try:
        with open(file_path, 'r', encoding='utf-8') as f:
            data = json.load(f)
            
            command = data.get("Command", "")
            args = data.get("Args", "")
            desc = data.get("Description", "")
            
            if args:
                fullcmd = f"{GG}{command} {CC}{args}{N}"
            else:
                fullcmd = f"{GG}{command}{N}"
                
            print(f"    {DG}* {fullcmd}")
            print(f"    {DG}└── {WW}{desc}{N}")
            
    except (json.JSONDecodeError, KeyError, PermissionError) as e:
        continue

# Copyright (c) 2026 Zeronetsec