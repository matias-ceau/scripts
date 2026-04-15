# Hyprland TTY Launcher (D‑Bus safe)

---

**hyprlaunch.sh**: Start Hyprland from a TTY with clean env + safe D‑Bus handling

---

### Dependencies

- `Hyprland` — the compositor being launched
- `systemd` / `systemctl --user` — imports environment + starts `basic.target` when a user bus exists
- `busctl` — detects whether a systemd user D‑Bus is available
- `dbus-run-session` — launches Hyprland in its own isolated D‑Bus session
- `dbus-launch` — fallback to spawn a private session bus when no `$XDG_RUNTIME_DIR/bus` exists
- `dbus-update-activation-environment` — propagates variables to D‑Bus/systemd activation
- `coreutils` (`id`, `sleep`, `seq`) + POSIX shell (`/bin/sh`)

### Description

This script is meant for “manual TTY users” on Arch: you log in on a TTY and want to start Hyprland without relying on a display manager. It focuses on *re-entrancy* and *not duplicating background services*.

Key behaviors:

- **Environment sanitization**: sets Wayland/XDG session variables (`XDG_SESSION_TYPE`, `XDG_CURRENT_DESKTOP`, `XDG_RUNTIME_DIR`, etc.) so clients and portals behave correctly.
- **systemd-user aware**: if a user bus is already present (`busctl --user --list` succeeds), it imports the environment into `systemd --user`, nudges `basic.target`, and updates D‑Bus activation variables.
- **D‑Bus robustness**: if no user bus socket exists at `$XDG_RUNTIME_DIR/bus`, it spawns a private one via `dbus-launch`.
- **Isolation**: starts Hyprland via `dbus-run-session` to reduce cross-talk between multiple sessions.
- **Timing hook**: optional `-t <seconds>` injects `sleep` pauses between phases (useful for debugging race conditions).

### Usage

Run from a TTY after logging in:

    ~/.scripts/bin/hyprlaunch.sh

Add debug delays (e.g., to observe env/bus startup):

    ~/.scripts/bin/hyprlaunch.sh -t 1

Typical workflow (manual TTY):

1. `login`
2. run `hyprlaunch.sh`
3. Hyprland runs in foreground until you exit; script `wait`s for it.

---

> [!TIP]
> The “wait for compositor socket” loop is currently ineffective: `WAYLAND_DISPLAY` is never set by the script (it’s typically set inside the Hyprland session), so `READY` is unlikely to flip. If you want readiness detection, query Hyprland’s socket/instance (e.g., `HYPRLAND_INSTANCE_SIGNATURE`) or use `hyprctl` once available. Also consider quoting `sleep "$duration"` and validating `-t` input to avoid accidental non-numeric sleeps.