# fzfmenu run (fzf-based “dmenu_run”)

---

**fzfmenu_run.sh**: Pick a command with fzf and run it via systemd-run (user scope)

---

### Dependencies

- `bash`
- `fzfmenu_cache.sh` — provides the cached list of runnable commands (your “dmenu_path” equivalent)
- `improved-fzfmenu.sh` — fzf UI wrapper (expects `--pipe` and supports `--ansi`)
- `systemd-run` — launches the command in a transient user scope (requires user systemd)
- (Implicit) `fzf` and a terminal/X environment, depending on how `improved-fzfmenu.sh` is implemented

### Description

This script is a lightweight `dmenu_run` replacement tailored for your Arch + qtile workflow. It builds a menu of commands by piping:

1. `fzfmenu_cache.sh` (command source; likely reads `$PATH`, desktop entries, or a cached index)
2. into `improved-fzfmenu.sh --pipe --ansi` (interactive selector; supports ANSI colors)

The selected entry is stored in `cmd`. If nothing is selected (Esc / Ctrl-C), the script exits cleanly.

Finally, the command is executed asynchronously using:

- `systemd-run --user --scope --quiet bash -c "$cmd" &`

This keeps the launcher responsive and isolates the launched process inside a transient systemd scope (nice for resource tracking and cleanup, and avoids blocking qtile).

### Usage

Run from a terminal, a qtile keybinding, or any launcher:

- Launch interactively:
  - `fzfmenu_run.sh`

- Example qtile keybinding (conceptual):
  - bind a key to run `~/.scripts/bin/fzfmenu_run.sh`

Behavior:
- Type to filter, press Enter to run the selected command
- Press Esc to cancel (no side effects)

---

> [!TIP]
> Consider quoting/escaping more defensively: `bash -c "$cmd"` will interpret shell metacharacters, which is convenient but risky if the menu can contain unexpected content. If you only need to exec a command + args, a safer approach is to output NUL-separated fields or use an array. Also, `systemd-run --user` will fail in environments without a user systemd session; you may want a fallback to plain background execution when `systemd-run` isn’t available.