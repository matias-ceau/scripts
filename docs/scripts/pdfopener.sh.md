# PDF picker & opener (fd + fzf)

---

**pdfopener.sh**: Pick a PDF from `$HOME` and open it (Evince fallback)

---

### Dependencies

- `fd` (from `fd`): fast file finder used to list PDFs under your home directory
- `improved-fzfmenu.sh`: your fzf-based menu wrapper (must accept stdin and output a selected path)
- `evince`: preferred PDF viewer
- `xdg-open` (from `xdg-utils`): fallback opener using your default PDF handler

### Description

This script provides a quick “pick and open” workflow for PDFs on Arch, ideal for binding in qtile.

It searches recursively in `$HOME` for files ending with `.pdf` via `fd`, then pipes the results into `improved-fzfmenu.sh` with `--ansi` enabled. The `fd` output is colorized (`--color=always`), which is why `--ansi` is required so fzf can properly display (and ignore) ANSI color codes while filtering.

After selection, it validates that the chosen entry is an actual file. If nothing valid is selected (e.g., canceling the fzf prompt), it exits silently.

Opening behavior is:

1. Try `evince "$file"`
2. If Evince fails (missing, crashes, non-zero exit), fall back to `xdg-open "$file"` to use the system default PDF viewer.

### Usage

Run from a terminal, launcher, or bind to a qtile key.

tldr:

- Pick a PDF from home and open it:
  - `pdfopener.sh`

Suggested qtile binding:

- `lazy.spawn("~/.scripts/bin/pdfopener.sh")`

Notes:

- The search scope is your entire `$HOME`, so initial indexing/filtering speed depends on home size.
- Canceling the picker cleanly exits with code `0`.

---

> [!TIP]
> Consider output stability: `fd --color=always` may cause the selected string to include ANSI escapes depending on how `improved-fzfmenu.sh` returns results. If you ever see “file not found” after selecting, switch to `fd --color=never` or ensure the wrapper strips ANSI codes before printing the selection. Also, `#!/bin/sh` plus `[[ ... ]]` is not POSIX; on Arch `/bin/sh` is often `dash`, which will fail. Use `#!/usr/bin/env bash` or replace with `[ ! -f "$file" ]`.