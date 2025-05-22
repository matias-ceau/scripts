# ANSI Escape Code Cheatsheet Viewer

---

**ansi-cheatsheet.sh**: Quickly displays a cheatsheet of ANSI escape codes in a syntax-highlighted view

---

### Dependencies

- `bat`: A (cat-compatible) syntax highlighting viewer for the terminal.
  - Needed to render the cheatsheet in a more readable and visually appealing format.
- Shell: Assumes `/usr/bin/bash` as the shell interpreter.

### Description

This script provides a concise, formatted reference to common ANSI escape codes for text formatting, coloring, and cursor control in terminal environments. It leverages `bat` with the options `-p` (plain output), `-l md` (language: markdown), and displays a hardcoded markdown cheatsheet covering:

- **Text formatting** (reset, bold, underline, etc.)
- **Foreground and background colors** (standard and "bright" variants)
- **Cursor movements** (positioning, clearing, saving/restoring)
- **Miscellaneous** codes (cursor visibility, screen clearing)

The use of a markdown-formatted here-document (`<< EOF ... EOF`) ensures the cheatsheet is always up to date with no external file dependencies.

### Usage

This script is intended to be run in any terminal:

```bash
ansi-cheatsheet.sh
```

- No arguments are required (or processed).
- You can bind it to a key in your `qtile` configuration for quick access, e.g., to open a new terminal with the cheatsheet.

#### Example: Running as a command
```sh
~/.scripts/bin/ansi-cheatsheet.sh
```

#### Example: Qtile keybinding (assuming `xterm`)
```python
Key([], "F12", lazy.spawn("xterm -e ~/.scripts/bin/ansi-cheatsheet.sh")),
```

---

> [!TIP]
> The script is simple and effective, but there are a few things to consider:
> - The script will fail with a confusing message if `bat` is not installed. You could add a simple check:
>   ```bash
>   command -v bat >/dev/null 2>&1 || { echo "bat is required but not installed. Aborting."; exit 1; }
>   ```
> - Consider making the markdown cheatsheet an external file for easier updates if the content grows.
> - Add command-line options for output format (plain, markdown, etc.), or a `--help` flag to improve usability.
> - Some escape code examples (`\x1b[31mBlack\x1b[0m`) are not actually rendered (the color is lost when using `bat` for markdown), so you may want to clarify which are literal versus rendered.