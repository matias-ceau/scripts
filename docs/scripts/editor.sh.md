# Interactive fzf Editor Picker (nvim)

---

**editor.sh**: Fuzzy-find files with `fd`/`fzf` and open them in `nvim` (optionally sudo)

---

### Dependencies

- `bash`
- `fd` (fast file finder; drives the candidate list)
- `fzf` (interactive selector + reload bindings)
- `bat` (syntax-highlighted preview + pretty help output)
- `neovim` (`nvim`, the editor being launched)
- `ripgrep` (`rg`, used in `--config` mode)
- `chezmoi` (only for `--config`, lists unmanaged files)
- `$SCRIPTS` (environment variable; your scripts directory)
- `$LOCALDATA` (environment variable; extra search root in default mode)
- `sudo` (only for `--sudo` mode)

### Description

`editor.sh` is a “quick open” launcher for Arch/qTile workflows: it builds a search command (mostly `fd`) based on a single mode flag, feeds it into `fzf`, previews the currently highlighted file via `bat`, then opens the selection in `nvim`.

Key behavior:
- Aggressive exclusions: large/binary/media formats, caches, archives, and common heavy directories (e.g. `.git`, `node_modules`) are filtered out to keep results “editable”.
- Dynamic hidden-file toggling inside `fzf`:
  - `Ctrl-h` reloads results with `--hidden` enabled and changes the prompt to `Hidden>`.
  - `Ctrl-s` reloads back to non-hidden mode.
- Modes:
  - Default: searches across `$LOCALDATA`, `$SCRIPTS`, `$HOME`, and `$HOME/docs` (while excluding a few top-level dirs and system paths).
  - `--cwd`: only current directory.
  - `--scripts`: only `$SCRIPTS`.
  - `--dir <dir>` (or passing a directory as first arg): search that directory.
  - `--config`: uses `chezmoi unmanaged -p absolute` (filtered to dotfiles) to edit unmanaged config paths.
  - `--sudo`: searches root-owned files across `/etc`, `/var/log`, etc., and opens with `sudo -E nvim`.

### Usage

```sh
editor.sh                      # default sensible search roots
editor.sh --cwd                # limit to current directory
editor.sh --scripts            # limit to $SCRIPTS
editor.sh --dir ~/projects     # pick a directory explicitly
editor.sh ~/projects           # same as --dir
editor.sh --config             # chezmoi unmanaged dotfiles list
editor.sh --sudo               # root-owned/system files, open with sudo
```

Inside `fzf`:
- `Ctrl-h` toggle hidden files on
- `Ctrl-s` toggle hidden files off

---

> [!TIP]
> - `-d|--dir` checks `-z $2` without quotes; use `-z "$2"` to avoid word-splitting/globbing issues.
> - In `--config` mode the command switches away from `fd`; the `Ctrl-h` reload still forces `fd --hidden`, which may surprise you—consider disabling those binds for config mode.
> - `eval "$default_fd_cmd"` is convenient but risky; you can avoid `eval` by building the command as an array.
> - Default mode mixes relative excludes like `-E /etc`; `fd`’s `-E` matches patterns, not necessarily absolute paths—verify exclusions behave as intended.