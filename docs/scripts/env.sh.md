# Modular environment loader (Flexoki + fzf) for your scripts

---

**env.sh**: Modular env loader for scripts: core paths, Flexoki colors, fzf, git, debug

---

### Dependencies

- `bash` — required (uses BASH_SOURCE, export -f)
- `coreutils` — for `readlink` and `dirname`
- `fzf` — optional; only needed when loading the `fzf` module
- `fd` — optional; used by `FZF_DEFAULT_COMMAND` when `fzf` module is loaded
- `bat` — optional; used by `FZF_PREVIEW_COMMAND` when `fzf` module is loaded

### Description

This library centralizes environment setup for your Arch + qtile script collection. It exposes a single entrypoint, `load_env`, that activates targeted “modules”:

- core/paths: Sets `SCRIPTS` to the repository root (detected from this file path), ensures `$SCRIPTS/bin` and `$HOME/.local/bin` are in `PATH`. Loaded by default when no argument is passed. Flags: `SCRIPTS_ENV_LOADED=1`.
- colors: Loads the Flexoki palette as exported variables (`FLEXOKI_*`) and convenience aliases like `PRIMARY_COLOR`, `SUCCESS_COLOR`, etc. Flag: `FLEXOKI_LOADED=1`.
- fzf: Applies opinionated `FZF_DEFAULT_COMMAND` (via `fd`), Flexoki-themed `FZF_DEFAULT_OPTS` when colors are loaded, and a `bat`-based preview. Flag: `FZF_ENV_LOADED=1`.
- git: Sets data locations (`GIT_REPOS`, `LOCALDATA`) without shelling out to git.
- debug: Prints what got loaded to stderr to help during development.

Convenience functions are exported for common sets: `load_env_minimal`, `load_env_colors`, `load_env_fzf`, `load_env_full`.

### Usage

- In another script (recommended): add at the top  
  `source "$HOME/.scripts/lib/env.sh"; load_env_fzf`
- Minimal path setup only:  
  `source "$HOME/.scripts/lib/env.sh"; load_env_minimal`
- Colors + fzf with themed UI:  
  `source "$HOME/.scripts/lib/env.sh"; load_env "core,colors,fzf"`
- Full stack (paths, colors, fzf, git):  
  `source "$HOME/.scripts/lib/env.sh"; load_env_full`
- Ad-hoc in a terminal for testing:  
  `source ~/.scripts/lib/env.sh; load_env_full; env | grep -E 'FZF_|FLEXOKI_|SCRIPTS'`
- qtile binding: point your keybinding to a script that sources this file and calls one of the helpers before running its logic. No need to preload it in qtile itself.

On Arch, install optional tools as needed: `pacman -S fzf fd bat`.

---

> [!TIP]
> Improvements:
> - Module matching is substring-based; current comma-separated style works, but `[[ "$modules" == *"core"* ]]` will also match unexpected strings containing `core`. Consider splitting on commas into an array and matching exact tokens.
> - `FZF_DEFAULT_OPTS` is multi-line; it works, but trimming indentation would be cleaner. You could build it incrementally or via an array for readability.
> - Add soft checks for `fd`, `fzf`, and `bat` to avoid confusing errors when they’re missing (e.g., set sane fallbacks).
> - Consider a `paths`-only mode that doesn’t piggyback on `core`, to clarify intent.