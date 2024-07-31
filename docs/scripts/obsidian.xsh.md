# Obsidian Vault Selector Script

---

**[obsidian.xsh](/obsidian.xsh)**: A script to open Obsidian vaults using a selection menu.

---

### Dependencies

- `xonsh`: The shell that powers this script.
- `fzfmenu.sh`: A command-line fuzzy finder that allows for selecting vaults easily.
- `notify-send`: A utility for sending desktop notifications.
- `eza`: A modern reimplementation of `ls` with Git integration and more.

### Description

This script automates the process of selecting and opening Obsidian vaults from a specified directory (`$HOME/PKM`). It first collects the names of directories inside this path, which are considered as vaults. The script leverages the `fzfmenu.sh` utility for a user-friendly selection interface, allowing users to preview the contents of the vaults based on their modification time.

The main components of the script are:

1. **Vault Collection**: 
   The script generates a list of potential vaults from the `$HOME/PKM` directory, filtering only directories.
   
2. **Vault Selection**:
   Using `fzfmenu.sh`, users can browse and select from the directories available, with a preview feature showing the files (sorted by modification time).
   
3. **Opening Vaults**: 
   Upon selecting a vault, the script constructs a specific URI to open the vault with Obsidian. If no vault is selected, a notification is sent to inform the user.

### Usage

To use the script, ensure it is executable and run it in your terminal:

```bash
chmod +x /home/matias/.scripts/obsidian.xsh
/home/matias/.scripts/obsidian.xsh
```

You can also bind this script to a key combination in your window manager (Qtile). Here's a sample key binding definition:

```python
Key([mod], "o", lazy.spawn("/home/matias/.scripts/obsidian.xsh")),
```

The script will display a selection menu with available vaults. Simply navigate using the keyboard to choose a desired vault.

---

> [!TIP]
> The script currently lacks error handling for cases where the `$HOME/PKM` directory does not exist or is empty. Adding checks for these conditions can improve robustness.
> Furthermore, consider adding a feature for vault search to enhance usability, allowing users to quickly filter vaults by name.
