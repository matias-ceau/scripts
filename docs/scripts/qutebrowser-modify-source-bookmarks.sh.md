# qutebrowser Bookmarks Sync Script

---

**qutebrowser-modify-source-bookmarks.sh**: Synchronizes qutebrowser bookmarks and quickmarks from local to chezmoi.

---

### Dependencies

- `fd`: A simple, fast and user-friendly alternative to `find`. It is required to search for YAML files in the session directory.
- `chezmoi`: A tool for managing your dotfiles conveniently, to allow synchronization of bookmarks.

### Description

This script is designed to facilitate the synchronization of qutebrowser bookmarks, quickmarks, and session files from your local configuration to your chezmoi-managed dotfiles. It essentially transfers data from predefined local paths to relevant chezmoi paths.

The critical paths used in the script are:

- **Bookmarks**: 
  - Local: `$XDG_CONFIG_HOME/qutebrowser/bookmarks/urls`
  - Chezmoi: `$CHEZMOI/dot_config/qutebrowser/bookmarks/urls`
  
- **Quickmarks**: 
  - Local: `$XDG_CONFIG_HOME/qutebrowser/quickmarks`
  - Chezmoi: `$CHEZMOI/dot_config/qutebrowser/quickmarks`

- **Sessions**: 
  - Local: `$XDG_DATA_HOME/qutebrowser/sessions`
  - Chezmoi: `$CHEZMOI/dot_local/share/private_qutebrowser/sessions`

The script includes a delay of 20 seconds to allow for the addition of quickmarks before proceeding. It utilizes the `cat` command to copy file contents and uses `fd` to identify YAML files for session management.

### Usage

This script is intended for use within a terminal and can be executed directly as follows:

```
bash /home/matias/.scripts/qutebrowser-modify-source-bookmarks.sh
```

To run it, ensure that the necessary variables (`XDG_CONFIG_HOME`, `CHEZMOI`, etc.) are set in your environment. The script operates silently, so no output will indicate success unless errors occur.

You could also adapt this script to be executed automatically or bind it to a key in your window manager (Qtile) for quick access.

---

> [!TIP] 
> While the script is functional, consider adding error handling checks to validate the existence of source files before attempting to copy them. This will improve reliability and minimize silent failures. Including options for manual confirmations or logging could also enhance usability for users who synchronize frequently. Lastly, including a conditional check for the success of commands (such as `cat` or `fd`) would help ensure that all operations execute as intended.