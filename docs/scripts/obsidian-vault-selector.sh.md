# Obsidian Vault Selector

---

**obsidian-vault-selector.sh**: Script to open any Obsidian vault from a user-defined selection.

---

### Dependencies

- `eza`: A modern replacement for `ls` that offers improved file listing and formatting.
- `ripgrep (rg)`: A fast text searching tool for filtering file types.
- `bat`: A cat clone with syntax highlighting and Git integration.
- `jq`: A lightweight and flexible command-line JSON processor for reading the Obsidian configuration.
- `improved-fzfmenu.sh`: A shell script for displaying a fuzzy finder menu interface (ensure it's available in your path).
- `notify-send`: A tool for sending desktop notifications.

### Description

The `obsidian-vault-selector.sh` script allows users to open their Obsidian vaults easily by selecting from a list provided in a terminal interface. It uses a combination of dependencies, including `eza`, `bat`, `jq`, and fuzzy finding with `improved-fzfmenu.sh`, to enhance the user experience.

1. **Preview Setup**: The script defines functions for previewing vaults (`preview_cmd`), opening a selected vault (`open_vault`), searching for available vaults (`search_cmd`), and displaying labeled directories (`plabel_cmd`).
2. **Vault Searching**: The `search_cmd` function reads the Obsidian configuration to locate available vaults by parsing a JSON file.
3. **Interactive Selection**: Using the fuzzy finder, users can filter their vaults, navigating through the list with a set of defined keybindings.

### Usage

To execute this script, ensure it has execute permissions and run it from a terminal:

```bash
chmod +x /home/matias/.scripts/obsidian-vault-selector.sh
/home/matias/.scripts/obsidian-vault-selector.sh
```

Upon execution, the script will:
1. Display all available Obsidian vaults in a fuzzy menu.
2. Allow you to preview the contents of a selected vault directory.
3. Finally, execute the command to open the chosen vault in Obsidian.

Make sure your `XDG_CONFIG_HOME` is set to the location of your Obsidian configuration files for the script to work correctly.

---

> [!TIP]  
> Consider adding error handling to manage scenarios where the JSON configuration file might not be found or is malformed. Additionally, you could provide a customizable option for users to set their default vault directory for smoother access.