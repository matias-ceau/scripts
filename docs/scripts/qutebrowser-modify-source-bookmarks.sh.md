# Qutebrowser Source Bookmarks Modifier

---

**qutebrowser-modify-source-bookmarks.sh**: A script to sync Qutebrowser bookmarks and sessions between local and chezmoi directories.

---

### Dependencies

- `chezmoi`: A tool for managing your dotfiles across multiple machines. This script uses it for syncing the configuration.
- `fd`: A simple, fast and user-friendly alternative to `find`. This is used in the script to locate YAML session files.
- `bash`: The script is written in Bash, so it needs a compatible shell to run.

### Description

This script is designed to streamline the process of syncing Qutebrowser bookmarks and quickmarks between local storage and a chezmoi-managed configuration directory. 

#### Key Components:
- **Local and ChezMoi Paths**: It defines variables for local and chezmoi paths for bookmarks, quickmarks, and session files, utilizing XDG environment variables for flexibility.
- **Quickmark Sync**: The script waits for 20 seconds (presumably to accommodate the addition of quickmarks) and then copies the content of the local quickmarks to the chezmoi equivalent.
- **Bookmark Sync**: Similar to quickmarks, the local bookmarks are directly copied to the chezmoi bookmarks directory.
- **Session File Management**: It scans for `.yml` session files in the local sessions directory. For each session file found, it checks if it exists in the chezmoi sessions directory. If not, it uses `chezmoi add` to track it, followed by copying the session content.

### Usage

Make sure you have the required dependencies installed. To run the script, you can execute the following command in your terminal:

```bash
bash /home/matias/.scripts/qutebrowser-modify-source-bookmarks.sh
```

It is recommended to run this script periodically or bind it to a specific key in your window manager (qtile) for ease of use.

---

> [!TIP]
> The script utilizes a `sleep` command that might not be necessary. If the synchronization frequently fails due to timing issues, consider handling the quickmark addition more gracefully. Additionally, the commented-out lines suggest an intent to commit the changes made to the bookmarks; you might want to integrate this functionality cleanly into the script, ensuring version control is handled effectively.