# Bootstrap Arch dependencies install (paru)

---

**install_dependencies.sh**: Install a base set of Arch packages via paru (AUR helper)

---

### Dependencies

- `bash` (script runtime)
- `paru` (AUR helper used to install packages)
- `pacman` (used indirectly by `paru`)

Packages installed by the script:

- `git`, `findutils`
- `fd`, `bat`, `fzf`, `ripgrep`
- `neovim`, `chezmoi`
- `dmenu`, `rofi`
- `dunst` (notifications; useful with qtile)
- `python-pandas`, `python-colorama` (Python tooling used by other scripts)
- `light` (backlight control; often bound to qtile keys)
- `xdotool` (X11 automation)

### Description

This is a small “bootstrap” installer for your Arch setup. It feeds a fixed list of packages to `paru` via stdin and installs only what’s missing:

- `paru -S` installs packages from repos/AUR.
- `--needed` skips reinstalling packages already present.
- `-` tells `paru` to read package names from standard input.
- Process substitution (`< <( … )`) supplies the heredoc-generated list.

This is a handy complement to a qtile/dotfiles workflow (e.g., before applying your `chezmoi` config), ensuring core CLI tools and common WM utilities are available.

### Usage

Run interactively in a terminal (recommended so you can review prompts):

    chmod +x ~/.scripts/bin/install_dependencies.sh
    ~/.scripts/bin/install_dependencies.sh

If you want it available everywhere:

    ~/.scripts/bin/install_dependencies.sh

Typical “tldr”:

- Install baseline packages on a new Arch machine:

      install_dependencies.sh

- Re-run anytime; existing packages will be skipped:

      install_dependencies.sh

---

> [!TIP]
> Consider adding `set -euo pipefail` for safer execution and a quick check that `paru` exists (fallback message if not). You may also want `--noconfirm` *only* for fully unattended setups, and splitting packages into “required” vs “optional” groups (e.g., `dmenu` vs `rofi`) to better match your qtile workflow.