# Qutebrowser Bookmark Synchronization Script

---

**qutebrowser-modify-source-bookmarks.sh**: Syncs local Qutebrowser bookmarks with Chezmoi-managed config files.

---

### Dependencies

- `chezmoi`: A tool to manage your dotfiles effortlessly, allowing for easy synchronization across systems.
- `fd`: A simple, fast and user-friendly alternative to `find`.
- `bash`: The script is written in bash and requires a compatible shell environment.

### Description

This script automates the synchronization of Qutebrowser bookmarks and quickmarks from local directories to those managed by Chezmoi. It ensures that any changes made to local Qutebrowser configurations are reflected in your Chezmoi setup, facilitating seamless migration and backup of browser settings.

The script defines several file paths, adapting to the user's configuration directories:
- Local bookmarks and quickmarks are stored in `$XDG_CONFIG_HOME/qutebrowser/`
- Chezmoi-managed equivalents reside in `$CHEZMOI/dot_config/qutebrowser/`
- It synchronizes sessions from the data directory located at `$XDG_DATA_HOME/qutebrowser/sessions`.

To handle potential race conditions with quickmark updates, the script incorporates a 20-second sleep before copying local quickmarks to the Chezmoi directory.

### Usage

To execute the script, run the following command in your terminal:

```bash
bash /home/matias/.scripts/qutebrowser-modify-source-bookmarks.sh
```

Alternatively, you can assign this script to a keybinding in your window manager (qtile) or set it up as a cron job for periodic execution. 

**Example of a keybinding** in your qtile configuration:
```python
Key([mod], "b", lazy.spawn("/home/matias/.scripts/qutebrowser-modify-source-bookmarks.sh")),
```

This keybinding would allow you to synchronize your bookmarks with a simple key press.

---

> [!TIP]  
> The script has a sleep command which might delay the execution unnecessarily. Consider optimizing the sleep timing or implementing a check to see if the quickmark operation has completed before proceeding. Additionally, removing the commented-out git commands and improving error-handling could enhance usability.