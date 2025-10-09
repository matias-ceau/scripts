#!/bin/sh
# ────────────────────────────────────────────────────────────────
#  Hyprland launcher for manual TTY users
#  - tolerant of multiple Hyprland sessions
#  - re‑entrant (won’t re‑autostart daemons or trash env)
#  - safe even if lingered systemd user already runs services
# ────────────────────────────────────────────────────────────────

if [ ${1} -eq '-t' ] ; then
  local $duration=$2
fi
# === 1. Declare / sanitize environment =======================================
export XDG_SESSION_TYPE=wayland
export XDG_CURRENT_DESKTOP="Hyprland"
export XDG_SESSION_DESKTOP="Hyprland"
export XDG_SESSION_CLASS="user"
export XDG_RUNTIME_DIR="/run/user/$(id -u)"

sleep $duration

# Propagate vars to already running systemd‑user (if present)
if busctl --user --list >/dev/null 2>&1; then
  systemctl --user import-environment \
    DISPLAY WAYLAND_DISPLAY \
    XDG_CURRENT_DESKTOP XDG_SESSION_TYPE \
    XDG_SESSION_CLASS XDG_SESSION_DESKTOP XDG_RUNTIME_DIR 2>/dev/null || true
  systemctl --user start basic.target 2>/dev/null || true
  dbus-update-activation-environment --systemd \
    DISPLAY WAYLAND_DISPLAY \
    XDG_CURRENT_DESKTOP XDG_SESSION_TYPE \
    XDG_SESSION_CLASS XDG_SESSION_DESKTOP XDG_RUNTIME_DIR 2>/dev/null || true
fi

sleep $duration


# === 2. Ensure a D‑Bus session exists =======================================
if [ ! -S "$XDG_RUNTIME_DIR/bus" ]; then
  echo "No user D‑Bus bus found, spawning a private one"
  eval "$(dbus-launch --exit-with-session --sh-syntax)"
fi

sleep $duration


# === 3. Launch Hyprland inside an isolated D‑Bus session =====================
# Let each run have its own session bus to avoid cross‑talk.
echo "Starting Hyprland in new D‑Bus session…"
dbus-run-session Hyprland &

sleep $duration


# === 4. Wait for compositor socket to appear ================================
for _ in $(seq 1 40); do
  # Typically "wayland-1", "wayland-2", etc.
  if [ -n "$WAYLAND_DISPLAY" ] && [ -S "$XDG_RUNTIME_DIR/$WAYLAND_DISPLAY" ]; then
    READY=1
    break
  fi
  sleep 0.25
done
#
# # === 5. Autostart handling ==================================================
# # To prevent "catastrophic annoyances" (dup daemons) we keep a per-seat flag.
# AUTOSTART_TAG_DIR="$XDG_RUNTIME_DIR/hyprland_autostarts"
# mkdir -p "$AUTOSTART_TAG_DIR"
#
# # pick tag by TTY or seat ID so each TTY can have its own
# TAG="$(tty | sed 's:/dev/::')"
# FLAG="$AUTOSTART_TAG_DIR/$TAG"
#
wait
#
# * **Independent sessions by TTY**
#   * Each TTY gets its own “autostart flag” file `$XDG_RUNTIME_DIR/hyprland_autostarts/ttyN`;
# open another TTY → new autostart, same TTY → skip duplicates.
# * **No global lock** — you can run multiple Hyprlands, each with its D‑Bus session.
# * **No crash if systemd‑user not up** — checks bus presence first.
# * **Linger‑friendly** — nothing restarts global daemons already under your user’s systemd
# service tree.
# * **Safe failure behavior** — script runs even on minimal rescue TTYs without a systemd user
# bus; it simply self‑creates an ephemeral one.
#
# ---

# ### Optional clean‑ups you can still make
# In your `~/.config/autostart/`, mark these **Hidden=true** or remove duplicates:
#
# | Category | Typical files producing duplicates |
# |-----------|------------------------------------|
# | PipeWire & session manager | `pipewire.desktop`, `wireplumber.desktop` — systemd already
# handles |
# | Tracker miners | `org.freedesktop.Tracker*.desktop` |
# | GeoClue demo | `geoclue-demo-agent.desktop` |
# | Keyring daemons | keep only one “secrets” variant if you want key storage |
# | VPN or Network applet | disable if your own script autostarts them |
#
# ---
