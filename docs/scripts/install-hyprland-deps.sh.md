# Install Hyprland Build Dependencies (Arch)

---

**install-hyprland-deps.sh**: Installs Hyprland build deps and optional companion tools on Arch

---

### Dependencies

- `bash`
- `paru` (AUR helper; used for all package installs in this script)
- `pacman` (indirectly, via `paru`)
- Network access + Arch package databases (for `-Syu`)

### Description

This script bootstraps the package set typically required to build Hyprland on Arch Linux. It’s aimed at a “build from source” workflow: compilers and toolchains (`base-devel`, `cmake`, `meson`, `ninja`), Wayland/XWayland stack (`wayland`, `wayland-protocols`, `xorg-xwayland`), rendering/input libraries (`cairo`, `pango`, `libdrm`, `libinput`, `pixman`, `libxkbcommon`), and a complete XCB utility set (`libxcb` + `xcb-util*`).

It also pulls Vulkan-related headers/validation layers and GLSLang tooling, which are frequently needed for shader compilation and debugging.

Additionally, it installs portal components including `xdg-desktop-portal-hyprland-git` (AUR) plus `xdg-desktop-portal` and `polkit`, which are often necessary for screen sharing, file pickers, and other desktop integrations under Wayland.

Finally, if `paru` exists, it attempts to install Hyprland companion utilities (`hyprpaper`, `hypridle`, `hyprlock`) via `-git` AUR packages; failure there is explicitly ignored (`|| true`) so core deps still complete.

### Usage

Run from a terminal:

```sh
chmod +x /home/matias/.scripts/dev/install-hyprland-deps.sh
/home/matias/.scripts/dev/install-hyprland-deps.sh
```

Typical follow-up (as echoed by the script):

```sh
git clone --recursive https://github.com/hyprwm/Hyprland
cd Hyprland
make all
```

This is not qtile-specific; it’s a one-shot provisioning script you can run on-demand before testing Hyprland.

---

> [!TIP]
> The script claims “via pacman” but actually uses `paru` for the main install; if `paru` is missing, it won’t install anything. Consider either (1) checking for `paru` up-front and exiting with a clear message, or (2) using `pacman -Syu` for repo packages and only using `paru` for AUR ones. Also, `xdg-desktop-portal-hyprland-git` being `-git` may be unnecessary for your use—pinning to stable (`xdg-desktop-portal-hyprland`) can reduce breakage.