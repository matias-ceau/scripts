# Obsidian Vault Selector

---

**obsidian-vault-selector.sh**: A script to easily select and open any Obsidian vault from your filesystem.

---

### Dependencies

- `bash`: The shell where the script is executed.
- `eza`: A modern replacement for `ls` that provides advanced options and colorful output.
- `rg` (ripgrep): A fast search tool, used here for excluding specific file types from the output.
- `fd`: A simple, fast, and user-friendly alternative to `find`, used to locate Obsidian vaults.
- `improved-fzfmenu.sh`: A custom menu script for presenting the vault selection dialog with a preview feature.

### Description

The **Obsidian Vault Selector** script allows you to quickly choose an Obsidian vault to open from your Personal Knowledge Management (PKM) directory. It leverages the power of tools like `fd`, `eza`, and `ripgrep` to efficiently list and filter directories.

1. **Vault Discovery**: The script uses `fd` to find all directories containing the `.obsidian` folder, indicative of an Obsidian vault.
2. **Preview Functionality**: The `preview_cmd` function generates a preview of the contents in the selected vault, excluding specific file types such as `.js`, `.css`, or images.
3. **Opening the Vault**: Upon selecting a vault, the `open_vault` function constructs a command to launch Obsidian with the selected vault's URL.

### Usage

1. To use the script, simply run it in a terminal:
   ```bash
   bash ~/path/to/obsidian-vault-selector.sh
   ```

2. You will see a list of Obsidian vaults (directories) within your defined PKM path. 

3. Use the arrow keys to select a vault and press Enter. 

4. If no vault is selected, a notification will alert you that selection was unsuccessful.

---

> [!TIP]  
> Consider adding error handling for scenarios where dependencies might not be installed. Additionally, you could enhance user experience by adding a command-line option to specify a different vault directory.