# Obsidian Vault Picker

---

**obsidian.xsh**: Pick an Obsidian vault from `$HOME/PKM` and open it via URI

---

### Dependencies

- `xonsh` — runs the script (`#!/usr/bin/env -S xonsh --no-rc`)
- `obsidian` — CLI entrypoint used to open an `obsidian://` URL
- `fzfmenu.sh` — interactive picker (your wrapper around `fzf` / menu UX)
- `eza` — used for the preview tree (`eza -T --sort=modified --color=always …`)
- `file` — checks that entries inside `$HOME/PKM` are directories
- `notify-send` — feedback when nothing is selected
- `ls` — used to list candidate vault names

### Description

This Xonsh script provides a fast “vault switcher” for Obsidian on Arch + qtile setups. It scans `$HOME/PKM` and builds a list of vault candidates by listing entries and filtering to those whose `file -b …` result is `directory`.

The vault list is then piped into `fzfmenu.sh`, letting you interactively choose one vault. While navigating the list, a preview pane shows a tree view of the vault contents using `eza`, sorted by modification time—useful to quickly spot the “active” vault.

Once a vault is selected, the script opens it via Obsidian’s URI scheme:

- `obsidian://open?vault=<vault_name>`

If the selection is empty (escape/cancel), it sends a desktop notification instead of failing silently.

### Usage

Run from a terminal, qtile keybinding, or launcher:

- Open the picker:
  - `obsidian.xsh`
- Typical qtile binding (conceptually):
  - bind a key to: `/home/matias/.scripts/bin/obsidian.xsh`

Notes:
- Vaults must live directly under `$HOME/PKM` and be named exactly as Obsidian expects for `vault=`.

---

> [!TIP]
> Consider switching from `ls` parsing to a safer directory walk (handles spaces/newlines), e.g. `glob`/`os.listdir` + `os.path.isdir`. Also, `file` is relatively heavy; a direct stat check is faster. If vault names can contain spaces, ensure the URI is properly URL-encoded. Finally, you may want to validate that `obsidian` exists and fall back to `xdg-open "obsidian://…"` for portability.