# ANSI Escape Code Cheatsheet Viewer

---

**ansi-cheatsheet.sh**: Render a quick ANSI escape codes cheatsheet with syntax highlighting

---

### Dependencies

- `bash` (script interpreter)
- `bat` (prints the embedded markdown with pager/syntax highlighting via `-p -l md`)

### Description

`ansi-cheatsheet.sh` is a tiny convenience script that outputs an ANSI escape code cheatsheet directly to your terminal. Instead of keeping a separate markdown file around, the content is embedded in a heredoc and piped to `bat`, which:

- forces Markdown highlighting (`-l md`)
- prints to stdout without paging (`-p`), making it fast and predictable in terminals and keybindings

The cheatsheet covers:

- common text attributes (`\e[1m` bold, `\e[4m` underline, etc.)
- 8-color foreground/background codes (`30–37` / `40–47`)
- bright variants (`90–97` / `100–107`)
- a few cursor movement/screen control sequences
- a note about equivalent escape notations (`\e`, `\x1b`, `\033`)

This is useful on Arch/qtilе setups when writing status bar scripts, `notify-send` formatting experiments, TUI tweaks, or when you need a reminder while editing shell scripts.

### Usage

Run it from any terminal:

    ansi-cheatsheet.sh

Or via full path:

    ~/.scripts/bin/ansi-cheatsheet.sh

Suggested qtile keybinding idea (launch in your preferred terminal):

- spawn a terminal executing the script, e.g. `alacritty -e ansi-cheatsheet.sh`

Because the script uses `bat -p`, it won’t keep an interactive pager open; it will just print and exit (your terminal scrollback becomes the “viewer”).

---

> [!TIP]
> Consider adding a fallback when `bat` isn’t installed (e.g. `command -v bat >/dev/null || cat`). Also, one line in the cheatsheet mixes raw escape bytes (`\x1b[31mBlack\x1b[0m`) while the others are plain labels—either standardize the examples (show each color rendered) or keep all labels consistent. If you ever want paging/search, drop `-p` (or add a flag to toggle it).