# Qutebrowser bookmarks/quickmarks sync to chezmoi

---

**qutebrowser-modify-source-bookmarks.sh**: Mirror qutebrowser bookmarks/quickmarks and sessions into your chezmoi source

---

### Dependencies

- `bash`
- `cat`, `sleep`, test utilities (`[ ... ]`) from coreutils
- `fd` (Arch package: `fd`) to enumerate session files
- `chezmoi` to add new session files into the source state
- Environment variables:
  - `$XDG_CONFIG_HOME` (qutebrowser config location)
  - `$XDG_DATA_HOME` (qutebrowser data location)
  - `$CHEZMOI` (path to your chezmoi repo/worktree)
  - `$LOCALDATA` (custom path used as the target “source-of-truth” sessions dir)

### Description

This script keeps your qutebrowser state tracked in your dotfiles by copying:

- `~/.config/qutebrowser/bookmarks/urls` → `$CHEZMOI/dot_config/qutebrowser/bookmarks/urls`
- `~/.config/qutebrowser/quickmarks` → `$CHEZMOI/dot_config/qutebrowser/quickmarks`
- qutebrowser session files (`*.yml`) from `$XDG_DATA_HOME/qutebrowser/sessions` into `$LOCALDATA/qutebrowser/sessions`

It waits 20 seconds before syncing `quickmarks`, presumably to give qutebrowser time to finish writing/renaming entries (e.g., when a quickmark name is added). For sessions, it iterates all `*.yml` files and:

1. If the target file doesn’t exist, runs `chezmoi add` on the source session file so it becomes tracked.
2. Copies the session content into `$LOCALDATA`’s sessions mirror.

There’s also a commented-out block hinting at an intended auto-commit/push workflow.

### Usage

Run manually (e.g., after editing bookmarks/quickmarks or closing qutebrowser):

    qutebrowser-modify-source-bookmarks.sh

Typical “tldr” flows:

- Sync qutebrowser state into chezmoi sources:

      ~/.scripts/bin/qutebrowser-modify-source-bookmarks.sh

- Bind to a qtile keybinding (recommended, non-interactive):

      lazy.spawn("~/.scripts/bin/qutebrowser-modify-source-bookmarks.sh")

---

> [!TIP]
> Consider quoting/avoiding `for f in $(...)` (breaks on spaces); use `while IFS= read -r f; do ...; done < <(fd ...)`. Also `not [ -f ... ]` is non-standard in bash (unless you have an alias/function); replace with `if [ ! -f ... ]; then`. The 20s `sleep` is a blunt workaround—`inotifywait` on the quickmarks file (or a shorter retry loop) would be more deterministic. Finally, copying into `$CHEZMOI/...` directly may bypass `chezmoi`’s templating/state; you might prefer `chezmoi add`/`chezmoi re-add` for bookmarks/quickmarks too, and reinstate the git commit block with proper paths/variables.