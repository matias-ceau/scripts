# Fuzzy PDF Opener for Evince

---

**pdfopener.sh**: Fuzzy-pick a PDF from $HOME and open with Evince (fallback xdg-open)

---

### Dependencies

- `fd` — fast file finder; used to list PDFs under $HOME
- `improved-fzfmenu.sh` — your fzf-based menu wrapper (supports ANSI colors)
- `evince` — primary PDF viewer
- `xdg-open` — fallback opener if Evince fails (uses default system handler)
- `fzf` — indirectly required by `improved-fzfmenu.sh` (if it uses fzf)

### Description

This script provides a quick fuzzy-search UI to open any PDF located under your home directory. It uses `fd` to efficiently scan for files matching the regex `\.pdf$` (fd is case-insensitive by default, so it also matches .PDF, .Pdf, etc.). Results are piped to `improved-fzfmenu.sh` with ANSI coloring enabled (`fd --color=always` and `--ansi` on the menu), letting you interactively filter and pick a file.

If you cancel the selection, the script cleanly exits with no side effects. If you pick a file, it tries to open it with Evince; if Evince is unavailable or errors out, it falls back to `xdg-open`, ensuring the PDF still opens with your system’s default viewer.

### Usage

Run from a terminal:
```
~/.scripts/bin/pdfopener.sh
```

Suggested qtile keybinding (Arch, qtile):
```
# in ~/.config/qtile/config.py
from libqtile.config import Key
from libqtile.lazy import lazy

keys += [
    Key(["mod4"], "p", lazy.spawn("~/.scripts/bin/pdfopener.sh"), desc="Open a PDF from HOME"),
]
```

Tips:
- To limit the search (for speed), edit the path: replace "$HOME" with "$HOME/Documents".
- If your menu doesn’t need colors, remove `--color=always` from `fd` and `--ansi` from the menu.
- Prefer a different viewer? Define an alias or modify the last line to use `$PDFVIEWER`:
```
${PDFVIEWER:-evince} "$file" || xdg-open "$file"
```

---

> [!TIP]
> Possible improvements:
> - Simpler, more robust match: use `fd -t f -e pdf "$HOME"` instead of a regex.
> - Launch the viewer non-blocking: `evince "$file" >/dev/null 2>&1 & disown`.
> - Consider including hidden/ignored files when needed: add `-H` (hidden) or `-uu` (all) to `fd`.
> - Add error messaging if `fd` or `improved-fzfmenu.sh` are missing.
> - Allow multi-select with your menu (if supported) and open all selections.