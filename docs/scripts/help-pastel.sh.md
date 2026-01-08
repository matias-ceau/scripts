# Pastel Help Picker (fzf)

---

**help-pastel.sh**: Interactive `pastel` help browser with `fzf` + previews

---

### Dependencies

- `pastel` — color utility being documented/browsed
- `rg` — extracts the `SUBCOMMANDS` section line number and filters entries
- `bat` — pretty-prints help text and syntax-highlights previews
- `fzf` — interactive selector UI
- `curl` — fetches upstream `pastel` README for the “README.md” entry
- `display_markdown.py` — renders Markdown into terminal-friendly output (your local helper)
- `bash` — uses process substitution (`<(...)`) and regex matching (`=~`)

### Description

This script turns `pastel -h` into a quick, searchable command palette suited for a qtile keybinding.

1. It detects where the `SUBCOMMANDS` section starts in `pastel -h` by grepping the line number, then displays help from that line onward (so you mostly see the subcommand list, not the global blurb).
2. It appends a synthetic entry named `README.md` to the selectable list.
3. It removes the `help` entry to avoid a redundant selection.
4. `fzf` displays the list with ANSI colors preserved and a live preview:
   - Selecting a subcommand runs `pastel <subcommand> --help` and highlights the first line.
   - Selecting `README.md` downloads the upstream README and renders it via `display_markdown.py`, sized to `$FZF_PREVIEW_COLUMNS`.

### Usage

Run from a terminal (or bind in qtile):

    help-pastel.sh

Inside `fzf`:

- Type to filter subcommands
- `Enter` to inspect via preview
- `Esc` to quit

Example qtile keybinding idea:

    lazy.spawn("help-pastel.sh")

---

> [!TIP]
> Improvements to consider:
> - Quote expansions: `--line-range ${line_number}:` and `{1}` are unquoted; while subcommands are safe, quoting is a good habit.
> - Add error handling for missing tools (`command -v ...`) and for network failure when fetching the README.
> - The preview uses `[[ ! {1} =~ README ]]`; this matches any token containing “README”. Consider `== "README.md"` to be stricter.
> - `display_markdown.py` is assumed to exist in `$PATH`; documenting where it lives (or vendoring it) would make the script more portable.