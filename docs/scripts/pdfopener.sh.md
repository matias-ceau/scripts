# PDF picker and opener

---

**pdfopener.sh**: Fuzzy-pick a PDF in $HOME and open it with Evince, falling back to xdg-open

---

### Dependencies

- `fd` — fast file finder; used to list PDFs under `$HOME`
- `improved-fzfmenu.sh` — your fzf wrapper; must accept `--ansi` and print the selected path
- `fzf` — required by `improved-fzfmenu.sh` for interactive selection
- `evince` — primary PDF viewer
- `xdg-open` — fallback opener if `evince` fails
- `bash` as `/bin/sh` on Arch — script uses `[[ ... ]]` which is a bashism

### Description

This script lets you quickly locate and open any PDF inside your home directory. It composes a simple pipeline:

1) `fd -tf '\.pdf$' "$HOME" --color=always` lists all regular files ending with .pdf beneath `$HOME`.  
2) The list is piped to `improved-fzfmenu.sh --ansi` for an interactive fuzzy pick.  
3) If a valid file is selected, the script tries `evince "$file"`; on failure it falls back to `xdg-open "$file"`.

Colorized `fd` output pairs with `--ansi` so fuzzy matching ignores ANSI sequences while keeping colored display in the menu.

### Usage

- Run from a terminal:
  ```
  ~/.scripts/bin/pdfopener.sh
  ```

- Bind to a key in qtile (e.g., Mod+p):
  ```
  # in ~/.config/qtile/config.py
  from libqtile.config import Key
  from libqtile.command import lazy

  keys.append(Key([mod], "p", lazy.spawn("~/.scripts/bin/pdfopener.sh")))
  ```

- Typical flow:
  - Invoke the script
  - Start typing to filter PDFs
  - Press Enter to open the highlighted file

No arguments are required; the script is non-interactive beyond the fzf selector.

---

> [!TIP]
> - Portability: `[[ ... ]]` is a bashism. Either change the shebang to `#!/usr/bin/env bash` or switch to POSIX `[ ... ]`.
> - Path correctness: `fd` prints paths relative to `$HOME` in this usage. If your current directory is not `$HOME`, `[[ -f "$file" ]]` and `evince "$file"` may fail. Use `fd -a ...` for absolute paths, or `cd "$HOME"` before running `fd`.
> - ANSI safety: Relying on colorized input requires `improved-fzfmenu.sh` to strip ANSI from the selected output. For robustness, consider `fd --color=never` and drop `--ansi`.
> - UX idea: Add a preview (e.g., `pdfinfo`, `exiftool`, or filename context) in your fzf wrapper to show metadata while selecting.