# Modular environment loader (env.sh)

---

**env.sh**: Modular environment loader for your scripts (paths, colors, fzf, git)

---

### Dependencies

- `bash` (uses `BASH_SOURCE`, function exports)
- `readlink` (for `readlink -f` to resolve the scripts directory)
- `fd` (used by `FZF_DEFAULT_COMMAND`)
- `fzf` (consumes `FZF_DEFAULT_*` variables)
- `bat` (used by `FZF_PREVIEW_COMMAND`)

### Description

This file is a shared library meant to be sourced by your scripts to standardize environment setup on Arch Linux (and nicely matches qtile keybound scripts). The main entrypoint is `load_env`, which accepts a comma-separated list of *modules* and exports environment variables accordingly.

Key behaviors:

- **One-time core init**: guarded by `SCRIPTS_ENV_LOADED`. It sets `SCRIPTS` to the root of your scripts collection (derived from this file’s path).
- **paths/core module**: defines `SCRIPT_PATHS` and prepends `$SCRIPTS/bin` and `$HOME/.local/bin` to `PATH` if missing.
- **colors module**: exports the Flexoki palette plus semantic aliases (`PRIMARY_COLOR`, `ERROR_COLOR`, etc.), enabling consistent theming across scripts.
- **fzf module**: configures `FZF_DEFAULT_COMMAND` (using `fd`) and `FZF_DEFAULT_OPTS` with Flexoki colors when available, plus a `bat` preview command.
- **git module**: exports `GIT_REPOS` and `LOCALDATA` defaults.
- **debug module**: prints what was loaded to stderr.

Convenience wrappers (`load_env_minimal`, `load_env_fzf`, etc.) cover common combinations and are exported for use in subshells.

### Usage

Source it, then load the modules you need:

```bash
source "$HOME/.scripts/lib/env.sh"
load_env "core,colors"
```

Common patterns:

```bash
load_env_minimal          # core only
load_env_colors           # core + Flexoki
load_env_fzf              # core + colors + fzf
load_env_full             # core + colors + fzf + git + paths
```

Debug a script’s environment quickly:

```bash
load_env "core,colors,fzf,debug"
```

---

> [!TIP]
> `[[ "$modules" == *"fzf"* ]]` does substring matching, so a module named `g` would match `git` accidentally. Consider splitting on commas into an array and matching exact module names. Also, `export -f` only helps for `bash` subshells (not `sh`), and `FZF_DEFAULT_OPTS` includes leading whitespace/newlines—usually fine, but trimming can avoid surprises.