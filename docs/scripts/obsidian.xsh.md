# Obsidian Vault Launcher

---

**obsidian.xsh**: Quickly select and open an Obsidian vault via a fuzzy menu

---

### Dependencies

- `xonsh`  
  Required as the script runs under the xonsh shell.

- `obsidian`  
  Assumes the `obsidian` protocol handler is installed and working (usually provided by the official AppImage or native package).

- `fzfmenu.sh`  
  Script or wrapper to invoke `fzf` with dmenu-like options, and must be in your `$PATH`.

- `eza`  
  Used for the vault preview inside `fzfmenu.sh` (`eza -T` gives a directory tree).

- `notify-send`  
  For desktop notifications when no vault is selected.

---

### Description

This script streamlines the process of opening an Obsidian vault by:

- Listing all the directories under `~/PKM` (your Personal Knowledge Management folder) — each directory is treated as a vault.
- Allowing you to interactively select a vault using an interactive fuzzy finder (`fzfmenu.sh`). For each directory, it shows a live preview using `eza`, so you can inspect vaults before selecting.
- Once a vault is chosen, it opens the vault using the Obsidian URL scheme (`obsidian://open?vault=...`). If you cancel the selection, a notification is shown.

#### Key implementation details

- Xonsh-powered: takes full advantage of Python scripting and shell syntax.
- Directory-only filtering: Only shows directories in `~/PKM`, preventing non-vault files from cluttering the menu.
- `fzfmenu.sh`: Customizes the fuzzy selection menu and shows pretty previews via `eza`.

---

### Usage

You can run this script from your terminal, or (recommended) assign it to a keybinding in your qtile config for lightning-quick vault launching.

#### Manual usage (from terminal):
```sh
xonsh ~/.scripts/bin/obsidian.xsh
```

#### Assign to qtile keybinding (example):
```python
Key([mod], "o", lazy.spawn("xonsh ~/.scripts/bin/obsidian.xsh"))
```

#### TL;DR

- Run the script.
- Fuzzy-select a vault (with directory tree preview).
- It automatically opens in Obsidian, or you get notified if cancelled.

---

> [!TIP]
> - The script is concise and well-focused, but does not currently handle names with spaces robustly (if your vault has spaces or unusual characters in the name, URL-encoding may be needed for the Obsidian protocol).
> - As a small improvement, consider adding error checking for missing dependencies (e.g., `fzfmenu.sh`, `obsidian`, `eza`, `notify-send`) to provide more user-friendly diagnostics if called from outside an interactive shell.
> - You might want to parametrize the vaults folder instead of hardcoding `$HOME/PKM` for flexibility.
> - The commented-out dmenu section is obsolete, so it can be removed to tidy the script. Also, supporting native dmenu in addition to fzf could improve platform versatility.
> - For large PKM directories, previewing with `eza -T` could be slow; consider limiting depth or adding an option for speed.