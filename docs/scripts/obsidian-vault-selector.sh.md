# Obsidian Vault Selector (fzf)

---

**obsidian-vault-selector.sh**: Interactive picker to open any Obsidian vault from your config

---

### Dependencies

- `bash`
- `jq` — parses Obsidian’s `obsidian.json` to extract vault paths
- `obsidian` — CLI entrypoint that can handle `obsidian://` URLs
- `improved-fzfmenu.sh` — your wrapper around `fzf` (terminal UI + options)
- `eza` — directory listing and tree preview (with icons/colors)
- `rg` — filters noisy file types from the tree preview
- `bat` — pretty-prints the preview output with colors
- `notify-send` — desktop notification if nothing is selected
- `setsid` — detaches Obsidian launch from the terminal

### Description

This script reads your Obsidian vault list from:

- `$XDG_CONFIG_HOME/obsidian/obsidian.json` (defaults to `~/.config`)

It extracts each vault `path` via `jq`, formats them as directories, then feeds them into `improved-fzfmenu.sh` for an interactive selection UI.

To make `fzf`’s subshell actions work reliably, it writes helper functions to a temporary file and `source`s it inside each `fzf` action:

- `preview_cmd <path>`: shows a detailed directory listing and a modified-sorted tree preview, filtering out common “noise” assets (`.js`, `.css`, images, archives) before piping through `bat`.
- `plabel_cmd <path>`: prints a compact label for the preview header.
- `open_vault <path>`: derives the vault name from the selected path (last path segment) and launches `obsidian://open?vault=<name>` in the background.

The fzf UI is tuned for readability: ANSI colors, top preview (70%), dynamic preview refresh on resize, and a focus hook to update the preview label.

### Usage

Run from a terminal (or bind in qtile):

- `obsidian-vault-selector.sh`

tldr:

- Open picker:  
  `obsidian-vault-selector.sh`
- Select a vault with arrows / search, then press `Enter` to open it.
- If `obsidian.json` is missing, you’ll get an error on stderr.

qtile example keybinding idea:

- Bind to launch in your preferred terminal, e.g.  
  `alacritty -e obsidian-vault-selector.sh`

---

> [!TIP]
> Potential improvement: `open_vault()` uses the directory basename as the vault name, but Obsidian vault identifiers in `obsidian.json` aren’t guaranteed to match the folder name. Consider extracting the *vault name/key* directly from the JSON (map keys to paths) to avoid “vault not found”. Also, the preview pipeline (`eza -T | rg -v | bat`) can be slow on large vaults; adding a depth limit (e.g. `eza -T -L 3`) or caching would improve responsiveness.