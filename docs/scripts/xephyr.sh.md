# Qtile Xephyr Sandbox Launcher

---

**xephyr.sh**: Launch Qtile in Xephyr with a terminal for safe config testing

---

### Dependencies

- `bash`
- `Xephyr` (from `xorg-server-xephyr`) — nested X server
- `python3` — used to run Qtile and (by default) detect a terminal
- `qtile` (your local checkout at `../bin/qtile`) — started inside Xephyr
- `libqtile` — for `libqtile.utils.guess_terminal`
- A terminal emulator (auto-detected), or set via `APP`

### Description

This script starts a nested X server via Xephyr and runs a separate Qtile instance inside it. It’s ideal on Arch/qtile for testing config changes without risking your main qtile session.

Key behavior:

- Resolves `HERE` to the script’s directory and starts Qtile from `HERE/../bin/qtile`, which fits a development checkout layout.
- Uses environment variables for customization:
  - `SCREEN_SIZE` (default `800x600`)
  - `XDISPLAY` (default `:1`)
  - `LOG_LEVEL` (default `INFO`)
  - `APP` defaults to `libqtile.utils.guess_terminal()`
  - `PYTHON` defaults to `python3`
- Exports `QTILE_XEPHYR=1` for the nested session (useful in your config to branch behavior).
- Lifecycle: when the nested Qtile exits, the script kills Xephyr.

### Usage

Run from a terminal (recommended), optionally passing qtile CLI args after `--`-style usage:

- Basic:
  - `~/.scripts/dev/xephyr.sh`

- Custom screen size and display:
  - `SCREEN_SIZE=1280x720 XDISPLAY=:2 ~/.scripts/dev/xephyr.sh`

- Increase Qtile log verbosity:
  - `LOG_LEVEL=DEBUG ~/.scripts/dev/xephyr.sh`

- Force a specific terminal inside Xephyr:
  - `APP=alacritty ~/.scripts/dev/xephyr.sh`

- Pass arguments to `qtile start`:
  - `~/.scripts/dev/xephyr.sh -c ~/.config/qtile/config.py`

---

> [!TIP]
> Improvements to consider:
> - Quote variables (`"$0"`, `"$@"`, `"${SCREEN_SIZE}"`, etc.) to avoid word-splitting issues.
> - Add `set -euo pipefail` and a `trap` to reliably clean up Xephyr on errors/interrupt (`INT`, `TERM`).
> - The `sleep 1` race can be flaky; consider polling until the Xephyr display is ready (e.g., `xdpyinfo -display "$XDISPLAY"` in a loop).
> - `-ac` disables access control; fine locally, but note the security tradeoff.