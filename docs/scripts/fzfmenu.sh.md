# Fzfmenu Script

---

**fzfmenu.sh**: A helper script leveraging `fzf` and `xterm`, similar in functionality to `dmenu`.

---

### Dependencies

- `fzf`: A command-line fuzzy finder for efficiently filtering and selecting text.
- `xterm`: A terminal emulator for running command-line applications within a window.
- `/proc/$$/fd/*`: Usage of file descriptors to handle input and output streams.

### Description

The **fzfmenu.sh** script is a lightweight, helper utility that combines the power of `fzf` with `xterm`. Designed to emulate the behavior of `dmenu`, it provides a fuzzy search interface using `fzf` displayed in an `xterm` window. This script escapes all input arguments to ensure safe handling and pipelines the interactions via standard input/output streams using the `/proc` file system.

Key functionalities:
- Takes any parameters passed via the command line, escapes them safely, and forwards them to `fzf` as arguments.
- Runs `fzf` inside an `xterm` window titled "fzfmenu".
- Redirects input and output streams through `/proc/$$/fd/` for seamless data handling.

This makes the script highly flexible, allowing you to pipe text into it and retrieve the user's selection without additional setup.

### Usage

To use this script, you need to pass the necessary arguments for `fzf`. For example:

```bash
echo -e "option1\noption2\noption3" | /home/matias/.scripts/bin/fzfmenu.sh --height=10 --reverse
```

**Explanation**:
- The script displays "option1", "option2", and "option3" in a vertical fuzzy search menu.
- The `--height=10` argument sets the height of the menu to 10 lines.
- The `--reverse` option makes the menu display at the top.

You can also bind it to a keybinding via `qtile` or execute it directly from the terminal.

#### Example Integration with `qtile`
To bind this script to a key in `qtile`:
```python
Key([mod], "m", lazy.spawn("/home/matias/.scripts/bin/fzfmenu.sh --height=15"))
```

---

> [!TIP]
> - The script currently hardcodes the title for the `xterm` window ("fzfmenu"). Consider making this configurable for flexibility.
> - It would be beneficial to allow users to pass environment variables or settings like font size or colors for `xterm`.
> - The script assumes that input is always piped into it (`stdin`). Adding a fallback or default behavior for no input (e.g., reading from a default file) could enhance usability.
> - Using `/proc/$$/fd/` for redirection is clever but might have compatibility issues on non-Linux systems or certain shells. Documenting this caveat might be useful.