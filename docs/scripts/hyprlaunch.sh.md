# Hyprland TTY Launcher (isolated D‑Bus)

---

**hyprlaunch.sh**: Launch Hyprland from a TTY with clean Wayland/systemd-user env handling

---

### Dependencies

- `Hyprland` (the compositor)
- `systemd` / `systemctl --user` (optional; env import + `basic.target`)
- `busctl` (from `systemd`; used to detect an existing user bus)
- `dbus-run-session` (from `dbus`; launches Hyprland in a fresh D‑Bus session)
- `dbus-launch` (fallback; spawns a private bus if none exists)
- `dbus-update-activation-environment` (propagates env to D‑Bus/systemd user services)
- `id`, `seq`, `sleep`, `tty`, `sed` (coreutils / util-linux)

### Description

This script is aimed at manual TTY workflows on Arch Linux: it prepares a minimal Wayland session environment, tries to synchronize that environment into an already-running `systemd --user` (common with lingering), ensures a user D‑Bus exists, and finally starts Hyprland under a dedicated D‑Bus session via `dbus-run-session`.

Key behaviors:

- Exports standard Wayland/desktop variables (`XDG_SESSION_TYPE=wayland`, `XDG_CURRENT_DESKTOP=Hyprland`, etc.) and sets `XDG_RUNTIME_DIR` to `/run/user/UID`.
- If a user bus is already reachable (`busctl --user --list`), it imports variables into `systemd --user` and updates D‑Bus activation env to reduce “wrong env” issues in services.
- If no bus socket exists at `$XDG_RUNTIME_DIR/bus`, it falls back to `dbus-launch`.
- Starts `Hyprland` in the background (`dbus-run-session Hyprland &`) and then waits.

Note: there is commented-out logic for “per-TTY autostart flags”, but it is currently inactive.

### Usage

Run from a TTY (e.g., after logging in on `tty1`):

    ~/.scripts/bin/hyprlaunch.sh

If you intended a debug “step delay” mode (currently buggy), the script seems to aim for:

    ~/.scripts/bin/hyprlaunch.sh -t 1

Typical use is interactive from a TTY, not as a qtile keybinding.

---

> [!CAUTION]
> The `-t` parsing is currently broken: `[ ${1} -eq '-t' ]` does numeric comparison, `local` is not POSIX `sh`, and `local $duration=$2` is invalid syntax. Use `#!/bin/bash` (or remove `local`) and parse with `[ "$1" = "-t" ] ; duration="$2"`. Also, the compositor “ready” loop never sets `WAYLAND_DISPLAY`, so `READY` will likely never become `1`; consider detecting Hyprland’s socket (e.g., `HYPRLAND_INSTANCE_SIGNATURE`) or exporting `WAYLAND_DISPLAY` explicitly.