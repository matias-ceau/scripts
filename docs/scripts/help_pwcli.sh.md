# PipeWire CLI Help Picker (fzf + bat)

---

**help_pwcli.sh**: Browse PipeWire CLI tools and preview their `-h` help in fzf

---

### Dependencies

- `bash`
- `fzf` — interactive fuzzy finder UI
- `bat` — colored pager for the preview pane (`-pplhelp` style)
- PipeWire CLI tools (as available on Arch): `pw-cat`, `pw-cli`, `pw-top`, `pw-link`, etc.

### Description

This script provides a quick “help browser” for PipeWire’s command-line utilities. It prints a curated list of `pw-*` commands, feeds them into `fzf`, and shows the selected tool’s help output in the preview window.

Key pieces:

- `doc()` outputs the list of PipeWire commands (one per line). This is the menu source for `fzf`.
- `prev()` is an exported Bash function used by `fzf --preview`. It builds a command array `("$1" "-h")` and executes it safely, then pipes the help text to `bat` for syntax-highlight-like readability using the `help` language.
- `--bind focus:refresh-preview` forces the preview to refresh when the fzf window gains focus (handy when reusing the same terminal).

This fits nicely into an Arch + qtile workflow: launch from a terminal scratchpad, a keybinding, or a run prompt (if it spawns a terminal).

### Usage

Run interactively in a terminal:

    ~/.scripts/dev/help_pwcli.sh

In `qtile`, bind it to a key (example uses `alacritty`):

    Key([mod], "p", lazy.spawn("alacritty -e ~/.scripts/dev/help_pwcli.sh"))

`tldr`:

- Type to filter commands
- Move selection to update preview
- Press `Enter` to accept (the script doesn’t execute the tool; it’s purely for reading `-h`)

---

> [!TIP]
> Improvements to consider:
> - Some PipeWire tools may use `--help` instead of `-h`; you could fall back automatically (`"$1" -h || "$1" --help`).
> - Add `set -euo pipefail` and basic dependency checks (e.g., `command -v fzf bat`), so failures are clearer.
> - Let the list be generated dynamically (`compgen -c | grep '^pw-'`) or augmented via CLI args, to avoid manual maintenance.
> - The `-pplhelp` option assumes a `bat` language named `help`; consider `-l help` for portability or detect availability.