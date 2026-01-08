# Wayland Screenshot Helper

---

**screenshot.sh**: Take a screenshot with Grim, optionally selecting an area

---

### Dependencies

- `bash`
- `grim` — Wayland screenshot tool (outputs PNGs)
- `slurp` — interactive region selector (used with `--select`)
- `notify-send` — desktop notifications (typically via `libnotify`)
- `date` — for timestamped filenames

### Description

This script is a small Wayland-oriented screenshot wrapper designed for your Arch + qtile workflow (especially under a Wayland session). It writes screenshots to `~/Pictures` using a unique, timestamp-based filename:

- Filename format: `YYYY-MM-DD-screenshot-<unix_epoch>.png`
- Output directory: `$HOME/Pictures`

It supports two modes:

1. **Fullscreen** (default): calls `grim` without geometry.
2. **Area selection** (`--select`): uses `slurp` to let you draw a rectangle, then passes the resulting geometry to `grim -g`.

After saving, it sends a notification showing the script name and the saved filename, which is convenient when bound to a qtile keybinding (no terminal interaction required).

### Usage

Fullscreen screenshot (saves into `~/Pictures`):
```sh
~/.scripts/bin/screenshot.sh
```

Select an area interactively:
```sh
~/.scripts/bin/screenshot.sh --select
```

Example qtile keybindings (conceptual):
```sh
# Fullscreen
screenshot.sh

# Selection
screenshot.sh --select
```

---

> [!TIP]
> A few improvements to consider:
> - The notification message always says “Selection saved…” even for fullscreen; you might want separate wording.
> - Quote your paths to be safe: `"$ _OUTPUT_DIR/$_NAME"` (especially if `$HOME` ever contains spaces).
> - Ensure the output directory exists (`mkdir -p "$_OUTPUT_DIR"`), otherwise `grim` will fail silently.
> - Consider allowing a custom directory via an env var or flag (useful for syncing to a “Screenshots” subfolder).