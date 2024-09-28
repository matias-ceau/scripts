# Qutebrowser Source and Bookmark Sync Script

---

**qutebrowser-modify-source-bookmarks.sh**: Script to synchronize qutebrowser bookmarks and sessions with chezmoi.

---

### Dependencies

- `qutebrowser`: A keyboard-driven, vim-like web browser.
- `chezmoi`: A dotfile manager for keeping your configurations synchronized.
- `fd`: A simple, fast, and user-friendly alternative to find.
- `git`: Used in commented sections for version control (optional).

### Description

This script is designed to synchronize your qutebrowser's bookmarks, quickmarks, and session files with a directory managed by `chezmoi`. This setup ensures that your personal browsing settings are regularly updated and versioned.

The script relies on environment variables such as `$XDG_CONFIG_HOME`, `$CHEZMOI`, and `$XDG_DATA_HOME` for locating the necessary folders, ensuring a clean organization that adheres to the XDG Base Directory Specification.

Here's how the script functions:

1. **Synchronization**:
   - Copies `quickmarks` and `bookmarks` from `$XDG_CONFIG_HOME` to `$CHEZMOI` after a brief sleep period in case of quickmark changes.
   - Iterates through all session files ending with `.yml` in the `sessions` directory, adding them to chezmoi if they do not exist, and updating them if they do.

2. **Chez Moi Integration**:
   - The session files are added using `chezmoi`, ensuring they are part of your dotfiles configuration.

3. **Version Control (Commented Out)**:
   - There are commented lines indicating an optional Git workflow, which includes adding, committing, and pushing updates to a version control repository. 

### Usage

To use this script, you need to have `chezmoi` and `fd` installed on your Arch system. `git` is required if you choose to enable the versioning section.

Ensure all environment variables are correctly set:

```bash
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export CHEZMOI="$HOME/.local/chezmoiconfig"
```

Run the script manually:

```bash
bash /home/matias/.scripts/qutebrowser-modify-source-bookmarks.sh
```

Or integrate it with your window manager, qtile, for automation:

```python
Key([mod], "b", lazy.spawn("/home/matias/.scripts/qutebrowser-modify-source-bookmarks.sh")),
```

---

> [!TIP]
> The script relies on environment variables that must be configured correctly before execution. Consider parameterizing these with flags or, for reliability, adding error handling to ensure path existence. Additionally, consider uncommenting and testing the Git commands for a robust version control experience.