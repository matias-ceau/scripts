# Obsidian Vault Selector

---

**obsidian-vault-selector.sh**: Bash script for selecting and opening an Obsidian vault efficiently

---

### Dependencies

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

```bash
./obsidian-vault-selector.sh
```

Ensure that the script and its dependencies have the necessary executable permissions. You can bind this script to a key combination in `qtile` for quick access, using a similar configuration:

```python
Key([mod], "o", lazy.spawn("/home/matias/.scripts/obsidian-vault-selector.sh")),
```

Make sure `improved-fzfmenu.sh` is accessible in your PATH or adjust the script to its location.

---

> [!TIP] Consider handling possible errors, such as missing dependencies, by adding preliminary checks and informative messages. Improving input validation and providing fallback support can enhance script robustness. Additionally, ensure `improved-fzfmenu.sh` and other custom script dependencies are well-documented or bundled for better portability and reuse.