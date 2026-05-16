#!/usr/bin/env python3
# https://github.com/Zeronetsec/Chprompt

import os
import glob
import json

N = "\033[0m"
R = "\033[1;31m"
GG = "\033[0;32m"
CC = "\033[0;36m"
DG = "\033[1;90m"
WW = "\033[0;37m"

target_metadata = os.getenv("myroot")

if not target_metadata:
    print(f"{R}[!] {N}Variable: {GG}target_metadata {N}not found!")
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