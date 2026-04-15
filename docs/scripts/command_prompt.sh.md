# Command prompt (history launcher)

---

**command_prompt.sh**: Fuzzy-pick a past shell command and output it

---

### Dependencies

- `bash`
- `shell_history_info.sh` — custom helper that prints shell history (used with `-l`)
- `improved-fzfmenu.sh` — custom fzf wrapper used to display the picker UI
- `cut` — from `coreutils`

### Description

This script provides a small “command prompt” powered by your shell history. It:

1. Calls `shell_history_info.sh -l` to retrieve a list of history entries.
2. Extracts only the command field via `cut -f2` (expects tab-separated output where field 2 is the command).
3. Pipes the command list into `improved-fzfmenu.sh` configured as:
   - `--terminal-title=cmd_prompt` to make the spawned terminal easy to spot in qtile
   - `--tac` to reverse the list (most recent commands first)
   - `--ansi` to preserve any color codes (if your history helper outputs ANSI)

The final selected line is printed to stdout. This design makes it composable: you can *capture* the selection, *paste* it, or *execute* it elsewhere depending on how you bind it in qtile.

### Usage

Run interactively (it opens an fzf menu via your wrapper):

    command_prompt.sh

Typical “tldr” compositions:

- Print a command, then copy it:

    command_prompt.sh | wl-copy

- Execute the selected command immediately (use with care):

    eval "$(command_prompt.sh)"

- In qtile, bind to a key and open in a terminal that runs it, or integrate with a prompt widget that inserts text from stdout (recommended) instead of executing.

---

> [!TIP]
> The script currently only *outputs* the chosen command; it doesn’t execute it. That’s safer, but you may want to document/standardize how you consume the output (clipboard vs prompt insert vs eval). Also, relying on `cut -f2` assumes `shell_history_info.sh -l` is consistently tab-delimited; consider making the delimiter explicit (`cut -d $'\t' -f2`) or switching to a more robust parser if commands can contain tabs/formatting.