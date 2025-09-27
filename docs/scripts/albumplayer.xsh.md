# Cmus Album Picker (dmenu + xonsh)

---

**albumplayer.xsh**: Pick a cmus album via dmenu, enqueue it plus 10 random albums

---

### Dependencies

- `xonsh` — the script is written in Xonsh (Python-powered shell)
- `cmus` — console music player controlled via `cmus-remote`
- `dmenu` — album selection UI
- `coreutils` — uses `cat` and `echo`
- `~/.config/cmus/lib.pl` — cmus library/playlist file (m3u-like list of tracks)

### Description

This script lets you quickly pick an album from your cmus library via dmenu, then constructs a temporary M3U playlist containing:
- All tracks from the selected album
- All tracks from 10 additional random albums

It reads track paths from `~/.config/cmus/lib.pl`, derives album identifiers from directory structure, presents a nicely formatted album list in dmenu, writes the resulting playlist to `/tmp/temp.m3u`, and then drives cmus to clear and load the new queue.

Key flow:
1. Parse the library file into per-album groups.
2. Show a right-aligned, truncated album list in dmenu.
3. Build `/tmp/temp.m3u` with the chosen album first, followed by 10 shuffled albums.
4. Use `cmus-remote` to clear the queue and play.

### Usage

- Install deps on Arch:
  ```
  sudo pacman -S xonsh cmus dmenu
  ```
- Ensure you have a library file (from cmus):
  ```
  cmus-remote -C 'save -l ~/.config/cmus/lib.pl'
  ```
- Run from a terminal (starting in $HOME, see notes below):
  ```
  ~/.scripts/bin/albumplayer.xsh
  ```
- Qtile keybinding example:
  ```
  Key([mod], "a", lazy.spawn("~/.scripts/bin/albumplayer.xsh"))
  ```

Customize:
- Number of random albums: change `for a in albums[:10]:` to your desired count.
- Temp file location: edit `temp_path = os.path.expanduser('/tmp/temp.m3u')`.

---

> [!TIP]
> - The script uses a relative path `.config/cmus/lib.pl`; if your CWD isn’t `$HOME`, it will fail. Use `os.path.expanduser('~/.config/cmus/lib.pl')` instead.
> - Cancelling dmenu or no match triggers `IndexError` at `res_[0]`; add a guard for empty selection.
> - Album matching uses substring checks and set-based albums; duplicate album names across artists may collide. Consider tuples `(artist, album)` or full absolute paths for keys.
> - Writing to `/tmp/temp.m3u` can race if launched twice; generate a unique tempfile.
> - `cmus-remote -p` then `-n` may not reliably start playback; prefer `cmus-remote -C 'player-play'`.