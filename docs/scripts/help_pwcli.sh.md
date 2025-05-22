# PipeWire CLI Helper

---

**help_pwcli.sh**: Interactive helper for PipeWire CLI tools, displays per-command help with preview.

---

### Dependencies

- `fzf`: Interactive fuzzy finder for terminal.
- `bat`: A `cat` clone with syntax highlighting.
- PipeWire utilities: `pw-cat`, `pw-config`, `pw-dot`, `pw-dump`, `pw-jack`, `pw-loopback`, `pw-mididump`, `pw-midirecord`, `pw-play`, `pw-record`, `pw-top`, `pw-cli`, `pw-container`, `pw-dsdplay`, `pw-encplay`, `pw-link`, `pw-metadata`, `pw-midiplay`, `pw-mon`, `pw-profiler`, `pw-reserve`.  
  _These must be installed and available in your `$PATH`._

---

### Description

This script provides an interactive terminal menu for browsing the available PipeWire CLI tools and viewing their respective help messages instantly.  
It leverages `fzf` for the interface: as you scroll or search through the list of PipeWire commands, the script dynamically shows the `-h` (help) output for the highlighted command in a pretty, syntax-colored preview using `bat`.

Core Components:

- `prev()`: A function that takes a command, runs `<command> -h`, and pretty-prints the output by piping it through `bat`.
- `doc()`: Echoes a hardcoded, newline-separated list of relevant PipeWire CLI utilities.
- The named PipeWire tools are piped into `fzf`; the preview window refreshes and calls `prev` to present context-sensitive help for the selected command.

---

### Usage

You can launch it in your terminal as follows:
```
$ bash /home/matias/.scripts/dev/help_pwcli.sh
```

**TL;DR:**
- Run the script in a terminal.
- Start typing to fuzzy-find the PipeWire command you want.
- Press **Up/Down** to browse; the right panel shows the `-h` output for the highlighted utility.
- **Enter** to exit (no command executes, it's a reader only).

Tip:  
For faster access, you may want to bind this script to a key combination using your `qtile` config or similar.

---

> [!TIP]
>
> - The script sends every command in the list to `<command> -h` as preview, but does not check if the command actually exists or if `bat` syntax ("pplhelp") fits the help output.  
> - Adding a check (for command existence via `command -v "$1"`) before running the preview can avoid preview errors for missing tools.
> - The `-pplhelp` option for `bat` assumes there is a "pplhelp" syntax definition; unless you have defined it, use `--language=help` or simply let `bat` autodetect (or just use `cat` for fallback).
> - If the PipeWire command list changes, you must update the script manually. A more robust solution would dynamically discover commands with a pattern like `compgen -c | grep '^pw-'`.
> - No action is taken on selection other than previewing help; if you want further actions (like running commands), it would need to be extended.