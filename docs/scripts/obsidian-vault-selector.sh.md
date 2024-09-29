# Obsidian Vault Selector

---

<<<<<<< Updated upstream
**obsidian-vault-selector.sh**: Bash script for selecting and opening an Obsidian vault efficiently
=======
**obsidian-vault-selector.sh**: Script to select and open an Obsidian vault from a directory.
>>>>>>> Stashed changes

---

### Dependencies

<<<<<<< Updated upstream
- `bash`: The shell language to execute the script.
- `obsidian`: Required to open vaults via URI.
- `eza`: A modern replacement for `ls`, used for listing directories with enhanced features.
- `rg` (ripgrep): Utilized for efficiently filtering file types.
- `bat`: A `cat` clone with syntax highlighting and Git integration.
- `jq`: Command-line JSON processor to parse the Obsidian configuration file.
- `notify-send`: Sends desktop notifications.
- `improved-fzfmenu.sh`: A custom script for enhanced fuzzy file selection using `fzf`.

### Description

This script facilitates selecting and opening an Obsidian vault with improved user interaction and visual representation. It fetches available vaults from the configuration file located at `$XDG_CONFIG_HOME/obsidian/obsidian.json`, leveraging `jq` to parse the vault paths. With `improved-fzfmenu.sh`, it provides an interactive menu for vault selection, enhanced by `eza`, `bat`, and `rg` for a detailed preview excluding specific file types like `.js` or `.css`. Notifications are sent if no vault is selected.

The `open_vault` function opens Obsidian with the selected vault, utilizing `setsid` to detach and spawn the process, ensuring the terminal isn't blocked.

### Usage

Run the script via terminal to interactively select and open a vault:
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

```bash
./obsidian-vault-selector.sh
```

<<<<<<< Updated upstream
Ensure that the script and its dependencies have the necessary executable permissions. You can bind this script to a key combination in `qtile` for quick access, using a similar configuration:

```python
Key([mod], "o", lazy.spawn("/home/matias/.scripts/obsidian-vault-selector.sh")),
```

Make sure `improved-fzfmenu.sh` is accessible in your PATH or adjust the script to its location.

---

> [!TIP] Consider handling possible errors, such as missing dependencies, by adding preliminary checks and informative messages. Improving input validation and providing fallback support can enhance script robustness. Additionally, ensure `improved-fzfmenu.sh` and other custom script dependencies are well-documented or bundled for better portability and reuse.
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
