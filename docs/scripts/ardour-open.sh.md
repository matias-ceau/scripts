# Ardour Session Opener (fzf + bat)

---

**ardour-open.sh**: Fuzzy-pick and open Ardour sessions with colored list and bat preview

---

### Dependencies

- `bash` — interpreter
- `fd` — fast file search for .ardour files
- `xargs`, `stat`, `sort`, `sed`, `echo` — GNU coreutils/textutils
- `bat` — syntax-highlighted preview (XML for .ardour)
- `fzf` — fuzzy finder (used via wrapper)
- `improved-fzfmenu.sh` — your wrapper around `fzf` with preview support
- `ardour` — DAW to open the selected session
- Optional: `qtile` — to bind to a key for quick access

### Description

This script scans your Ardour project directory for session files (*.ardour), sorts them by most recently modified, and presents a colorized list in an fzf-powered menu. While navigating, a live preview of the selected .ardour (XML) file is shown using bat, sized to the preview pane.

Key pieces:
- `AUDIO_PROJECTS` defaults to `$HOME/audio/PROJECTS` and controls the search root.
- `search_cmd` builds the session list with colorized path segments and sorts by mtime via `stat -c %Y`.
- `preview_cmd` calls `bat -l xml` with `--terminal-width=$FZF_PREVIEW_COLUMNS` for readable previews.
- `get_path` sanitizes the selected colored entry (ANSI stripped) and reconstructs the absolute path.
- Selection is performed through `improved-fzfmenu.sh` with `--ansi` and a 60% preview pane. The chosen session is opened with `ardour`.

### Usage

- Run interactively:
```
~/.scripts/bin/ardour-open.sh
```

- Override the projects directory (one-off):
```
AUDIO_PROJECTS="$HOME/audio/ARCHIVE" ~/.scripts/bin/ardour-open.sh
```

- Qtile keybinding (e.g. in config.py):
```
Key([mod], "a", lazy.spawn("~/.scripts/bin/ardour-open.sh"))
```

- Tip: If you cancel the menu, Ardour may be spawned with an empty path. Consider adding a guard (see Critique).

---

> [!TIP]
> - Paths with spaces/newlines may break the `xargs` pipeline. Prefer `fd -0 … | xargs -0 …` to be robust.
> - The colorization `sed` rules hard-code `/home/matias/audio/PROJECTS`. Replace with `$AUDIO_PROJECTS` to avoid drift.
> - Check for cancellation before launching: if `"$selected"` is empty, exit without calling `ardour`.
> - Use `printf` instead of `echo -e` for safer escape handling.
> - Consider quoting `$FZF_PREVIEW_COLUMNS` and providing a default when unset.
> - Add dependency checks and helpful messages if `fd`, `bat`, or `improved-fzfmenu.sh` are missing.