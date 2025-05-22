# Ardour Session Opener

---

**ardour-open.sh**: Interactive picker for Ardour sessions with formatted preview and recent-first sort

---

### Dependencies

- `fd`: Fast, user-friendly alternative to `find`, used to locate `.ardour` files in your audio projects directory.
- `stat`: Retrieves modification timestamps, required for sorting sessions by recency.
- `xargs`, `sed`, `sort`: Standard Unix tools for manipulating file lists and formatting.
- `bat`: Syntax-highlighted preview for `.ardour` project files in FZF preview pane.
- `improved-fzfmenu.sh`: Custom script or wrapper (user-supplied); used to invoke `fzf` with enhanced options.
- `fzf`: Fuzzy finder for interactive selection.
- `ardour`: The DAW itself, to open the selected session.

---

### Description

This script provides an interactive way to open Ardour sessions from your `~/audio/PROJECTS` directory.

#### How it works:

- It uses `fd` to search for all `.ardour` session files under your `AUDIO_PROJECTS` root.
- Outputs are sorted by modification time (most recent first), via `stat` and `sort`.
- The session list is color-formatted to distinguish paths, then shown in an FZF-based menu using the user script `improved-fzfmenu.sh`.
- A syntax-highlighted preview of each `.ardour` XML file is available (using `bat`) in the FZF preview window.
- When a session is selected, the script opens it with Ardour, stripping color escape sequences as needed.

Functions are modular:
- `search_cmd`: Gathers, sorts, and formats available sessions.
- `strip_ansi`: Removes ANSI color codes (internal use).
- `get_path`: Resolves selected session to its absolute, uncolored path.
- `preview_cmd`: Provides text preview for the FZF pane.
- The main workflow (bottom of script) orchestrates calling these utilities.

---

### Usage

You can run this script in your terminal:

```sh
~/.scripts/bin/ardour-open.sh
```

Or, assign it to a keybinding in your Qtile config for quick access.

#### Example (tldr):

```sh
ardour-open.sh
```
_Select session interactively → see colored list + preview → press ENTER to open in Ardour_

**Arguments:**  
No command-line arguments required; all configuration is by convention (`$HOME/audio/PROJECTS`).

**Key Integration Tip:**  
For fastest workflow on Qtile, bind to a convenient key (e.g., Mod4+a).

---

> [!NOTE]
>
> - **Hardcoded paths:** The project directory is set via `export AUDIO_PROJECTS="$HOME/audio/PROJECTS"`. Hardcoding may be inflexible if you change machines/locations. Consider moving this to a config file or supporting command-line overrides.
>
> - **Reliance on user script:** `improved-fzfmenu.sh` is not standard; ensure it’s robust and maintained.
>
> - **Color formatting:** The color escape codes in search results look nice but could cause problems if the script is ever used outside FZF (since it relies on “--ansi”). Ensure `strip_ansi` covers all edge cases.
>
> - **Potential performance:** For very large audio project trees, the stat + sort step might add noticeable delay. For now, it should be fine for typical project counts.
>
> - **Preview width/behavior:** Preview window width is hardcoded; if you have small terminals, tweak the `--preview-window` parameter.