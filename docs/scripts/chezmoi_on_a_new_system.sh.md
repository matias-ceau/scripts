# Initialize Chezmoi on a New System

---

**chezmoi_on_a_new_system.sh**: Automates the setup of Chezmoi on a new Arch Linux system.

---

### Dependencies

- `curl`: A command-line tool for transferring data with URLs. It is used here to fetch the Chezmoi installation script.

### Description

This script automates the initialization of Chezmoi, a tool for managing your dotfiles. When executed, it runs an initial command that fetches and executes a script from Chezmoi's official website, effectively initializing and applying your personal configuration as defined in the remote repository. 

The command:
```bash
"$(curl -fsLS get.chezmoi.io)"
```
uses `curl` to silently fetch the installation script from Chezmoi's website. It then pipes the output to the shell, executing it directly. The `--init --apply matias-ceau` options specify that the script should initialize and apply the configuration for the user with the identifier `matias-ceau`.

### Usage

To use this script, simply execute it in your terminal after a fresh installation of your Arch Linux system. You could run it as follows:

```bash
bash /home/matias/.scripts/sys/setup/chezmoi_on_a_new_system.sh
```

Alternatively, you can create a keybinding in your window manager (qtile) to execute this script for quicker access. For example, you might add a keybinding in your `~/.config/qtile/config.py` that runs the script when a specific key combination is pressed.

---

> [!TIP]  
> While this script is straightforward, consider adding error handling to check if `curl` is installed or if the `chezmoi` command executes successfully. This will enhance the robustness of your setup process and provide feedback in case something goes wrong. Additionally, note that running scripts from the internet can pose security risks; ensure you trust the source and understand what the script does.