#!/bin/sh
#
# Minimal Hyprland launcher (barebones, no DM or uwsm)
# - Marks session as graphical for systemd --user
# - Updates DBus/systemd environment variables
# - Optionally runs XDG autostarts (dex)
# - Then exec's Hyprland

# 1. Tell systemd --user we are going graphical
systemctl --user start graphical.target || true

# 2. Export the usual session environment
export XDG_SESSION_TYPE=wayland
export XDG_CURRENT_DESKTOP=Hyprland
export XDG_SESSION_DESKTOP=Hyprland
export XDG_SESSION_CLASS=user
XDG_RUNTIME_DIR="/run/user/$(id -u)"
export XDG_RUNTIME_DIR

systemctl --user import-environment \
  DISPLAY WAYLAND_DISPLAY \
  XDG_CURRENT_DESKTOP XDG_SESSION_TYPE \
  XDG_SESSION_CLASS XDG_SESSION_DESKTOP \
  XDG_RUNTIME_DIR

dbus-update-activation-environment --systemd \
  DISPLAY WAYLAND_DISPLAY \
  XDG_CURRENT_DESKTOP XDG_SESSION_TYPE \
  XDG_SESSION_CLASS XDG_SESSION_DESKTOP \
  XDG_RUNTIME_DIR

exec Hyprland
