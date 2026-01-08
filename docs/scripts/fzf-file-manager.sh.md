# fzf File Manager (TUI navigator)

---

**fzf-file-manager.sh**: FZF-based interactive file browser with rich previews (eza/bat/kitty)

---

### Dependencies

- `bash`
- `fzf` (interactive fuzzy finder + keybind actions)
- `eza` (directory listings; script relies on `--long` output format)
- `bat` (syntax-highlighted previews and formatting)
- `ripgrep` (`rg`, used in `get_color()` and MIME detection)
- `file` (MIME/type detection)
- `kitty` / `kitten icat` (inline image previews in Kitty)
- `pastel` (color formatting; used by `get_color()`)
- `notify-send` (debug notifications on unexpected results)
- Flexoki env vars like `FLEXOKI_BLACK` (used for fzf colors)

### Description

This script implements a lightweight “file manager” loop around `fzf`. Each iteration lists the current directory via `eza` (through `ls_cmd()`), pipes it into a heavily customized `fzf` UI (`fzf_cmd()`), and then updates `CUR_DIR` depending on what you selected and which navigation key you used.

Previewing is the core feature:

- `preview_cmd {7..}` reconstructs the selected path from the `eza --long` output (fields 7..end), then:
  - shows a 1-line header-style listing (`eza --list-dirs`)
  - prints MIME info (`file -i`)
  - if directory: renders a depth-2 tree
  - if image: uses `kitten icat` with a computed preview geometry
  - else: previews the file with `bat` (grid/snip + wrapping)

Navigation is done by emitting markers into the selection stream:
- `ctrl-h` prints `backward` then accepts
- `ctrl-l` prints `forward` then accepts  
The loop reads that marker and the selected entry to decide whether to enter a directory or go “up”.

### Usage

Run in a terminal (ideal inside Kitty):

    fzf-file-manager.sh

Start in a specific directory (passed through to `eza`):

    cd ~/Downloads
    fzf-file-manager.sh

Keybindings (inside fzf):

- `Alt-p`: toggle preview
- `Alt-h`: toggle hidden files (changes prompt to `H> ` and reloads with `--all`)
- `Ctrl-l`: enter (forward)
- `Ctrl-h`: go up (backward)
- `Alt-Space`: run the preview command for the current entry (acts like “open preview output”)

---

> [!TIP]
> The parsing is fragile: it depends on `eza --long` spacing and assumes filenames begin at field 7. Consider switching to a null-delimited format (e.g., `find -print0` + `fzf --read0`) or `eza --oneline --absolute` to avoid `awk` field slicing issues. Also, `get_color()` is exported but unused; either integrate it into `--color` options or remove it. Finally, `cd "$CUR_DIR"` inside the loop means the script changes its own working dir only—if you want qtile integration, emit the final directory to stdout so a wrapper can `cd` in the parent shell.