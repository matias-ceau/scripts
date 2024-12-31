# Script Launcher with FZF Integration

---

**script_launcher.sh**: A script that uses `fzf` for selecting and executing other scripts with preview and additional utilities.

---

### Dependencies

- `fzf`: A command-line fuzzy finder used for script selection and interaction.
- `fd`: A fast and user-friendly alternative to `find`, required for locating scripts.
- `bat`: A syntax-highlighting pager, used for previewing documentation and source code.
- `rg` (ripgrep): Efficient recursive search for matching patterns in files.
- `pastel`: For color handling and ANSI formatting.
- User scripts:
  - `improved-fzfmenu.sh`: An enhanced wrapper around `fzf`.
  - `terminal_with_command.sh`: Opens a terminal with the specified command.
  - `nvim_in_new_terminal.sh`: Opens `nvim` in a new terminal with the specified command.

---

### Description

This script is a utility to launch and manage scripts interactively via a fuzzy finder (`fzf`). Depending on the mode, it either uses `fzf` directly (`--embedded` / `-E`) or an extended custom interface (`improved-fzfmenu.sh`).

Key features:
- **Script filtering**: Uses `fd` to locate files/scripts by extension (`.sh`, `.py`, `.xsh`), with colored labels.
- **Preview integration**:
  - Source code preview via `bat` with syntax highlighting.
  - Markdown documentation preview for related `.md` files in the `$SCRIPTS` directory.
- **Key bindings**:
  - `Enter`: Execute the selected script directly.
  - `Alt-Enter`: Launch the script in a new terminal via `terminal_with_command.sh`.
  - `Ctrl-E`: Open the script for editing in `nvim`.
  - `Alt-E`: Edit the script in a new terminal window.
  - `Alt-S / Alt-D`: Toggle previews between documentation and source code.

It also dynamically generates labels, headers, and color-coded indicators using `pastel` for better user experience.

---

### Usage

```bash
script_launcher.sh [OPTION]
```

Options:
- `--embedded` / `-E`: Runs the script with the standard `fzf` behavior instead of extended mode.

Example command:
```bash
script_launcher.sh
```

When launched:
- Use the fuzzy finder (`fzf`) interface to search and select a script.
- CTRL-E, ALT-E, ALT-S, Alt-D bindings enhance the functionality for interaction and previewing.

Environment variables such as `$SCRIPTS` and `$FLEXOKI_*` (for colors) must be defined for correct functionality.

---

> [!NOTE]
> - The script assumes the presence of specific user scripts (e.g., `terminal_with_command.sh`) and settings (e.g., `$SCRIPTS` path). Consider making it more robust with error checks for potentially undefined environment variables or missing dependencies.
> - Adding the ability to toggle multiple-selection mode in `fzf` or process additional arguments to functions could improve flexibility.
> - The TODO section suggests potential enhancements, like rendering documentation as PDF/HTML or logging functionality, which could significantly improve usability.