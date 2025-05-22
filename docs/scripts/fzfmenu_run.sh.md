# FZF Menu Runner

---

**fzfmenu_run.sh**: Launches app selection using fzf in a floating terminal, as a `dmenu_run` replacement.

---

### Dependencies

- `fzfmenu_cache.sh`  
  – Script to retrieve/caches a list of executable commands.
- `improved-fzfmenu.sh`  
  – Wrapper to present the list through `fzf` in an improved (highlighted/ansi) way.
- `fzf`  
  – Command-line fuzzy finder.
- `systemd-run`  
  – Run a process in a user-scoped transient systemd unit.
- `bash`  
  – Standard bash shell.
- `xterm` or alternative configured backend  
  – Floating terminal is implied; if using with qtile, proper floating behavior must be configured.

---

### Description

This script is intended as a modern, more powerful drop-in replacement for `dmenu_run` on a system using `fzf` (fuzzy finder) for interactive app launching. It is especially well-suited for advanced window managers like Qtile.

**Workflow**:
1. Gathers available command entries via `fzfmenu_cache.sh`.
2. Pipes them into `improved-fzfmenu.sh` to display and select using `fzf`.
3. Captures the selected command; if none, simply exits.
4. Runs your selection in the background using `systemd-run` for resource isolation, invoking the command under `bash`.

This pattern is robust for use under custom keybindings or as a modular launcher for frequently used programs in the Qtile environment.

---

### Usage

**Run directly in a floating terminal:**
```sh
~/.scripts/bin/fzfmenu_run.sh
```
**Recommended: map to a qtile keybinding (for example, mod+p):**
```python
Key([mod], "p", lazy.spawn("xterm -e ~/.scripts/bin/fzfmenu_run.sh"))
```
Depending on your usual terminal setup or launcher, you may want to ensure that the terminal opens in floating mode for best experience.

**tldr**
- Launch the script to choose and run any command interactively.
- Nothing is executed if you don't make a selection.
- Runs safely in its own systemd scope for stability.

---

> [!TIP]  
> - This script is tightly coupled to custom helpers: `fzfmenu_cache.sh` and `improved-fzfmenu.sh`. These should be version-locked or managed carefully to avoid future breakage.
> - Consider handling multi-word/argument applications more explicitly (e.g., quoted entries) if not already handled downstream.
> - There is no error feedback if a selected program fails to launch; integrating simple notifications (e.g., `notify-send` on failure) could improve UX.
> - For maximum flexibility, you could allow overriding the terminal or make systemd-run optional via flags.  
