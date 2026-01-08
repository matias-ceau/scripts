# Sandisk music transfer (beets → player sync)

---

**sandisk_music_transfert.py**: Randomly select unlistened albums and sync them to a Sandisk player

---

### Dependencies

- `python` (Arch package: `python`)
- `pandas` (`python-pandas`) for dataframe filtering/aggregation
- `beets` (`beets`) to query “not listened” albums via `beet ls`
- `du` (from `coreutils`) to estimate album sizes
- `rsync` to copy/update albums efficiently
- `sudo`, `rm`, `mkdir` for cleanup and folder creation
- Your library layout assumes `/home/matias/music/<...>` (artist inferred from path)

### Description

This script builds a set of albums from your Beets library tagged with `status:0` (interpreted as “not listened”), then syncs *only* those albums to your Sandisk device under:

- `player_path = /run/media/matias/EC95-4FBB/Music`

To fit the device, it sums album sizes (via `du -sk`) and repeatedly drops a *random artist* until the total size is below `MAX_SPACE` (currently ~30 MiB). It also filters out albums whose detected format isn’t in:

`aac, m4a, flac, mp3, wav, wma`

Finally, it:
1) removes albums from the device that are not in the selected set,  
2) prunes empty artist folders,  
3) recreates target folders,  
4) `rsync`s each album directory.

### Usage

Run manually (interactive terminal recommended because it may invoke `sudo`):

- `python /home/matias/.scripts/bin/sandisk_music_transfert.py`

Typical workflow:

- Mount the Sandisk (should appear under `/run/media/matias/...`)
- Ensure Beets `status` field is populated
- Launch script, let it trim artists until it fits, then sync

If you want to bind it in qtile, wrap it in a terminal command so you can see progress:

- `alacritty -e python /home/matias/.scripts/bin/sandisk_music_transfert.py`

---

> [!CAUTION]
> - The script currently has multiple syntax/logic issues (broken f-strings, malformed `DataFrame` constructor, bad list comprehensions) and will not run as-is.
> - `MAX_SPACE = 30 * 1024**2` is ~30 MiB, likely far below your player capacity.
> - `os.path.isdir(i)` is checked without joining `player_path`, so device discovery is wrong.
> - `password` is commented out but used; prefer `sudo` with cached credentials or avoid `sudo` by fixing mount permissions (e.g., `udisks2` options).
> - Format detection via `os.listdir(i)[0]` is unreliable (may pick `cover.jpg`); use file scanning or `beet ls -f '$format'`.