# Fast Fuzzy File Editor

---

**editor.sh**: Quickly edit files using fzf, with smart search modes and exclusions.

---

### Dependencies

- `fd`: Fast alternative to find, used for file searching (respects exclusions).
- `fzf`: Fuzzy finder interface for selecting files interactively.
- `nvim`: Neovim editor; edit target file.
- `bat`: Syntax-highlighting preview for files in fzf.
- `chezmoi`: Accesses unmanaged dotfiles when using config mode.
- `rg`: (ripgrep) Used for fast filtering in config mode.
- `sudo`: For editing files requiring elevated permissions.
- Environment variables used: `$SCRIPTS`, `$LOCALDATA`

---

### Description

This script is a highly flexible file opener/editor, integrating the power of `fd` for fast searching and `fzf` for intuitive fuzzy selection. It is optimized for your workflow on Arch Linux with `qtile`, and is designed to help you locate and edit files rapidly across various contexts: scripts, configuration files, the current directory, or any specified location.

#### **Modes**

- **Default:** Searches in your sensible user data, scripts, and home directories, while ignoring system/config paths and common large/irrelevant filetypes.
- **Scripts (`-s`)**: Restricts search to your `$SCRIPTS` directory.
- **Config (`-C`)**: Lists unmanaged `chezmoi` config files only.
- **CWD (`-c`)**: Limits search to the current working directory.
- **Sudo (`-S`)**: Allows selection from root-owned/system config directories and opens with sudo.
- **Directory (`-d <dir>`)**: Searches in any directory you specify.

#### **Smart Features**

- Uses `bat` as an fzf preview window.
- Excludes a comprehensive set of non-editable and binary file patterns.
- Custom fzf bindings:  
  - `<C-H>` shows hidden files;  
  - `<C-S>` reverts to non-hidden files.
- Assignable to keybindings or used interactively.

---

### Usage

`editor.sh [-s|--scripts] [-c|--cwd] [-C|--config] [-d|--dir <dir>] [-S|--sudo] [-h|--help]`

Examples:

```sh
editor.sh
# Search in user data, scripts, home, etc.

editor.sh -s
# Only in $SCRIPTS directory

editor.sh -c
# Only in the current directory

editor.sh -d ~/projects/foo
# In the given directory

editor.sh -S
# Enable sudo, search root/system config locations

editor.sh -C
# Edit chezmoi 'unmanaged' configs

editor.sh -h
# Show usage
```

Within `fzf`, use `<C-H>` to reveal hidden files and `<C-S>` revert.

Can be run interactively, or assigned to a qtile keybinding for fast access.

---

> [!TIP]
> The script is robust and pragmatic, but could be improved:
> - `$SCRIPTS` and `$LOCALDATA` are assumed set; add checks or sensible defaults.
> - `bat` and `chezmoi` are hard-coded; consider gracefully bypassing features if missing.
> - The exclusion list is impressive but static; consider sourcing from a config, or documenting how to tweak.
> - The preview for config mode may break if chezmoi or rg is missing.
> - For non-bash shells or minimalist setups, ensure bashisms and external dependencies are portable for your workflow.
> - Variable quoting is inconsistent (e.g., `[ -z $2 ]` should be `[ -z "$2" ]`).