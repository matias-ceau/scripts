# Command prompt (history-based launcher)

---

**command_prompt.sh**: Pick a past command from shell history via fzf and output it

---

### Dependencies

- `bash`
- `shell_history_info.sh` — provides history entries (used with `-l`)
- `improved-fzfmenu.sh` — fzf-based menu wrapper (handles terminal UI, sorting, ANSI, etc.)
- `cut` — extracts the command field from tab-separated output

### Description

This script is a tiny “command prompt” helper that turns your shell history into an interactive launcher. It works as a pipeline:

1. `get_cmd()` calls `shell_history_info.sh -l`, then extracts the second field with `cut -f2`. This implies `shell_history_info.sh -l` outputs a tab-separated format where field 2 is the actual command string.
2. `fzf_cmd()` feeds those commands into `improved-fzfmenu.sh` configured as:
   - `--terminal-title=cmd_prompt` to set a recognizable terminal title (nice for qtile rules/scratchpads),
   - `--tac` to reverse order (so newest items appear first if the wrapper mirrors `tac` behavior),
   - `--ansi` to preserve coloring if present.

Finally, `get_cmd | fzf_cmd` prints the selected command to stdout. Typically, you’d capture/evaluate it elsewhere (e.g., insert into your prompt, copy to clipboard, or execute).

### Usage

Run it from a terminal (or from qtile via a keybinding launching a terminal command):

    ~/.scripts/bin/command_prompt.sh

Use it as an interactive selector and then:

- Print selected command (default behavior):

    selected="$(~/.scripts/bin/command_prompt.sh)"
    printf '%s\n' "$selected"

- Execute the selected command (be careful):

    bash -lc "$(~/.scripts/bin/command_prompt.sh)"

- Copy to clipboard (example):

    ~/.scripts/bin/command_prompt.sh | wl-copy

---

> [!TIP]
> Consider adding an explicit “execute vs output” mode (e.g., `--run`), and handle empty selections (`fzf` exit code) to avoid running an empty string. Also, relying on `cut -f2` assumes stable tab-separated output; using a more robust parser or documenting the expected `shell_history_info.sh -l` format would prevent breakage.