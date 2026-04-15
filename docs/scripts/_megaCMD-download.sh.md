# MEGAcmd quick downloader/installer (Arch)

---

**_megaCMD-download.sh**: Download MEGAcmd Arch package and install it via pacman

---

### Dependencies

- `wget` — downloads the package from mega.nz  
- `sudo` — required to run `pacman` with elevated privileges  
- `pacman` — installs the local `.pkg.tar.zst` package (Arch Linux)  
- Working internet connection

### Description

This script fetches the prebuilt **MEGAcmd** package for Arch from MEGA’s repository URL and installs it locally using `pacman -U`.

What it does, in order:

1. Runs `wget` on:
   - `https://mega.nz/linux/repo/Arch_Extra/x86_64/megacmd-x86_64.pkg.tar.zst`
2. If the download succeeds (`&&`), it installs the downloaded file with:
   - `sudo pacman -U "$PWD/megacmd-x86_64.pkg.tar.zst"`

Because it uses `$PWD`, the package is expected to be present in the current working directory where you launched the script. This makes it convenient for ad‑hoc installs while developing your environment on Arch + qtile, but it is intentionally minimal and not “repo-managed” (no pacman repo keying/configuration is added).

### Usage

Run from a terminal:

    chmod +x /home/matias/.scripts/dev/_megaCMD-download.sh
    /home/matias/.scripts/dev/_megaCMD-download.sh

Typical “tldr”:

    cd /tmp
    ~/.scripts/dev/_megaCMD-download.sh

After installation, you should have `mega-*` commands available (depending on the package contents).

---

> [!CAUTION]
> - The shebang is invalid: `#!/usr/bin/env` is missing the interpreter (likely `bash`). Use `#!/usr/bin/env bash`.
> - No cleanup: the downloaded `.pkg.tar.zst` is left behind. Consider deleting it after install or downloading to a temp dir.
> - No versioning/checks: it always downloads whatever is currently at that URL; adding checksum verification would improve safety.
> - Consider using MEGA’s repo setup (or an AUR package) for updates instead of one-off `pacman -U` installs.