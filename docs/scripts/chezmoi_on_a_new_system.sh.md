# Initialize Chezmoi on a New System

---

**chezmoi_on_a_new_system.sh**: Script to initialize and apply Chezmoi configuration for user 'matias-ceau'.

---

### Dependencies

- `bash`: The GNU Bourne Again SHell, a command processor that typically runs in a text window.
- `curl`: Command-line tool for transferring data with URL syntax.
- `chezmoi`: A command-line tool to manage your dotfiles across multiple machines.

### Description

This script automates the process of initializing and applying dotfiles using Chezmoi on a new system. Chezmoi is a powerful tool for managing personal configuration files (dotfiles) across multiple machines. The script fetches the Chezmoi installation script via `curl` and immediately executes it with options to initialize and apply the configurations specified by the GitHub user 'matias-ceau'.

The command is structured as follows:
- `curl -fsLS get.chezmoi.io`: This command fetches the installation script for Chezmoi. The options `-fsLS` are used to enhance the command's reliability by controlling its behavior:
  - `-f`: Fail silently on server errors.
  - `-s`: Silent mode to reduce output.
  - `-L`: Follow redirects, if any.
  - `-S`: Show error if it fails.
- `-- init --apply matias-ceau`: Tells Chezmoi to initialize and apply the dotfiles for the user `matias-ceau`.

### Usage

To execute this script, simply run it from the terminal. It can be included as part of a system initialization process, executed automatically, or bound to a key combination in your qtile configuration.

```bash
bash /home/matias/.scripts/meta/run_once/chezmoi_on_a_new_system.sh
```

**Example Usage:**

Run it directly in the terminal:
```bash
./chezmoi_on_a_new_system.sh
```

Assign to a keybinding in qtile:
```python
Key([mod, "control"], "c", lazy.spawn("/home/matias/.scripts/meta/run_once/chezmoi_on_a_new_system.sh"))
```

---

> [!TIP] While this script is concise and performs its function efficiently, consider wrapping the curl command in a conditional statement to handle potential errors during the download or execution of the installation script. Additionally, logging success or failure can aid in troubleshooting any setup issues.