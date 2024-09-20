# Qutebrowser Source Bookmarks Synchronizer

---

**qutebrowser-modify-source-bookmarks.sh**: Script to synchronize Qutebrowser bookmarks and quickmarks.

---

### Dependencies

- `fd`: A simple, fast and user-friendly alternative to `find`.
- `chezmoi`: A dotfile manager that helps you manage your configuration files.

### Description

This script is designed to synchronize bookmarks and quickmarks from your local Qutebrowser configuration to a repository managed by Chezmoi. It accomplishes the following tasks:

1. **Synchronizing Quickmarks**: After a delay of 20 seconds to account for potential quickmark name additions, it copies the quickmarks from the local directory to the Chezmoi-managed directory.

2. **Synchronizing Bookmarks**: It directly copies the bookmarks from the local configuration to the Chezmoi's configuration directory.

3. **Session Management**: The script then iterates through all YAML files in the local sessions directory. If the session file is not already tracked by Chezmoi, it adds that file to Chezmoi for tracking, and subsequently copies the session data to the corresponding Chezmoi directory.

This workflow simplifies keeping your bookmark and session configurations consistent between your local setup and your versioned backups.

### Usage

To use this script, ensure that it has execute permissions and run it in a terminal:

```bash
chmod +x /home/matias/.scripts/qutebrowser-modify-source-bookmarks.sh
/home/matias/.scripts/qutebrowser-modify-source-bookmarks.sh
```

You can also automate its execution by setting up a cron job or binding it to a key combination in your window manager (Qtile).

---

> [!TIP]  
> It's good to use robust error handling in scripts like this one to manage scenarios where files may not exist or permissions may be restricted. For example, you could check if the directories exist before attempting to copy files. Additionally, consider parameterizing the delay or allowing it to be updated through a command-line option, making the script more flexible.