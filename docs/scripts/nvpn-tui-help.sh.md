# NordVPN TUI Helper (and Generic CLI TUI Helper)

---

**nvpn-tui-help.sh**: Interactive terminal UI for navigating nordvpn (or other CLI programs) commands and help.

---

### Dependencies

- `fzf` — Fuzzy finder for command selection (core interactive interface).
- `bat` — Previewer for highlighting help texts.  
- `sed` — Simple text transformations.
- `bash` — The script uses associative arrays, function definitions, and arrays.
- `nordvpn` (default), or optionally: `docker`, `kubectl`, `git` — The CLI your are targeting.
- (Optional but recommended): Make sure the CLI you target supports either `--generate-bash-completion`, `--completion`, or similar.

---

### Description

This script creates a powerful TUI (Text User Interface) for interactively navigating the sub-commands and help content of CLI programs (mainly designed for `nordvpn`, but also supports `docker`, `kubectl`, `git`, or any suitably completable tool).

**Main Features:**

- **Command Exploration:** Visual, keyboard-driven navigation through the command tree of the underlying CLI using `fzf`.
- **Live Previews:**  
  - See the help message for each command/sub-command in real time (right-hand pane) via `bat` for coloring.
  - Get further auto-completion options for nested sub-commands (deep dives).
- **Command History/Backtracking:** Ability to walk up and down the command tree—go back with ".. (back)".
- **Multi-Program Support:** Can target any CLI with a completion script (`nordvpn`, `docker`, `kubectl`, `git` supported out of the box).
- **Keyboard Shortcuts:**  
    - Scroll previews, toggle preview wrap, reload completions, and more (see `--bind` options in `fzf`).

#### How It Works

- The script uses specified CLI completion mechanisms to generate a list of possible sub-commands or options.
- It calls `fzf` to create an interactive menu based on those completions.
- Selecting an option drills down to the next level, with live help and suggested sub-commands/flags visible in the preview.
- The command you preview is actually constructed live (`$program $current_cmd $selection`).
- You can always go "back" to the previous command step.

---

### Usage

Basic usage (for nordvpn):
```
bash /home/matias/.scripts/bin/nvpn-tui-help.sh
```

Target another supported program (e.g., docker):
```
bash /home/matias/.scripts/bin/nvpn-tui-help.sh docker
```

**TL;DR summary:**
```
nvpn-tui-help.sh [program]
# Start a TUI for the program (default: nordvpn)
# - Use FZF keys to select commands, scroll help previews, reload completions, toggle preview wrap
# - ".. (back)" to go back up the command hierarchy
# - Enter on an option drills down, showing more sub-commands/help if available.
```

This script is ideal to assign to a keybinding in Qtile or run as a launcher to get live help/completion for your CLI tools.

---

> [!TIP]
>
> **Critique:**  
> - The script assumes compatible completion flags for target CLIs—adding more robust detection or documentation for new tools would improve reliability.
> - Dependency on `bat` for preview is not optional—add fallback to `cat` if not present.
> - May run into issues with very deep command trees or unusual CLI tools.
> - State/history preservation is session-limited, and the interface could be further streamlined if using `fzf`'s custom preview bindings more extensively.
> - Consider making help previews adjustable for long outputs or allow toggling raw/manual mode.
> - Error handling could be more explicit if the completion/help flags fail (`$program $completion_flag` might not always succeed).