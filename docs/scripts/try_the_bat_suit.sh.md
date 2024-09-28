# Try the Bat Suit

---

**try_the_bat_suit.sh**: A script leveraging `bat` and `fzf` for file preview and selection

---

### Dependencies

- `bash`: A Unix shell and command language interpreter.
- `fd`: A simple, fast and user-friendly alternative to 'find'.
- `fzf`: A command-line fuzzy finder, used for interactive file selection.
- `bat`: A `cat` clone with syntax highlighting and Git integration.
- `rg` (ripgrep): A line-oriented search tool that recursively searches the current directory for a regex pattern.

### Description

The `try_the_bat_suit.sh` script is designed to help you select and preview files interactively. It uses `fzf`, a powerful command-line fuzzy finder, to list files, and employs `bat` for syntax-highlighted previews. If a file path is provided as a command-line argument, the script directly uses it; otherwise, it lets you select a file using `fzf`.

The script starts by checking if an argument (file path) is passed. If not, it uses `fd` to recursively search for files and lets you choose one using `fzf`. The core feature is the dynamic preview capability offered by leveraging `bat` within the `fzf` preview window. This is made possible through the `preview_cmd` function which handles extracting language highlighting settings from `bat`’s list of languages using `rg` to parse the necessary information.

### Usage

This script can be executed from a terminal. You can either provide a file name or let the script guide you in selecting one:

```bash
# Usage with a file argument
./try_the_bat_suit.sh path/to/your/file

# Usage without arguments to select a file interactively
./try_the_bat_suit.sh
```

It can also be integrated into your qtile keybindings for quick access, automating file preview and selection during workflow.

---

> [!TIP]
> The script uses hardcoded paths for `bash` and potentially `bat` and `fd`, which may not be consistent on all Arch-based systems, especially if packages are installed in custom directories. Consider using a more robust way to locate these tools, such as relying on the user's configured `$PATH`. Additionally, more informative user feedback on missing dependencies could enhance the script's usability by checking their availability before execution.