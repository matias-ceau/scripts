# Terminal FZF Menu Helper (Alacritty)

---

**fzfmenu.sh**: Launches `fzf` in an Alacritty window, acting like a terminal dmenu helper

---

### Dependencies

- `alacritty` — terminal emulator used to host the picker
- `fzf` — fuzzy finder used as the “menu”
- `/proc` filesystem — required for the `/proc/$$/fd/*` redirections (standard on Arch)

### Description

`fzfmenu.sh` is a small helper intended to mimic a `dmenu`-like workflow, but using `fzf` inside an ephemeral Alacritty window titled `fzfmenu`.

It’s designed to be used in pipelines:

- it **reads candidates from stdin**
- opens Alacritty
- runs `fzf` with any arguments you pass to the script
- **writes the selected line(s) back to stdout** of the original caller

A key detail is the use of `/proc/$$/fd/0` and `/proc/$$/fd/1`: this forwards stdin/stdout from the *parent script process* into the spawned Alacritty command, preserving pipe behavior even though `fzf` runs in a separate terminal process.

Arguments are escaped using `printf %q` and reassembled, so passing complex `fzf` flags (with spaces/shell metacharacters) is safer than naive string concatenation.

### Usage

Typical pattern (like `dmenu`):

- Pick one entry:
  - `printf "%s\n" one two three | fzfmenu.sh`
- With common `fzf` options:
  - `printf "%s\n" *.desktop | fzfmenu.sh --prompt="Run> " --height=100%`
- Multi-select:
  - `some_generator | fzfmenu.sh -m --bind 'tab:toggle'`

Qtile/keybinding usage (conceptually): bind a command that produces a list, pipes into `fzfmenu.sh`, then acts on the selection.

---

> [!TIP]
> You may not need manual escaping + string execution. Prefer passing args directly: `alacritty ... -e fzf "$@" <... >...` to avoid edge cases with quoting and word-splitting. Also consider adding `-o`/`--class` (or `--title`) consistency if you plan to match the window in qtile rules, and think about setting `--layout=reverse --border` defaults for a more “menu-like” feel.