# Mechen music transfer (random subset sync)

---

**mechen_music_transfert.py**: Sync a random selection of unlistened albums to the MECHEN player

---

### Dependencies

- `python3`
- `pandas` (Python package)
- `beets` (`beet`) — used to list albums with `status:0`
- `du` — to estimate album sizes
- `rsync` — to copy/update albums efficiently
- `sudo` — the script runs `rm`, `mkdir`, and `rsync` with elevated rights

### Description

This script is a “fill the device for discovery” workflow: it queries your Beets library for albums marked as *not listened* (`status:0`), then builds a candidate list of album folders and trims it down until the total size fits within `MAX_SPACE`.

Key steps:

- **Library query**: `beet ls -ap status:0` returns absolute album paths; the script also derives `short_path` relative to `/home/matias/music/`.
- **Sizing**: runs `du -sk` on each album folder and stores sizes (in KiB).
- **Selection logic**: while the total exceeds `MAX_SPACE` (currently `50 * 1024**2`), it drops *all albums* from a randomly chosen artist (unless that artist already exists on the device, in which case it keeps them and retries).
- **Device reconciliation**:
  - Removes albums currently on the device that are **not** in the selected dataframe.
  - Removes **empty artist folders** after cleanup.
- **Deployment**: creates required folders and then `rsync -rvu --delete` each album directory to `/home/matias/MECHEN/<Artist>/<Album>`.

The script prompts once for your sudo password and feeds it to each sudo command via stdin.

### Usage

Run interactively in a terminal (password prompt):

    /home/matias/.scripts/bin/mechen_music_transfert.py

Typical flow:

- Enter sudo password when prompted
- Script prints number of “not listened” albums + total size
- It trims randomly until it fits, then cleans and syncs

Suggested qtile keybinding (opens a terminal):

- bind a key to: `alacritty -e /home/matias/.scripts/bin/mechen_music_transfert.py`

---

> [!WARNING]
> - `MAX_SPACE` is set to ~50 TiB (`50 * 1024**2` bytes), likely meant to be 50 GiB; consider `50 * 1024**3` (bytes) or keep everything consistently in KiB since `du -sk` returns KiB.
> - `artists_on_device` is computed with `os.path.isdir(i)` instead of `os.path.isdir(os.path.join(player_path, i))`, which can mis-detect directories depending on cwd.
> - Comparing `albums_on_device` (`Artist/Album`) with `df["short_path"]` relies on Beets path layout; any mismatch can trigger unintended deletions.
> - Passing the sudo password around is risky; prefer running the whole script with `sudo` once, or configure a minimal `/etc/sudoers.d` rule for `rsync/rm/mkdir` on the mount point.