# MEGAcmd one-shot installer (Arch)

---

**_megaCMD-download_1.sh**: Downloads MEGAcmd Arch package and installs it via pacman

---

### Dependencies

- `wget` — fetch the package from MEGA’s Arch repo
- `sudo` — required to install system packages
- `pacman` — Arch Linux package manager
- Working network connection

### Description

This script is a minimal “download + install” helper for **MEGAcmd** on Arch Linux. It fetches the prebuilt package `megacmd-x86_64.pkg.tar.zst` from MEGA’s official Arch repository URL, then immediately installs it using `pacman -U` from the current directory (`$PWD`).

The workflow is:

1. `wget https://mega.nz/linux/repo/Arch_Extra/x86_64/megacmd-x86_64.pkg.tar.zst`
2. If the download succeeds (`&&`), run:
   - `sudo pacman -U "$PWD/megacmd-x86_64.pkg.tar.zst"`

Because the install step is chained with `&&`, a failed download prevents an attempted install.

This is convenient for quick manual setups on your Arch + qtile environment, but it intentionally bypasses repository configuration and doesn’t manage updates—future updates would require re-running (or switching to a repo-based install approach).

### Usage

Run it from a terminal (interactive, because `sudo` will likely prompt for your password):

    ~/.scripts/bin/_megaCMD-download_1.sh

Typical “tldr” usage:

- Download + install in one go:

      bash ~/.scripts/bin/_megaCMD-download_1.sh

- If you want to keep the package in a specific folder first:

      cd /tmp
      ~/.scripts/bin/_megaCMD-download_1.sh

---

> [!CAUTION]
> The shebang is currently invalid: `#!/usr/bin/env` is missing the interpreter (e.g., `bash`). Use `#!/usr/bin/env bash`. Also consider adding basic safety flags (`set -euo pipefail`), checking if the file already exists, verifying signatures/checksums, and cleaning up the downloaded package after installation. For long-term maintenance, adding MEGA’s repo to pacman (rather than `pacman -U` a single file) will give you normal upgrades.