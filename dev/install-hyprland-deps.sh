#!/bin/bash
# install-hyprland-deps.sh
# Script to install Hyprland build dependencies on Arch Linux

set -euo pipefail

echo "==> Installing core dependencies via pacman"
paru -Syu --needed --noconfirm \
  base-devel git cmake meson ninja \
  xorg-xwayland \
  wayland wayland-protocols \
  cairo pango libdrm libinput libxcb \
  xcb-util xcb-util-wm xcb-util-renderutil xcb-util-image xcb-util-keysyms \
  libxkbcommon pixman \
  vulkan-headers vulkan-validation-layers \
  glslang \
  xdg-desktop-portal-hyprland-git xdg-desktop-portal polkit

# Optional: install Hyprland companion utilities if paru is available
if command -v paru >/dev/null 2>&1; then
  echo "==> paru detected; installing optional companions (hyprpaper, hypridle, hyprlock)"
  paru -S --needed --noconfirm hyprpaper-git hypridle-git hyprlock-git || true
else
  echo "==> paru not found; skipping optional companions."
fi

echo "==> All dependencies installed. You can now clone and build Hyprland:"
echo "    git clone --recursive https://github.com/hyprwm/Hyprland && cd Hyprland && make all"
