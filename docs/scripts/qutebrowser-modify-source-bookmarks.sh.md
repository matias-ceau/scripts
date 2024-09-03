# Qutebrowser Bookmark Synchronization

---

**qutebrowser-modify-source-bookmarks.sh**: Script to synchronize Qutebrowser bookmarks with Chezmoi-managed config.

---

### Dependencies

- `bash`: Standard shell for executing the script.
- `chezmoi`: A tool to manage your dotfiles (used for syncing configurations).

### Description

This Bash script is designed to automate the synchronization of bookmarks and quickmarks from your local Qutebrowser configuration to a Chezmoi-managed directory. It serves as a backup and version control mechanism for your browser's bookmarks, which are frequently modified.

**Key Operations:**
1. **Setting Paths**: The script sets the paths for both local and Chezmoi bookmark and quickmark files using environment variables defined by the user.
   - `local_book`: Path to local bookmarks.
   - `chezm_book`: Path to Chezmoi bookmarks.
   - `local_quick`: Path to local quickmarks.
   - `chezm_quick`: Path to Chezmoi quickmarks.

2. **Synchronization**: After a pause (to accommodate any changes made to quickmarks), the script uses `cat` to overwrite the Chezmoi bookmark and quickmark files with the local versions.

3. **Commented Out Git Operations**: The script includes commented-out lines for potential addition to a Git repository, suggesting a workflow to commit changes to your bookmarks automatically.

### Usage

To execute the script, run the following command in your terminal:

```bash
bash /home/matias/.scripts/qutebrowser-modify-source-bookmarks.sh
```

You can also set it up as a cron job for automated running at specified intervals, or bind it to a key in your window manager for quick access.

---

> [!TIP]  
> Consider using error checking to ensure that the local bookmark files exist before attempting to copy them. You might also want to manage the `sleep` duration dynamically based on whether changes are detected in bookmarks or quickmarks. Additionally, uncommenting and integrating the Git commands could significantly enhance version control, allowing you to track changes over time.