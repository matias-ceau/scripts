# Qutebrowser Bookmark Synchronization Script

---

**qutebrowser-modify-source-bookmarks.sh**: Sync local Qutebrowser bookmarks with ChezMoi.

---

### Dependencies

- `bash`: The script is written in Bash, a popular shell scripting language.
- `chezmoi`: A tool for managing your dotfiles conveniently.

### Description

This script is designed to facilitate the synchronization of Qutebrowser bookmarks and quickmarks from the local configuration directory to a ChezMoi-managed directory. It operates by copying the contents of your local bookmarks and quickmarks files into the corresponding ChezMoi directories, enabling easy backup and version control of your browser bookmarks.

The script performs the following key actions:

1. **Define Paths**: It sets up path variables for local bookmarks and quickmarks as well as their equivalents in the ChezMoi-managed configuration.
2. **Delay Execution**: It incorporates a 20-second wait time. This is beneficial in scenarios where you might be modifying quickmarks and need to ensure that changes are accurately recorded.
3. **File Copying**: It copies the content of `urls` from both local bookmarks and quickmarks directories into their ChezMoi counterparts.

### Usage

To use the script, simply run it from a terminal:

```bash
bash /home/matias/.scripts/qutebrowser-modify-source-bookmarks.sh
```

This script does not accept command-line arguments; it is designed to be run as-is. You can also set up a keybinding in your window manager (Qtile) to execute this script quickly.

---

> [!TIP]  
The script has commented-out sections regarding version control with Git, which can be beneficial for those who want to track changes made to bookmarks over time. Consider activating these lines to automatically add, commit, and push the changes to your Git repository whenever the bookmarks are updated. Keeping your bookmarks under version control can offer added safety against accidental deletions or overwrites.