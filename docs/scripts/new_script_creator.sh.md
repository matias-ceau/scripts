# New Script Creator (Arch/qtile user scripts bootstrap)

---

**new_script_creator.sh**: Quickly create or import scripts into `$SCRIPTS/bin` with templates

---

### Dependencies

- `bash`
- `bat` (pretty help + preview)
- `ripgrep` (`rg`) to detect extensions
- `neovim` (`nvim`) editor used for interactive editing
- `utils_update_symlimks.sh` user script that refreshes your script symlinks/exports
- Environment variable `SCRIPTS` (expected to point to your user-scripts root; script uses `$SCRIPTS/bin`)

### Description

This script is a small “script scaffolding” utility for your personal scripts on Arch Linux, designed to keep your `$SCRIPTS/bin` directory consistent and executable.

It supports two flows:

1. **Create a new script** in `$SCRIPTS/bin`:  
   - If the filename ends in `.sh`, `.py`, or `.xsh`, it writes an appropriate shebang via `templater()`:
     - `.sh` → `#!/usr/bin/bash`
     - `.py` → `#!/usr/bin/python`
     - `.xsh` → `#!/usr/bin/env xonsh`
   - If there is **no extension**, `ensure_extension()` prompts you to choose Shell/Python/Xonsh and appends the extension.
   - Opens the new file in `nvim`, then `validate_script()` checks the file length; if it looks non-empty it `chmod +x`, refreshes symlinks, and previews the file with `bat`.

2. **Import an existing file** (`--from/-f`):  
   - Marks it executable, moves it into `$SCRIPTS/bin`, runs the symlink updater, and opens it in `nvim`.

### Usage

```sh
new_script_creator.sh --help
```

Create interactively (you’ll be prompted for name + possibly language):
```sh
new_script_creator.sh
```

Create directly (auto-template based on extension):
```sh
new_script_creator.sh backup_home.sh
new_script_creator.sh sync_notes.py
new_script_creator.sh prompt_tool.xsh
```

Create without extension (prompts for s/p/x):
```sh
new_script_creator.sh my_tool
```

Import an existing file into `$SCRIPTS/bin`:
```sh
new_script_creator.sh -f /path/to/some_script.sh
```

---

> [!TIP]
> Consider hardening a few edge cases: `templater()` leaves `template` empty for unknown extensions (creating an invalid shebang). In `--from`, `mv "$2" "$SCRIPT_PATH"` then `nvim "$SCRIPT_PATH/$2"` will fail if `$2` includes directories (it’ll be moved under its basename). Using `basename` and consistent quoting would help. Also, `wc -m "$1"` is awkward for size checks; `stat -c%s` or checking for non-empty content would be clearer.