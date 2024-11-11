# Show All Qutebrowser Scripts

---

**show-all-qutebrowser-scripts.sh**: Display and colorize the last few scripts installed with qutebrowser

---

### Dependencies

- `qutebrowser`: The browser whose scripts are queried.
- `pacman`: Package manager for Arch Linux, used to list the contents of the qutebrowser package.
- `rg` (ripgrep): A line-oriented search tool that recursively searches your current directory for a regex pattern.
- `sed`: Stream editor for filtering and transforming text.
- `xargs`: Utility to build and execute command lines from standard input.
- `bat`: A `cat` clone with syntax highlighting and Git integration.

### Description

The script `show-all-qutebrowser-scripts.sh` is designed to extract and display a list of the most recent scripts that are part of the qutebrowser package on an Arch Linux system. It uses `pacman` to list all files within the qutebrowser package, and processes this list to show only non-directory files (presumably script files), while tailing the last 37 entries. These are then processed with `ripgrep` to filter out directory listings, and `sed` to parse the filepath, leaving just the script name. Finally, `bat` is used to display these scripts with syntax highlighting.

### Usage

To run the script, you simply execute it from the terminal. Here's how you can use it:

```bash
~/.scripts/bin/show-all-qutebrowser-scripts.sh
```

This script runs non-interactively, which means it doesn't require any user input after execution. It is perfect for being called from a terminal emulator but can also be integrated into a workflow via keybindings in qtile.

Example usage could seamlessly integrate into a qtile keybinding as follows:

```python
Key([mod], "b", lazy.spawn("~/.scripts/bin/show-all-qutebrowser-scripts.sh")),
```

This will bind the script to `mod + b`, showing all the scripts directly in your terminal with syntax highlighting.

---

> [!TIP]
> Currently, the script assumes that the last 37 entries in the `pacman` listing of qutebrowser are scripts of interest, which may not always be the case. It might be beneficial to parameterize the number of entries you tail to make this more flexible. Additionally, if `bat` is not available, it might be useful to add a fallback to `cat` or allow user configuration for the output tool.