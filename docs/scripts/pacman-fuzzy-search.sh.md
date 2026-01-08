# Pacman Fuzzy Search (fzf package browser)

---

**pacman-fuzzy-search.sh**: Fuzzy-find Arch packages (repo/AUR) with previews and install on enter

---

### Dependencies

- `bash`
- `pacman` (fallback package manager backend)
- `paru` or `yay` (preferred AUR-capable backend; first found is used)
- `fzf` (interactive fuzzy UI)
- `ripgrep` (`rg`, for filtering/regex decisions)
- `bat` (pretty colored preview rendering)
- `sed` (output shaping)
- `notify-send` (debug notifications when filters are active)
- `blabel` (custom helper used in fzf keybinds to build border labels)

### Description

This script provides an `fzf` interface over `pacman -Sl` (or `paru/yay -Sl`) so you can browse packages with ANSI colors, preview metadata, and install selections.

It creates a cache directory at `~/.cache/pacman-fuzzy-search` (currently just ensured to exist), then detects a package manager in order: `paru`, `yay`, `pacman` and exports it as `AUR_PKG_MGR`.

Key pieces:

- `pacSl()`: lists all packages (`-Sl`) with color adjustments (tweaks magenta to yellow and normalizes `unknown-version`).
- `preview_cmd()`: uses `-Si` for remote package info, but switches to `-Qi` if the selected line contains `[installed]`. Output is reformatted via `sed` and rendered through `bat` for a YAML-like, readable preview.
- `search_cmd()`: reload source for `fzf` based on the current `FZF_BORDER_LABEL` (expects flags like `a` for AUR and `i` for installed); can emit a `notify-send` debug popup.

### Usage

Run interactively in a terminal (ideal from a qtile keybinding spawning your terminal):

    pacman-fuzzy-search.sh

Inside `fzf` (highlights):
- `Enter`: install selected packages  
  - installs `{+2}` (the package name column) via `$AUR_PKG_MGR -S`
- `Alt-w`: cycle preview layout (right / up / hidden)
- `Alt-h`: toggle prompt indicator and reload results
- `Alt-a`, `Alt-i`: toggle border label filters (requires `blabel`) and reload

---

> [!TIP]
> The `--bind` lines for `alt-a/alt-i` look inconsistent (one bind for `alt-i` accidentally triggers `alt-a:+reload-sync`). Consider cleaning/duplicating them correctly to avoid confusing reload behavior. Also, `CACHE_DIR` is created but unused; either wire it into cached queries or remove it. Finally, `notify-send` in `search_cmd()` can become noisy—make it conditional on a debug flag.