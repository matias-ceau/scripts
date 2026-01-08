# Terminal fzf-to-typing bridge

---

**script.sh**: Run `fzf` in xterm and type the selection into the focused window

---

### Dependencies

- `bash`
- `xterm` (spawns the dedicated picker window)
- `fzf` (interactive fuzzy finder)
- `xdotool` (types the final selection into the currently focused X11 window)
- `xargs` (usually from `findutils`; forwards selection to `xdotool type`)
- X11 session (Wayland won’t work with `xdotool`)

### Description

This script is a small “UI glue” tool: it opens an `xterm` titled `fzfmenu`, runs `fzf` with whatever arguments you pass, and then takes the chosen line(s) and injects them as keystrokes into the currently focused window using `xdotool type`.

Key details:

- **Argument escaping:** each CLI argument is escaped via `printf %q` before being joined into a single string (`fzf_args`). This helps preserve spaces/special characters when passed through `bash -c`.
- **STDIN/STDOUT forwarding:** inside the spawned `xterm`, `fzf` reads from and writes back to the *parent script’s* file descriptors using:
  - `< /proc/$$/fd/0` (original stdin)
  - `> /proc/$$/fd/1` (original stdout)
- The final pipeline is: `fzf selection` → `xargs` → `xdotool type`.

The commented block at the top hints at an earlier idea to restore mouse position; currently it simply types wherever focus is.

### Usage

Run it from a terminal, feeding candidates on stdin:

    printf "%s\n" alpha beta gamma | ~/.scripts/dev/script.sh

Pass any `fzf` options as normal:

    cat ~/.bash_history | ~/.scripts/dev/script.sh --tac --height=80% --prompt="Hist> "

Typical qtile use (bind to a key, providing candidates):

    # example: choose a window class/name list you generate elsewhere
    some-generator | script.sh --reverse

---

> [!TIP]
> `printf %q` + `"fzf $fzf_args"` is still fragile; prefer passing args as an array to `bash -c` (or avoid `bash -c` entirely). Also, `xargs xdotool type` will split on whitespace unless you enforce one-line selections; consider `fzf --print0` + `xargs -0`, or `xdotool type -- "$(cat)"` to preserve spaces/newlines. Finally, this is X11-only; on Wayland you’d need an alternative (e.g., `wtype`).