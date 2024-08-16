# Obsidian Vault Selector

---

<<<<<<< Updated upstream
**obsidian-vault-selector.sh**: A script to select and open an Obsidian vault from a specified directory.
=======
**obsidian-vault-selector.sh**: Script to select and open an Obsidian vault from a directory.
>>>>>>> Stashed changes

---

### Dependencies

<<<<<<< Updated upstream
- `fd`: A simple, fast and user-friendly alternative to `find`. Used for locating `.obsidian` directories.
- `awk`: A text processing tool used for pattern scanning and processing.
- `fzfmenu.sh`: A command-line fuzzy finder script for selecting files or directories interactively.
- `notify-send`: A command to send desktop notifications.

### Description

The `obsidian-vault-selector.sh` script is designed to facilitate users in selecting and opening their Obsidian vaults quickly. The script performs this through several key steps:

1. It uses `fd` to locate all directories containing the `.obsidian` folder, which signifies that they are valid Obsidian vaults.
2. The output of `fd` is piped through `awk` to extract just the vault names based on directory structure.
3. The resulting vault names are displayed interactively using `fzfmenu.sh`, which allows users to select their desired vault.
4. If a vault is selected, the script constructs a special URI to open the Obsidian application with that vault using the command `obsidian`. 
5. If no vault is selected, it displays a notification indicating that no vault was chosen.

### Usage

To use the script, follow these steps:
=======
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
>>>>>>> Stashed changes

1. Make sure you have the necessary dependencies installed: `fd`, `awk`, `fzfmenu.sh`, and `notify-send`.
2. Grant execute permission to the script if not already done:
   ```bash
   chmod +x /home/matias/.scripts/obsidian-vault-selector.sh
   ```
3. Run the script from the terminal:
   ```bash
   /home/matias/.scripts/obsidian-vault-selector.sh
   ```

Alternatively, you can bind the script to a key in your window manager. For instance, add the following line in your `qtile` configuration:
```python
Key([mod], "o", lazy.spawn("/home/matias/.scripts/obsidian-vault-selector.sh")),
```

<<<<<<< Updated upstream
---

> [!TIP] 
Consider adding error handling for cases where external commands (like `fd`, `awk`, or `obsidian`) might fail. Additionally, you could enhance usability by allowing users to specify custom directories via command-line arguments or environment variables.
=======
3. Follow the interactive prompts to select an Obsidian vault. Once a vault is selected, it will open automatically in the Obsidian application.

```bash
# Example command to run the script
$ /home/matias/.scripts/obsidian-vault-selector.sh
```

---

> [!TIP]  
> The script currently lacks error handling for commands like `eza`, `rg`, and `fd`. Consider adding checks to ensure these commands are available and handle scenarios where no vaults are found more gracefully. Additionally, using `notify-send` without checking the `cmd` execution may lead to missing notifications if opening fails. It can be useful to log errors or provide feedback if the vault fails to open.
>>>>>>> Stashed changes
