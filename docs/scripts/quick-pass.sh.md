# Quick Pass picker & typer

---

**quick-pass.sh**: Fuzzy-pick a pass entry and type it via ydotool

---

### Dependencies

- `bash`
- `fd` — used to list `.gpg` entries in your password store
- `pass` — password-store backend (`pass edit`, `pass -c`)
- `sort`, `sed` — basic formatting pipeline
- `improved-fzfmenu.sh` — your fzf wrapper (must accept `--ansi` and pass `--bind` through to `fzf`)
- `ydotool` — types the selected secret into the focused window
- `$PASSWORD_STORE_DIR` — must point to your password-store directory (e.g. `~/.password-store`)

### Description

This script provides a fast “pick and type” workflow for `pass` on Arch (nice for qtile keybindings). It:

1. Uses `fd` to recursively find `*.gpg` files under `$PASSWORD_STORE_DIR`.
2. Formats each candidate with ANSI colors + a lock icon, and strips paths to resemble `pass` entry names (e.g. `mail/gmail`).
3. Feeds the list into `improved-fzfmenu.sh` with ANSI enabled and a custom delimiter, so fzf token `{3}` resolves to the actual entry name.
4. Key actions inside fzf:
   - `Ctrl-e`: opens `pass edit <entry>`
   - `Ctrl-y`: runs `pass -c <entry>` (copies to clipboard)
   - `Enter`: writes the selected line to `/dev/shm/psst`
5. After fzf exits, it calls `ydotool type "$(cat /dev/shm/psst)"`.

Because `ydotool` types into whatever currently has focus, this pairs well with launching it, selecting an entry, alt-tabbing (if needed), then confirming.

### Usage

Run interactively (requires a TTY and focus for typing):

    quick-pass.sh

Typical “tldr” inside the menu:

- Search: start typing
- Edit entry:

      Ctrl-e

- Copy to clipboard:

      Ctrl-y

- Type into focused window:

      Enter

Suggested qtile binding:

- Bind to a key that opens a small terminal (or uses your fzf launcher) and keep target window focused before pressing Enter.

---

> [!TIP]
> Consider extracting the actual pass entry name (without ANSI/prefix) before writing to `/dev/shm/psst`; currently `echo {}` may include formatting or extra tokens, so `ydotool` could type junk. Prefer `enter:become(echo {3} > /dev/shm/psst)` or write the decrypted secret via `pass show -n {3}`. Also, `/dev/shm/psst` is a plaintext file; use a safer IPC mechanism (pipe, mktemp + shred, or direct `ydotool type "$(pass show -n ...)"`).