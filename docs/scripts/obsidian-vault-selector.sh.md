# Obsidian Vault Selector

---

**obsidian-vault-selector.sh**: Script to select and open any Obsidian vault.

---

### Dependencies

- `bash`: The shell used to execute the script.
- `eza`: A modern alternative to `ls`, providing enhanced directory listings and file information.
- `rg` (ripgrep): A line-oriented search tool that recursively searches your current directory for a regex pattern.
- `bat`: A cat clone with syntax highlighting and Git integration.
- `jq`: A lightweight and flexible command-line JSON processor.
- `improved-fzfmenu.sh`: A script for fuzzy finding selections with a preview window.

### Description

The `obsidian-vault-selector.sh` script allows users to easily select and open an Obsidian vault stored on their filesystem. It provides a graphical user interface for listing the available vaults using the `improved-fzfmenu.sh` fuzzy finder and displays previews of the selected vault contents. Utilitarian commands like `eza`, `rg`, and `bat` are combined to enhance file listings with notable features, such as color-coding, icon support, and detailed previews of files, excluding certain file types for a cleaner view.

#### Key Functions:
- **`preview_cmd`**: Lists files within the selected vault, excluding specific file types for a focused view.
- **`open_vault`**: Opens the chosen vault in Obsidian using a constructed URI.
- **`search_cmd`**: Extracts available vault paths from Obsidian's configuration, outputting them in a user-friendly format.
- **`plabel_cmd`**: Lists directories in a specified format.

### Usage

To use the script, run the following command in your terminal:

```bash
bash /home/matias/.scripts/obsidian-vault-selector.sh
```

This initiates an interactive session where you can select your desired Obsidian vault. After selecting one, the script will open Obsidian with the chosen vault.

You can bind this script to a key combination in your window manager (Qtile) or executable environment for quick access. For example, you might add it as a keybinding in your `~/.config/qtile/config.py`:

```python
@lazy.function
def open_obsidian_vault(qtile):
    qtile.cmd_spawn('/home/matias/.scripts/obsidian-vault-selector.sh')
```

---

> [!TIP]
> This script could benefit from better error handling, such as checking if necessary commands (`eza`, `rg`, `bat`, etc.) are installed before execution. Additionally, the vault directory extraction process might fail if the configuration file is missing or incorrectly formatted; adding checks would improve robustness. It may also be useful to include a caching mechanism or a quicker way to access frequently used vaults.