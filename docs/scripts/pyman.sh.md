# pyman — Python “man” pages + module browser via fzf

---

**pyman.sh**: Interactive pydoc/fzf browser for Python topics, keywords, builtins and libs

---

### Dependencies

- `python` — provides `pydoc` output and builtins listing  
- `pydoc` (ships with Python) — documentation source (`pydoc topics|keywords|<module>`)  
- `fzf` — interactive selector + keybind-driven modes  
- `bat` — colored preview/paging (`--wrap=character` used for narrow panes)  
- `fd` — fast filesystem traversal of Python’s stdlib directory  
- `ripgrep` (`rg`) — filtering and simple matching  
- `sed`, `cut`, `sort`, `uniq`, `tr` — text shaping  
- `notify-send` — desktop notification showing resolved source path  
- `ranger` — directory browsing when selecting package directories  

### Description

`pyman.sh` is a TUI “documentation hub” for Python on Arch. It detects your Python minor version (`python -V` → `3.xx`) and points `SEARCH_PATH` to `/usr/lib/python$VERS/` (i.e., the stdlib). From there it:

- Lists top-level stdlib entries (`get_site_packages`) and lets you drill into submodules (`get_submodules`) by turning paths into dotted import names.
- Provides quick-switch modes for `pydoc`:
  - Builtins (`alt-b`)
  - Keywords (`alt-k`)
  - Topics (`alt-t`)
  - Libraries/modules view (`alt-l`, default)
- Uses a live preview pane (`bat_preview`) that renders `pydoc` output as `man` or `rst` depending on the current prompt.

Pressing `Enter` either opens the resolved source (with `bat` for files, `ranger` for directories) or displays the `pydoc` page when in Builtins/Topics/Keywords mode.

### Usage

Run interactively (best as a qtile keybinding or terminal launcher):

- `pyman.sh`

Inside fzf:

- `alt-l` → libraries/modules list (default)
- `alt-m` → drill into submodules for the current selection
- `alt-b` → builtins
- `alt-k` → keywords
- `alt-t` → topics
- `alt-p` → toggle preview
- `Enter` → open source (modules view) or show docs (other views)

---

> [!TIP]
> `PYMAN_CUR_FILE`/`PYMAN_CUR_DIR` are created/exported but never used; you can remove them or actually use them for caching `pydoc` output. Also, parsing `python -V` with a strict `3.xx` regex can break on alphas/betas or future formatting—consider `python -c 'import sys; print(f"{sys.version_info.major}.{sys.version_info.minor}")'`. Finally, the script assumes stdlib lives in `/usr/lib/python$VERS/`; on some setups it may differ (e.g., `/usr/lib/python3.xx/` is fine on Arch, but virtualenvs won’t be covered).