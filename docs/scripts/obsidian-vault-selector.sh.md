# Obsidian Vault Selector

---

**obsidian-vault-selector.sh**: Opens and previews Obsidian vaults using improved FZF menu

---

### Dependencies

- `obsidian`: The Obsidian application for managing vaults.
- `eza`: Enhanced version of `ls` that lists files with more options.
- `rg` (Ripgrep): A line-oriented search tool for recursively searching your current directory.
- `bat`: A cat clone with syntax highlighting and Git integration.
- `jq`: Command-line JSON processor.
- `improved-fzfmenu.sh`: A custom script to enhance the fuzzy finder menu. Ensure this script is available in your PATH.
- `setsid`: Utility to run a program in a new session.
- `notify-send`: Send desktop notifications.

### Description

This script is designed to enhance your workflow with Obsidian on an Arch Linux system employing Qtile as a window manager. It provides a dynamic way to open Obsidian vaults by listing available vault directories and offering a preview of the contents. This is achieved using the `eza` command for directory listing, `ripgrep` to filter files, and `bat` for a colorful preview of files. The script extracts the list of vaults from `obsidian.json` and leverages `improved-fzfmenu.sh` for a streamlined, interactive selection process.

The script defines functions to:
- **Preview a directory's contents** with `eza` and `bat`.
- **Open a selected vault** in Obsidian using a custom URI scheme.
- **Search through the Obsidian configuration** to find vault paths.

### Usage

To utilize this script, ensure all dependencies are installed and available in your environment. You can execute the script from your terminal as follows:

```bash
~/.scripts/bin/obsidian-vault-selector.sh
```

On execution, a menu will appear listing your Obsidian vaults. Navigate using your keyboard and select a vault to open it in Obsidian. The script can be integrated into your Qtile WM keybindings for quick access.

---

> [!TIP] The script could be further improved by handling more file types in the preview or by providing detailed error handling for cases like missing vault directories or failed process initializations. Integrating default paths or ensuring `improved-fzfmenu.sh` is properly sourced in your script would also enhance robustness.