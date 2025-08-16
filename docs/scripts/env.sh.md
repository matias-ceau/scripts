# env.sh — Modular environment loader

---

**env.sh**: Load modular environment: core, paths, colors, fzf, git, debug

---

### Dependencies

- `bash` — required to source and export functions
- `coreutils` — provides `readlink`, `dirname` used to resolve SCRIPTS root
- `fd` — used by `FZF_DEFAULT_COMMAND` for fast file listing
- `fzf` — fuzzy finder, styled/configured by this script
- `bat` — used by `FZF_PREVIEW_COMMAND` for syntax-highlighted previews
- `git` — optional; only referenced via `GIT_REPOS` var for your scripts

### Description

This library centralizes environment setup for your script collection on Arch/Qtile. Call `load_env "<modules>"` to initialize modules:

- core/paths: Sets `SCRIPTS` to the repo root (two dirs above this file), ensures `~/.local/bin` and `$SCRIPTS/bin` are in `PATH`. Idempotent via `SCRIPTS_ENV_LOADED`.
- colors: Exposes the Flexoki palette via `FLEXOKI_*` and semantic aliases (`PRIMARY_COLOR`, `ERROR_COLOR`, etc.).
- fzf: Configures `FZF_DEFAULT_COMMAND` (via `fd`), Flexoki-driven `FZF_DEFAULT_OPTS` (keybinds: Ctrl-/, Ctrl-u/d), and `FZF_PREVIEW_COMMAND` using `bat`.
- git: Defines `GIT_REPOS` and `LOCALDATA` defaults for your tooling.
- debug: Emits a summary to stderr.

Convenience wrappers: `load_env_minimal` (core), `load_env_colors`, `load_env_fzf`, `load_env_full`.

### Usage

Source from any Bash script:

```bash
# In your script
source "$HOME/.scripts/lib/env.sh"
load_env "core,colors,fzf"
# ...your code
```

Use convenience functions:

```bash
source "$HOME/.scripts/lib/env.sh"
load_env_fzf
```

Bootstrapping in interactive shells:

```bash
# ~/.bashrc (Arch default) or ~/.profile
source "$HOME/.scripts/lib/env.sh"
load_env_minimal
```

Qtile keybinding spawning a script with this env:

```python
# ~/.config/qtile/config.py
from libqtile.lazy import lazy
Key([mod], "p", lazy.spawn("/bin/bash -lc 'source ~/.scripts/lib/env.sh; ~/.scripts/bin/your-script'"))
```

Install helper tools on Arch:

```bash
sudo pacman -S fd fzf bat
```

---

> [!TIP]
> - Module parsing uses substring matching; consider splitting on commas and matching whole tokens to avoid false positives.
> - `SCRIPT_PATHS` includes `/usr/local/bin` but it’s not added to `PATH`; either add it or drop the variable.
> - Multi-line `FZF_DEFAULT_OPTS` may introduce leading whitespace/newlines; use a here-doc or single-line to be safe.
> - `export -f` is Bash-specific; if you move to zsh, source the file and call functions without relying on exported functions.
> - Add fallbacks if `fd`/`bat` are missing (e.g., default `find` and `less`) to make the fzf module more robust.