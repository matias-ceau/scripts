# Pastel Command Helper

---

**help-pastel.sh**: Enhanced interactive subcommand and help browser for `pastel` CLI.

---

### Dependencies

- `pastel` - CLI tool for color manipulation.
- `bat` - A cat clone with syntax highlighting and Git integration.
- `fzf` - Fuzzy finder for the terminal.
- `rg` - ripgrep, for fast text searching.
- `cat` - Used for concatenating files.
- `curl` - To fetch the remote README.
- `display_markdown.py` - Script for markdown preview in terminal (likely a user script).
- `bash` - Script interpreter.

---

### Description

`help-pastel.sh` is an interactive script designed to make exploring the `pastel` command-line color tool more efficient.

**Main features:**
- Lists all `pastel` subcommands and a README option in a fuzzy interface.
- For any subcommand: pressing enter previews its detailed help, syntax-highlighted.
- For the "README.md" line: fetches and previews the official pastel README from GitHub, rendered as markdown in your terminal.
- Internally, the script:
  - Locates the subcommands section of `pastel -h` using ripgrep.
  - Streams the remaining help lines starting from this section using `bat`.
  - Appends a README.md entry as an extra option.
  - Filters out redundant 'help' lines.
  - Presents a colorized, preview-powered list in `fzf`.

---

### Usage

**Run directly in your terminal:**
```
$ help-pastel.sh
```
Or assign to a keybinding in qtile for quick access!

#### Usage Flow

1. A list of `pastel` subcommands (plus "README.md") will appear in an fzf prompt.
2. You can:
   - Type to fuzzy search/filter subcommands.
   - Use arrow keys, then press `Enter` on a selection.
   - See a live help preview for each command.
   - Select "README.md" to view the official spherical documentation.

---

> [!TIP]
> - `help-pastel.sh` is very handy but relies on several external tools. Consider making error-handling more robust for missing dependencies, or check/install them if not found.
> - The preview logic for the README is tied to a custom script (`display_markdown.py`). If it is missing or incompatible, the README preview will fail.
> - Appending "README.md" as a selectable line is clever, but if the format of `pastel -h` changes, or the README structure changes upstream, parts of the script may need updating.
> - The fuzzy list can get quite wide – you might want to limit line lengths or columns if terminal real estate becomes a problem.
> - For even more seamless integration, consider extracting the markdown render into its own stable utility (for reuse elsewhere).