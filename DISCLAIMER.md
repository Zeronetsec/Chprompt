<!-- https://github.com/Zeronetsec/Chprompt -->

# DISCLAIMER
## **Version 0.1 (Experimental Status)** <br>
This tool is currently in its early **v0.1** stage and is considered **unstable**. <br>
You may encounter bugs, system errors, or unexpected behavior. <br>
Additionally, core structures, commands, and language configurations are highly subject to change in future updates.

This tool is designed specifically for **Bash** environments. <br>
Forcing it to run on other shells may lead to corruption or unintended damage to your shell configuration.

By using this tool, you acknowledge and accept the following risks:
- **Shell Modification** <br>
  This tool modifies your `~/.bashrc` file. <br>
  Ensure that you fully understand and trust the changes being made before proceeding.

- **Preview Mode Warning** <br>
  The `--preview` flag currently utilizes `eval` internally. <br>
  Always review plugins and configurations carefully before using this feature.

- **Plugin Execution** <br>
  Plugins operate using raw code, allowing full control over ANSI sequences and escape codes. <br>
  This provides flexibility but also increases risk.

- **Security Risks** <br>
  Do **not** install plugins from untrusted or unknown sources. <br>
  Malicious plugins may contain backdoors or execute harmful shell commands.

- **Font Requirements** <br>
  Some prompts require a **Nerd Font** to render correctly. <br>
  Without it, icons or symbols may not display as intended.

## Use at Your Own Risk
You are responsible for any changes made to your system. <br>
It is strongly recommended to back up your configuration files before using this tool. <br>

<!-- Copyright (c) 2026 Zeronetsec -->