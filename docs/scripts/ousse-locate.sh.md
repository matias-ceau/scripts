# Ousse DB locate playground (WIP)

---

**ousse-locate.sh**: Inspect `.local/share/ousse` DB files (size/age) and list entries

---

### Dependencies

- `bash`
- `du` (coreutils) — compute directory size
- `cut` (coreutils)
- `date` (coreutils)
- `awk` — quick column parsing/math
- `eza` — used twice: detailed listing and re-listing via `--stdin`
- Optional / planned (commented): `dust`, `bat`, `fzf`, `plocate`, `rg`, `nvim`

### Description

This script is currently a rough “workbench” for a future `plocate`-based launcher/search tool around your custom database directory: `.local/share/ousse`.

What it does now:

1. Computes the total byte size of `.local/share/ousse`:
   - `du .local/share/ousse -b | cut -f1`
2. Builds a detailed file list with `eza -l` sorted by size, with modified time formatted as epoch seconds (`--time-style='+%s'`) and absolute paths (`--absolute`).
3. Runs three separate `awk` passes over that list to print:
   - A proportional width value: `($1 / total_size) * $COLUMNS` (likely intended for a bar/UI layout).
   - “Age delta”: `$2 - now` (note: this is inverted; see critique).
   - The path column (`$3`), then pipes those paths back into `eza -ll --stdin --sort=size --bytes` for a final formatted list.

The bottom half is mostly notes/snippets for the intended end state: choosing a DB via `fzf`, previewing with `bat`, and then searching via `plocate` and/or refining results with `rg`.

### Usage

Run from a shell session (it relies on relative paths and `$COLUMNS`):

    cd ~
    ~/.scripts/dev/ousse-locate.sh

If you want to test from anywhere:

    cd ~ && ~/.scripts/dev/ousse-locate.sh

Typical integration later (qtile keybinding idea) would be to spawn a terminal and run it, but right now it only prints diagnostics and listings (no interactive picker).

---

> [!TIP]
> **Issues / improvements**
> - The directory path is relative (`.local/share/ousse`), so running outside `$HOME` breaks; use `"$HOME/.local/share/ousse"` and quote paths.
> - `eza -l` output is not a stable parse target; whitespace and formatting changes can break the `$1/$2/$3` assumptions. Consider `stat --printf` or `find -printf`.
> - Time delta is likely reversed: use `currt - $2` to get “seconds since modified”.
> - `du -b` isn’t portable across all `du` implementations; on Arch it’s fine, but consider `--bytes`.
> - Collapse repeated `echo|awk` passes into one `awk` for efficiency and clarity.