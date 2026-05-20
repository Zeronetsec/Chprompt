#!/usr/bin/env python3
# https://github.com/Zeronetsec/Chprompt

import os
import sys
import re

N = "\033[0m"
R = "\033[1;31m"
B = "\033[1;34m"
GG = "\033[0;32m"
DG = "\033[1;90m"
CC = "\033[0;36m"

def load_patterns(pattern_file_path):
    if not pattern_file_path or not os.path.exists(pattern_file_path):
        print(f"{R}[!] {N}Pattern file: {GG}{pattern_file_path} {N}not found!")
        sys.exit(1)

    compiled_patterns = []
    with open(pattern_file_path, 'r', encoding='utf-8', errors='ignore') as f:
        for line in f:
            clean_line = line.strip()
            if not clean_line or clean_line.startswith('#'):
                continue

            escaped_pattern = re.escape(clean_line)
            pattern_regex = rf"{escaped_pattern}"

            if clean_line[0].isalnum():
                pattern_regex = rf"\b{pattern_regex}"
            if clean_line[-1].isalnum():
                pattern_regex = rf"{pattern_regex}\b"
            compiled_patterns.append(re.compile(pattern_regex))
    return compiled_patterns

def scan_plugin(plugin_dir, patterns):
    if not plugin_dir or not os.path.exists(plugin_dir):
        print(f"{R}[!] {N}Plugin directory: {GG}{plugin_dir} {N}not found!")
        sys.exit(1)

    match_count = 0
    for root, _, files in os.walk(plugin_dir):
        for file in files:
            file_path = os.path.join(root, file)
            try:
                with open(file_path, 'r', encoding='utf-8', errors='ignore') as f:
                    for line_num, line in enumerate(f, 1):
                        if any(pattern.search(line) for pattern in patterns):
                            match_count += 1
                            print(f"{GG}[+] {N}Found {match_count}: {GG}{file_path} {DG}({CC}{line.strip()}{DG}){N}")
            except Exception:
                continue

    print(f"\n{B}[*] {N}Total: {GG}{match_count} {N}malicious pattern found")

if __name__ == "__main__":
    PLUGIN_PATH = os.getenv("plugin")
    PATTERN_PATH = os.getenv("pattern")

    if not PLUGIN_PATH or not PATTERN_PATH:
        print(f"{R}[!] {N}Missing variable: {GG}plugin {N}and {GG}pattern{N}")
        sys.exit(1)

    keywords = load_patterns(PATTERN_PATH)
    scan_plugin(PLUGIN_PATH, keywords)

# Copyright (c) 2026 Zeronetsec