# Sync Setup Helper with Mega

---

**setting-up-syncs.sh**: Automates MEGA cloud syncs for key folders and differentiates setup by host.

---

### Dependencies

- `mega-sync`: Command-line tool or personal script for synchronizing folders with MEGA (ensure it's available in `PATH`).
- `hostnamectl`: Required for retrieving the system hostname.
- Standard `bash` environment (tested on Arch Linux).

---

### Description

This script configures and initiates folder synchronizations between your local system and MEGA cloud storage. It uses your host's name to determine which directories to sync, allowing for machine-specific configurations.

The script:
- Syncs default XDG user directories (`Desktop`, `Downloads`, etc.) and a personal knowledge management directory (`PKM`) to equivalent paths in your MEGA storage.
- Checks the hostname (using `hostnamectl hostname`) to apply extra syncs uniquely for `karhu` or `karjala` hosts (for example, additional media or backup folders).
- The specific MEGA destinations are organized to keep backups and user data grouped per device.

It's designed for use in personal computing environments where you have multiple machines with shared or device-specific cloud storage needs (e.g., your Arch Linux setup running `qtile`).

---

### Usage

You typically run the script manually or trigger it on login/boot per host.

#### Terminal (one-off run):

```
bash ~/.scripts/bin/setting-up-syncs.sh
```

#### Add to a qtile/autostart script:

```python
import subprocess
subprocess.Popen(["/home/matias/.scripts/bin/setting-up-syncs.sh"])
```

#### With keybinding in qtile (example):

```python
Key([mod], "F12", lazy.spawn("~/.scripts/bin/setting-up-syncs.sh")),
```

#### Requirements:
- Make sure `mega-sync` is accessible and pre-configured for your account.
- Ensure required mount points are available before running (e.g., `/mnt/mega` or `/mnt/HDD2`).

---

> [!TIP]
> 
> The script is straightforward but can be improved for flexibility, safety, and clarity:
> - **Host Check**: It would be safer to quote hostnames in the conditionals (`"$HOST"`).
> - **Error Handling**: Currently, it does not report or exit on failed syncs or missing mount points. Adding checks and logging would make troubleshooting easier.
> - **Configurability**: Paths and folder lists are hardcoded. Consider externalizing to a config file for greater portability.
> - **Parallelization**: Long-running syncs could potentially block; running them in the background (with `&`) or in parallel could improve speed.
> - **Documentation**: Inline comments are clear, but brief explanations of why certain directories are chosen (especially for the TODOs) would help future maintenance.