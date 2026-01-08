# Toggle Picom compositor

---

**toggle_picom.sh**: Toggle `picom` compositor on/off with desktop notifications

---

### Dependencies

- `picom` (the compositor to start/stop)
- `procps` / `pgrep` + `pkill` (process detection and termination)
- `libnotify` / `notify-send` (user-facing notifications)

### Description

This script provides a simple “compositor toggle” for an X11 session: it checks whether `picom` is currently running and either stops it or starts it in the background.

- If `picom` is detected via `pgrep -x picom`, it sends a notification and terminates the process with `pkill picom`.
- Otherwise, it sends a notification and launches `picom -b` (forks to background).

This is especially handy on Arch + qtile when you want to quickly disable compositing (e.g., troubleshooting tearing, performance in games, input latency issues) and re-enable it afterward without opening a terminal.

### Usage

Run from a terminal:

```sh
~/.scripts/bin/toggle_picom.sh
```

Typical “tldr” behavior:

```sh
# If picom is running -> stop it
toggle_picom.sh

# If picom is not running -> start it in background
toggle_picom.sh
```

Suggested qtile keybinding (example idea):

- Bind it to a key chord like `mod + shift + p` so you can toggle compositing instantly during your workflow (especially useful before launching fullscreen apps).

---

> [!TIP]
> Consider using `pkill -x picom` to match the exact process name (mirrors your `pgrep -x`). Also, `notify-send` may fail silently if no notification daemon is running; if you rely on feedback, you could add a fallback (e.g., log to stdout). Finally, if you use multiple `picom` instances/configs, you might want to launch with an explicit config path (e.g., `picom --config ~/.config/picom/picom.conf -b`) and/or verify it started successfully after spawning.