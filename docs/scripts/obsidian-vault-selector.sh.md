# Obsidian Vault Selector

---

**obsidian-vault-selector.sh**: Opens any Obsidian vault with a user-friendly selector.

---

### Dependencies

- `eza`: A modern replacement for `ls` that supports rich formatting and icons.
- `rg`: Ripgrep, a line-oriented search tool that's faster than `grep`.
- `bat`: A `cat` clone with syntax highlighting and Git integration.
- `jq`: A lightweight command-line JSON processor.
- `improved-fzfmenu.sh`: A script for creating a fuzzy search interface.

### Description

The `obsidian-vault-selector.sh` script provides a command-line utility to select and open an Obsidian vault. It integrates various commands to facilitate a user-friendly selection process and presents a list of available vaults with previews.

The main functions in the script are:

- **`preview_cmd`**: Uses `eza` to list directory contents in a formatted way and filters out certain file types (like `.js`, `.css`, etc.) while using `bat` for enhanced readability.
- **`open_vault`**: Constructs the command to open an Obsidian vault based on the selected path, with a notification if no vault is chosen.
- **`search_cmd`**: Reads the `obsidian.json` configuration file to retrieve paths of available vaults, using `jq` for JSON extraction.
- **`plabel_cmd`**: Prepares a formatted display of directories for preview.

The selection process utilizes `improved-fzfmenu.sh` to create an interactive menu, allowing for easy browsing and selection of vaults, with real-time previews of their contents.

### Usage

To run this script, execute it from a terminal. The script does not require any command-line arguments and will launch an interactive vault selector.

```bash
bash /home/matias/.scripts/obsidian-vault-selector.sh
```

1. The script displays all available Obsidian vaults.
2. You can navigate through the list and select a vault using arrow keys.
3. A preview of the vault's contents will be displayed at the top.
4. Press `Enter` to open the selected vault in Obsidian.

---

> [!TIP] 
> The script might encounter issues if `jq` or other dependencies are not installed. Consider adding a check at the beginning of the script to ensure all required tools are available. Additionally, enhancing error handling could improve user experience, particularly in the `open_vault` function for better feedback on failures.