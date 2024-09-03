# Obsidian Vault Selector

---

**obsidian-vault-selector.sh**: Script to easily open any Obsidian vault from the terminal

---

### Dependencies

- `bash`: The shell used to execute the script.
- `eza`: A modern replacement for `ls` that offers advanced file listing features.
- `rg` (Ripgrep): A command-line search tool that recursively searches your current directory for a regex pattern.
- `fd`: A simple, fast, and user-friendly alternative to `find`.
- `improved-fzfmenu.sh`: A custom script that utilizes `fzf` to present a menu with file previews.

### Description

The `obsidian-vault-selector.sh` script provides a convenient way to select and open an Obsidian vault from your terminal. It traverses your designated personal knowledge management (PKM) folder to identify `.obsidian` directories using `fd`. Each found vault is listed in a user-friendly menu powered by `fzf`.

The script utilizes two main functions:
- `preview_cmd()`: This function generates a preview of the contents of an Obsidian vault. It lists files in the vault while excluding certain file types (JavaScript, CSS, images, and zip files).
- `open_vault()`: This function opens the selected vault in Obsidian using the appropriate URL scheme. If no vault is selected, it triggers a desktop notification indicating that no selection was made.

### Usage

To run the script, ensure you have the necessary dependencies installed. You can execute the script from the terminal like so:

```bash
bash /home/matias/.scripts/obsidian-vault-selector.sh
```

#### Example Usage
1. Open your terminal.
2. Execute the script by running:
    ```bash
    /home/matias/.scripts/obsidian-vault-selector.sh
    ```
3. A menu will appear listing all available Obsidian vaults.
4. Select a vault using the arrow keys, and hit Enter to open it in Obsidian.

This script can also be easily aliased in your shell profile for quicker access.

---

> [!TIP]  
> The script currently lacks error handling for cases where no `.obsidian` directories are found. Implementing checks for this scenario could enhance user experience. Additionally, consider allowing the user to specify a different directory for the vaults, rather than hardcoding `$HOME/PKM`. This can make the script more versatile.