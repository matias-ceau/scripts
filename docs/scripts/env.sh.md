# Environment Loader Library (Flexoki/FZF/Paths)

---

**env.sh**: Modular environment loader for colors, FZF, paths, git and debug

---

### Dependencies

- `bash` — required; uses arrays, export -f, and BASH_SOURCE
- `coreutils` — for `readlink` used to resolve script root
- `fd` — used by `FZF_DEFAULT_COMMAND` for fast file search
- `bat` — used by `FZF_PREVIEW_COMMAND` for syntax-highlighted previews
- `fzf` — interactive fuzzy finder, styled via Flexoki palette (optional)

### Description

This library provides a single function, `load_env`, that sets up a modular environment for your scripts on Arch + qtile. It discovers your scripts root at runtime (`$SCRIPTS`) via `readlink -f "${BASH_SOURCE[0]}"`, populates `$PATH` with `$SCRIPTS/bin` and `$HOME/.local/bin`, and optionally configures:

- Flexoki color palette (exports named hex colors + semantic aliases)
- FZF defaults (command, keybindings, preview, and themed colors)
- Git-related locations (`$GIT_REPOS`, `$LOCALDATA`)
- Debug output to stderr

It is idempotent: a guard (`$SCRIPTS_ENV_LOADED`) avoids re-initializing core state. Convenience wrappers are exported: `load_env_minimal`, `load_env_colors`, `load_env_fzf`, `load_env_full`.

### Usage

tldr:
```
# In an interactive shell (bash)
source ~/.scripts/lib/env.sh
load_env "core,colors,fzf"
fzf  # now uses Flexoki theme and fd+bat preview
```

In another script:
```
#!/usr/bin/env bash
source "$(dirname "${BASH_SOURCE[0]}")/../lib/env.sh"
load_env_full
# your script...
```

Using helpers:
```
source ~/.scripts/lib/env.sh
load_env_fzf     # == "core,colors,fzf"
load_env_minimal # only core paths
```

Qtile integration (autostart or spawned scripts):
```
# ~/.config/qtile/autostart.sh
source ~/.scripts/lib/env.sh
load_env_colors
```

Debugging:
```
source ~/.scripts/lib/env.sh
load_env "debug,core,colors,fzf"
```

Note:
- Modules are comma-separated within a single argument (e.g., "core,colors").
- If you use only `fzf` without `colors`, FZF uses sane defaults without theming.

---

> [!TIP]
> - Consider splitting the `modules` argument by commas and matching tokens to avoid accidental substring matches (e.g., “gitx” matching “git”).
> - Auto-enable `colors` when `fzf` is requested to ensure themed output: detect `fzf` and source `colors` if not present.
> - Add command existence checks (`fd`, `bat`, `fzf`) and degrade gracefully or warn when missing.
> - Export `$SCRIPT_PATHS` into `$PATH` only once using a loop over components to reduce duplication logic.
> - Provide an “unload” or “reload” function to reset FZF options when testing.