# Obsidian Vault Selector

---

**obsidian-vault-selector.sh**: Script to select and open an Obsidian vault from a directory.

---

### Dependencies

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

3. Follow the interactive prompts to select an Obsidian vault. Once a vault is selected, it will open automatically in the Obsidian application.

```bash
# Example command to run the script
$ /home/matias/.scripts/obsidian-vault-selector.sh
```

---

> [!TIP]  
> The script currently lacks error handling for commands like `eza`, `rg`, and `fd`. Consider adding checks to ensure these commands are available and handle scenarios where no vaults are found more gracefully. Additionally, using `notify-send` without checking the `cmd` execution may lead to missing notifications if opening fails. It can be useful to log errors or provide feedback if the vault fails to open.
