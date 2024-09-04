# Obsidian Vault Selector

---

**obsidian-vault-selector.sh**: Script to select and open an Obsidian vault from a directory.

---

### Dependencies

- `bash`: The script is written in Bash, the default shell in many Unix-like systems.
- `eza`: An enhanced version of `ls` for listing directory contents with additional features such as icons.
- `rg` (ripgrep): A command-line search tool that recursively searches your current directory for a regex pattern; used here to filter file types.
- `fd`: A simple, fast, and user-friendly alternative to `find`, used for searching files.
- `improved-fzfmenu.sh`: A custom script presumably providing a user-friendly interface using fzf (fuzzy finder) for interactive selection.

### Description

This script provides an interactive way to select and open any Obsidian vault located within a specified directory (in this case, `$HOME/PKM`). It uses a combination of `fd` to find directories with a `.obsidian` folder, `eza` for a visually appealing directory listing, and `rg` to filter out specific file types (.js, .css, .png, .gif, .svg, .zip) from the results.

The core functionality is contained within two main functions:

- `preview_cmd()`: Prepares a formatted preview of the selected vault's contents.
- `open_vault()`: Opens the selected vault in Obsidian or notifies the user if no vault is selected.

The `vault` variable collects the result of the vault selection process, which is piped into `improved-fzfmenu.sh` for a refined user experience.

### Usage

1. Ensure all dependencies are installed.
2. Execute the script from your terminal:

```bash
bash /home/matias/.scripts/obsidian-vault-selector.sh
```

3. Follow the interactive prompts to select an Obsidian vault. Once a vault is selected, it will open automatically in the Obsidian application.

```bash
# Example command to run the script
$ /home/matias/.scripts/obsidian-vault-selector.sh
```

---

> [!TIP]  
> The script currently lacks error handling for commands like `eza`, `rg`, and `fd`. Consider adding checks to ensure these commands are available and handle scenarios where no vaults are found more gracefully. Additionally, using `notify-send` without checking the `cmd` execution may lead to missing notifications if opening fails. It can be useful to log errors or provide feedback if the vault fails to open.
