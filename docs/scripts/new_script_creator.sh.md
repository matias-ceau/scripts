# User Script Generator

---

**new_script_creator.sh**: Quickly create or adapt user scripts with templating and permissions in `$SCRIPTS/bin`.

---

### Dependencies

- `bat`: Command-line file viewer with syntax highlighting (also for help text here).
- `rg` (ripgrep): Used for extension matching.
- `nvim`: For opening/creating scripts with your default editor.
- `utils_update_symlimks.sh`: Your local script to update symlinks after script creation/move.
- `wc` (coreutils): To count characters for validation.

---

### Description

This script is a user script "scaffolder" designed to simplify and standardize script creation under your personal Arch Linux setup. It's especially convenient when you work heavily with `$SCRIPTS/bin` and want new scripts to be ready-to-edit, executable, and conveniently symlinked for use in your environment (e.g., with qtile keybindings).

**Key Features:**
- **Templating:** Determines script type (`bash`, `python`, or `xonsh`) from filename extension, or prompts if ambiguous.
- **Safe creation:** Prevents empty scripts; validates by minimal character count.
- **Symlinks:** Automatically runs your symlink updater.
- **Integration:** Opens scripts directly in `nvim`.
- **Existing scripts:** Supports "importing" (making executable & moving) existing files into the user scripts directory.

**Functions:**
- `templater <filename>`: Outputs a shebang for supported script extensions.
- `ensure_extension <filename>`: Appends/asks for appropriate extension if missing.
- `validate_script <path> <name>`: Ensures script isn't trivially empty and applies permissions and symlinks.
- `script_creator <filename>`: Orchestrates the template, editor, and validation steps.

---

### Usage

General form:
```
new_script_creator.sh [script_file_name] | [-f <path>]
```

#### TLDR Examples

**Interactive (prompt for filename, choose language):**
```
new_script_creator.sh
# Prompts: Filename? my_tool
# Prompts: [S]hell/[p]ython/[x]onsh? s
```

**Direct creation (uses .sh template):**
```
new_script_creator.sh hello_world.sh
```

**Direct creation with extension prompt:**
```
new_script_creator.sh my_utility
# Prompts for preferred extension/language
```

**Convert and import an existing script:**
```
new_script_creator.sh -f /tmp/old_script.sh
```

**Help:**
```
new_script_creator.sh -h
```

**Post-creation, the file is opened for editing in `nvim`. If saved with more than trivial content, it is automatically made executable and symlinks updated.**

---

> [!TIP]
> - The script assumes `$SCRIPTS/bin` is a valid location and `utils_update_symlimks.sh` is globally available and properly updates all relevant symlinks.
> - A minor usability/protection enhancement would be to check if a file with the same name already exists and prompt before overwriting.
> - User prompts use `read` which can occasionally break under non-interactive launches (e.g., from rofi-scripts or hotkeys); consider fallback defaults or error messages in such contexts.
> - The minimal size check (`wc -m "$1" > 22`) could be made more robust or skipped for certain scripts.
> - The script does not currently support more advanced templating or header generation, which could be beneficial if you desire uniform documentation/footer inserts.