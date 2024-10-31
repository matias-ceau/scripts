# Qutebrowser Bookmark Synchronization Script

---

**qutebrowser-modify-source-bookmarks.sh**: Script to sync Qutebrowser bookmarks and sessions with Chezmoi

---

### Dependencies

- `qutebrowser`: A keyboard-focused browser with vim-like bindings.
- `chezmoi`: A tool to manage your dotfiles securely and across multiple machines.
- `fd`: A simple, fast and user-friendly alternative to `find`.

### Description

The `qutebrowser-modify-source-bookmarks.sh` script is designed for maintaining synchronization between local Qutebrowser bookmarks, quickmarks, and session files with their respective remote counterparts managed through Chezmoi. This script utilizes environmental variables such as `$XDG_CONFIG_HOME`, `$CHEZMOI`, `$XDG_DATA_HOME`, and a custom `$LOCALDATA` to determine file paths.

It primarily copies bookmark and quickmark files to your Chezmoi directory to ensure these are backed up and potentially versioned. Additionally, the script iterates over Qutebrowser session files, identifies new or modified `.yml` session files, and adds them to Chezmoi for tracking. Although commented out, the script contains placeholders for automating the addition and commit process using `git` after modifying the bookmarks.

### Usage

To execute this script, simply run it from the terminal. Ensure that all dependencies are installed and that the necessary environment variables (`$XDG_CONFIG_HOME`, `$CHEZMOI`, etc.) are correctly set up in your environment.

```bash
bash /home/matias/.scripts/bin/qutebrowser-modify-source-bookmarks.sh
```

For automated backups and syncing, you might consider scheduling this script using a cron job or integrating it with a qtile keybinding if you wish to run it manually.

---

> [!TIP]
> The script contains a 20-second `sleep` command which could lead to unnecessary delays. Consider checking if this is essential, and if not, reduce or remove it for faster execution. Additionally, the git automation part is commented out. If version control with git is intended, it would be beneficial to enable and test this functionality.