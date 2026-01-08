# Interactive CLI Help Navigator (fzf + completions)

---

**nvpn-tui-help.sh**: Browse CLI subcommands and help via fzf using shell completions

---

### Dependencies

- `bash`
- `fzf` — interactive selector UI
- `bat` — pretty-print `--help` output in the preview pane (falls back poorly if missing)
- One of the supported CLIs (or any CLI with a similar completion flag):
  - `nordvpn` (default)
  - `docker`
  - `kubectl`
  - `git`

### Description

This script builds a recursive, TUI-style “help browser” for command-line tools. It queries the target program’s completion output to discover available subcommands/options, then uses `fzf` to let you drill down interactively. While navigating, the right-side preview shows:

1. The full command being constructed (`program + current path + highlighted token`)
2. The tool’s help text for that specific level (piped through `bat` for readability)
3. The next level of subcommands (by calling the completion generator again)

Navigation is stateful: a `command_history` array tracks your current path so you can step back with `.. (back)` when you’re in a subcommand. If the script can’t retrieve completions for the current node, it assumes you’ve reached an executable command and runs it.

Program-specific completion/help flags are handled via an internal associative map (`PROGRAM_CONFIGS`), defaulting to NordVPN’s `--generate-bash-completion` and `-h`.

### Usage

Run in a terminal (ideal for a qtile keybinding spawning your terminal):

- Start NordVPN browser:
  - `nvpn-tui-help.sh`
- Start for another program:
  - `nvpn-tui-help.sh docker`
  - `nvpn-tui-help.sh kubectl`

Key bindings inside `fzf`:
- `ctrl-/` toggle preview
- `ctrl-h` / `ctrl-l` half-page up/down in preview
- `alt-up` / `alt-down` scroll preview
- `ctrl-r` reload completions for current level

---

> [!TIP]
> Improvements to consider:
> - Some tools (notably `kubectl completion bash`) output a full script, not a simple word list; parsing that into usable candidates may require a different strategy.
> - If `bat` is missing, preview will fail; add a fallback to `cat`/`sed`.
> - Executing the final command automatically can be surprising/dangerous; consider a confirmation step or an “Enter to execute” mode.
> - `command_history` can desync if the user cancels `fzf`; you might want to handle empty selections explicitly (exit vs. stay).