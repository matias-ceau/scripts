# Obsidian Vault Selector (fzf-driven)

---

**obsidian-vault-selector.sh**: Select and open Obsidian vaults with preview and search

---

### Dependencies

- `obsidian` — desktop app CLI; handles obsidian:// links on Arch
- `jq` — parse vault paths from Obsidian config
- `eza` — colorful ls and tree previews
- `ripgrep` (`rg`) — filter preview noise
- `bat` — style the tree preview
- `improved-fzfmenu.sh` — your fzf wrapper; used for selection UI
- `libnotify` (`notify-send`) — user feedback when nothing is selected
- `util-linux` (`setsid`) — detach the launcher process
- `bash`, `awk`, `sed` — shell utilities
- Obsidian config: `$XDG_CONFIG_HOME/obsidian/obsidian.json`

### Description

This script discovers your Obsidian vaults from Obsidian’s config file, presents them in an fzf-based menu, and opens the chosen vault via Obsidian’s deep-link scheme.

Flow:
- Fetch vault directories from `$XDG_CONFIG_HOME/obsidian/obsidian.json` using `jq`, then normalize via `eza --stdin`.
- Show an interactive picker (`improved-fzfmenu.sh`) listing only the last path segment (vault name) while keeping the full path for operations.
- Live preview blends:
  - `eza -la` for a detailed top-level listing, and
  - a colorized `eza -T` tree, filtered by `rg` to hide noisy binaries, then prettified with `bat`.
- On selection, derive the vault name from the path and open it with `obsidian obsidian://open?vault=<name>` in a detached session (`setsid`). If nothing is selected, a `notify-send` message appears.

### Usage

- Run interactively:
  ```
  ~/.scripts/bin/obsidian-vault-selector.sh
  ```
  Use arrows or type to fuzzy-search; Enter opens the highlighted vault.

- Bind to a qtile key:
  ```
  # in config.py
  from libqtile.lazy import lazy
  Key([mod], "o", lazy.spawn("~/.scripts/bin/obsidian-vault-selector.sh")),
  ```

- TL;DR
  ```
  obsidian-vault-selector.sh  # pick a vault → opens in Obsidian
  ```

Notes:
- Ensure `$XDG_CONFIG_HOME` is set (commonly `~/.config` on Arch).
- `improved-fzfmenu.sh` must be in PATH and compatible with your terminal setup.

---

> [!TIP]
> - Deep link ambiguity: vaults are opened by name. If two vaults share the same name, the wrong one might open. Prefer `obsidian://open?path=<abs_path>` with proper URL encoding.
> - URL encoding: vault names/paths with spaces should be encoded. Consider `jq -sRr @uri` or `python -c 'import urllib.parse,sys;print(urllib.parse.quote(sys.argv[1]))'`.
> - Robustness: quote `$XDG_CONFIG_HOME` and the config path; handle missing/invalid `obsidian.json`.
> - Preview performance: large vaults may slow previews. Consider limiting tree depth (`eza -T -L 2`).
> - Portability: `eza --stdin` behavior can vary; a safer approach is `while read -r p; do echo "$p"; done`. Add `set -euo pipefail` and run `shellcheck` for diagnostics.