# Obsidian Vault Selector

---

**obsidian-vault-selector.sh**: Select and open an Obsidian vault from all available vaults using an interactive fuzzy finder.

---

### Dependencies

- `bash`: Required shell interpreter.
- `obsidian`: The [Obsidian](https://obsidian.md/) note-taking application.
- `jq`: For parsing JSON configuration file of Obsidian.
- `eza`: Modern replacement for `ls`, used for directory listing and tree view.
- `bat`: A `cat` clone with syntax highlighting (for file previews).
- `rg` (ripgrep): For filtering out unnecessary files in previews.
- `notify-send`: To show desktop notifications (used if nothing is selected).
- `improved-fzfmenu.sh`: User script; an enhanced wrapper/interface to `fzf` (fuzzy finder), with support for custom previews and label bindings.
- `setsid`: To detach the obsidian open command.
- **(Recommended)**: Ensure the `$XDG_CONFIG_HOME/obsidian/obsidian.json` exists and is up to date.

---

### Description

This script provides a TUI (terminal UI) selector for your Obsidian vaults and opens the chosen vault directly. It parses the vault list from your main Obsidian configuration JSON file, then presents them with an `fzf`-powered interactive menu enriched with previews using `eza` and `bat`.  
Features include:

- Displaying vaults found in `obsidian.json`
- Listing contents and a directory tree within preview
- Filtering out common binary or build artifacts in previews (`.js`, `.css`, images, etc.)
- Click-to-open vault with the proper Obsidian URL handler (`obsidian://`)
- Notification if no selection is made
- Nicely colored/structured output leveraging `eza`, `bat`, and `rg`
- Custom preview window layout and label updates for clarity while browsing

---

### Usage

Save and make the script executable:
```sh
chmod +x ~/.scripts/bin/obsidian-vault-selector.sh
```

To launch the selector (from terminal, dmenu, or keybinding):
```sh
~/.scripts/bin/obsidian-vault-selector.sh
```

- The script will open an interactive terminal menu, displaying all found vaults.
- Use fuzzy finding to filter/select a vault.
- Previews update in real-time: 
  - Top: directory listing
  - Bottom: directory tree and filtered file previews
- Hit `<Enter>` to open the selected vault in Obsidian.

Typical example for a Qtile keybinding:
```python
Key([mod], "o", lazy.spawn("~/.scripts/bin/obsidian-vault-selector.sh"))
```

---

> [!TIP]
>
> - **Potential Improvements:**  
>   - If `$XDG_CONFIG_HOME/obsidian/obsidian.json` doesn't exist or is malformed, the script may fail silently—consider adding early error checks and user-friendly error messages.
>   - The script assumes `obsidian` protocol URLs are valid/openable; if `obsidian` is not in PATH or the handler isn't registered, nothing will happen—inform the user if spawning the URL fails.
>   - `improved-fzfmenu.sh` is a user script dependency; errors there will break this workflow.
>   - `sed 's/"//g'` may eat quotes elsewhere—using jq's output options might be safer.
>   - For very large vaults, preview commands may be slow or resource-heavy. Consider adding a preview size limit or lazy loading.
>   - Paths with spaces may break variable handling in bash—ensure robust quoting around all variable expansions.
>   - If you move vault folders frequently, make sure your `obsidian.json` stays fresh (Obsidian can leave old paths, causing “not found” errors or opening the wrong location).