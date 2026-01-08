# Desktop file launcher (fzf)

---

**desk_fzf.sh**: Search and launch installed apps by selecting a .desktop file via fzf

---

### Dependencies

- `bash`
- `fd` — fast file finder used to locate `*.desktop`
- `fzf` — interactive picker
- `bat` — used to display the cache list and preview the selected file
- `grep`, `head`, `cut`, `date` — core utilities
- A valid `XDG_CACHE_HOME` (script writes to `$XDG_CACHE_HOME/desktop-script.txt`)

### Description

`desk_fzf.sh` is a simple application launcher tailored for a keyboard-driven workflow (great for qtile keybindings). It scans the filesystem for `.desktop` files, caches the results, and lets you pick one via `fzf` with a `bat` preview.

**Cache behavior**
- Cache file: `$XDG_CACHE_HOME/desktop-script.txt`
- First line of the cache is a UNIX timestamp.
- Cache is considered valid for **2 hours** (`7200` seconds). If older (or missing), the script refreshes it.
- You can force a refresh with `--update`.

**Launch behavior**
- After selection, it extracts the first `Exec=` line from the chosen `.desktop` file and runs it using `eval`.
- If you cancel `fzf`, it exits cleanly.

### Usage

Interactive (terminal):

    desk_fzf.sh

Force refresh cache:

    desk_fzf.sh --update

Typical qtile binding idea (spawn in a terminal, since `fzf` is TUI):

    # pseudo-example
    lazy.spawn("alacritty -e /home/matias/.scripts/bin/desk_fzf.sh")

Notes:
- The search path is `/` (root), so the initial cache build can be slow.

---

> [!TIP]
> **Potential improvements / issues**
> - Scanning `/` is expensive and may hit permission errors; consider limiting to standard locations: `/usr/share/applications`, `~/.local/share/applications`, `/var/lib/flatpak/exports/share/applications`, etc.
> - `--color always` in `fd` pollutes the cache with ANSI codes; you already preview with `bat`, so storing plain paths is safer.
> - Using `eval "$exec_line"` is risky (and `Exec=` often contains field codes like `%U`, `%f`). Prefer parsing/removing `%` tokens and executing safely (e.g., via arrays or `gtk-launch`/`dex`).
> - `XDG_CACHE_HOME` may be empty; add a fallback to `~/.cache`.