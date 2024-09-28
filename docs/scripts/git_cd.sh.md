# Git Directory Navigator

---

**git_cd.sh**: Quick navigation to Git directories using `locate`, `eza`, and `fzf`

---

### Dependencies

- `locate`: Searches for filenames in databases.
- `eza`: Modern replacement for `ls` with improved features like color support and icons.
- `fzf`: A general-purpose command-line fuzzy finder.
- `awk`: A tool for pattern scanning and processing.
- `sed`: A stream editor for filtering and transforming text.

### Description

The `git_cd.sh` script is designed to streamline navigation within your system's Git repositories on Arch Linux. It utilizes the `locate` command to find all directories containing a `.git` folder, indicating a Git repository. Once located, it strips out the `.git` suffix with `sed` and then uses `eza` to format and list directories with color and icons.

Results are then processed to replace `/home/matias` with `~` for cleaner display, before being handed to `fzf` for fuzzy searching through the repositories. After selection, the script replaces `~` back with the absolute path and navigates (`cd`) to the chosen directory, effectively transporting you to the desired Git repository.

### Usage

This script is meant to be executed from the terminal directly. You can include it in your shell configuration for easy access or bind it to a keybinding using your window manager, qtile.

Example of running the script in a terminal:

```bash
bash ~/path/to/git_cd.sh
```

To bind it with a keybinding in qtile, you might add something like the following to your `config.py`:

```python
from libqtile.config import Key
from libqtile.lazy import lazy

keys = [
    # other keybindings ...

    Key(["mod1"], "g", lazy.spawn("bash /home/matias/.scripts/git_cd.sh")),
]
```

Pressing `Mod1 + g` would then prompt you to select a repository using `fzf`.

---

> [!TIP] A potential enhancement could be to integrate a check to confirm if the `locate` database is up-to-date before running the script, enhancing its accuracy. Additionally, you might consider redirecting the `cd` command to automatically open a terminal or file manager in the chosen directory rather than leaving it within the script's process.