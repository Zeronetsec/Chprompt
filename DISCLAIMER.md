<!-- https://github.com/Zeronetsec/Chprompt -->

# DISCLAIMER
This tool is designed specifically for **Bash** environments. <br>
Forcing it to run on other shells may lead to corruption or unintended damage to your shell configuration.

By using this tool, you acknowledge and accept the following risks:
- **Shell Modification**  
  This tool modifies your `~/.bashrc` file.
  Ensure that you fully understand and trust the changes being made before proceeding.

- **Preview Mode Warning**  
  The `--preview` flag currently utilizes `eval` internally.
  Always review plugins and configurations carefully before using this feature.

- **Plugin Execution**  
  Plugins operate using raw code, allowing full control over ANSI sequences and escape codes.
  This provides flexibility but also increases risk.

- **Security Risks**  
  Do **not** install plugins from untrusted or unknown sources.
  Malicious plugins may contain backdoors or execute harmful shell commands.

- **Font Requirements**  
  Some prompts require a **Nerd Font** to render correctly.
  Without it, icons or symbols may not display as intended.

## Use at Your Own Risk
You are responsible for any changes made to your system. <br>
It is strongly recommended to back up your configuration files before using this tool. <br>

<!-- Copyright (c) 2026 Zeronetsec -->