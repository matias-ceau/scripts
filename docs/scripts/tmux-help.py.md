# Tmux Help Assistant Script

---

**tmux-help.py**: A script to provide useful assistance and search functionalities for tmux commands and sections.

---

### Dependencies

- `fuzzywuzzy`: Python library for fuzzy string matching.
- `argparse`: To handle command-line arguments.
- `configparser`: To manage configuration file parsing.
- Basic utilities like `os`, `sys`, `re`, and `subprocess`.

### Description

This script assists Arch Linux users utilizing `qtile` WM in navigating the tmux manual, searching for commands, and managing keybindings efficiently. It provides functionalities to list tmux commands either in their original sequence or categorized into themes like navigation, editing, etc. It supports fuzzy and exact search modes for tmux commands using the term entered by the user. It can also fetch and organize manpage sections for easy browsing.

Crucially, the script checks and updates the tmux manpage and section data weekly (or manually upon request) from your system using `man` commands, storing these in a user-defined data directory.

### Usage

The script can be run directly from a terminal with various options:

```sh
python tmux-help.py [-h] [-L] [-f ARG] [-F ARG] [-s KEY] [-u] [-S [SECTION]]
```

- `-L, --list-tmux`: Lists tmux commands in the original order.
- `-f, --find ARG`: Performs a fuzzy search for keyword descriptions.
- `-F, --find-exact ARG`: Searches for an exact match (case insensitive).
- `-s, --search KEY`: Searches for a specific key and returns the associated commands.
- `-u, --update`: Updates the tmux manpage and sections files.
- `-S, --section [SECTION]`: Lists or displays a specific manpage section by number or name.

**Example**: To perform a fuzzy search for "split" in tmux commands, run:
```sh
python tmux-help.py --find "split"
```

---

> [!IMPORTANT]
> The script assumes the `full_manpage_path` and `sections_path` are pre-populated with the tmux manual content. The `extract_keybindings` function is yet to be implemented, which means keybinding extraction from manpages is incomplete. Consider integrating this part for full functionality. Additionally, ensure that the `fuzzywuzzy` library is installed; on Arch Linux, you can install it using `pip`.