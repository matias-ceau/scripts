# Qutebrowser Source Bookmarks Sync

---

**qutebrowser-modify-source-bookmarks.sh**: Syncs local Qutebrowser bookmarks to chezmoi directory.

---

### Dependencies

- `chezmoi`: A tool for managing configuration files across machines using a single source of truth.
- `fd`: A simple, fast, and user-friendly alternative to `find` (ensure it's installed for file discovery).

### Description

This script is designed to facilitate the synchronization of bookmarks and quickmarks from your local Qutebrowser configuration to a repository managed by `chezmoi`. The primary objective is to ensure that your browsing data is consistently updated and backed up.

Here's a breakdown of the script's components:

- **Variables**:
  - `local_book`: Points to the local bookmarks file.
  - `chezm_book`: The destination for the bookmarks in the chezmoi directory.
  - `local_quick` and `chezm_quick`: Similarly defined for quickmarks.
  - `local_sessions` and `sessions`: Define local and chezmoi locations for session files.

- **Sleep Command**: The script initiates a 20-second pause to allow any quickmark modifications that might require updating.

- **File Operations**:
  - The script first copies local quickmarks to the chezmoi quickmarks location.
  - It then copies bookmarks in a similar manner.

- **Session Management**:
  - It uses `fd` to locate `.yml` session files within the local sessions directory.
  - If a session file does not already exist in the chezmoi directory, it will be added.
  - The script copies the sessions to the designated destination, ensuring all session information is synchronized.

### Usage

To use this script, you can simply execute it from the terminal:

```bash
bash /home/matias/.scripts/qutebrowser-modify-source-bookmarks.sh
```

It is also suitable to be assigned to a keybinding in your window manager or setup for automatic execution at a specific interval or event.

---

> [!TIP] 
> The script uses a fixed sleep time which may not be efficient. Consider checking for file modifications instead of waiting, to enhance performance. Also, ensure error handling is included for better resilience against potential failures, such as inaccessible files or directories. Adding a logging mechanism could help track the sync process.