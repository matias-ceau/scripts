# Album Player for cmus (dmenu + xonsh)

---

**albumplayer.xsh**: Pick an album via dmenu and queue it (plus random albums) in cmus

---

### Dependencies

- `xonsh` — script interpreter
- `cmus` — console music player
- `cmus-remote` — control cmus from the shell
- `dmenu` — fuzzy picker for selecting the album
- `~/.config/cmus/lib.pl` — cmus library listing used to build the album index

### Description

This script lets you browse your cmus library via dmenu and start playing an album instantly. It parses your cmus library file (lib.pl), infers albums as Artist/Album by taking the last two path components of each track, and presents a padded, right-aligned list “Artist — Album” for easier scanning.

After you select one album, it:
- Builds a temporary m3u at /tmp/temp.m3u containing all tracks from the chosen album.
- Appends tracks from 10 random other albums to keep playback flowing.
- Tells cmus to switch to the playlist view, clear any existing playlist, load the new m3u, start playback, and jump to the next track.

The script assumes your lib.pl reflects your current library. If needed, refresh it from cmus before use.

### Usage

- Ensure lib.pl exists/updated:
  ```
  cmus-remote -C 'save -l ~/.config/cmus/lib.pl'
  ```

- Run interactively:
  ```
  albumplayer.xsh
  ```
  A dmenu window appears. Type to filter, hit Enter to confirm. cmus will start the selected album and queue 10 random albums.

- Bind to a qtile key:
  ```
  Key([mod], "a", lazy.spawn("~/.scripts/bin/albumplayer.xsh")),
  ```

- Make executable and on PATH (Arch, zsh/xonsh):
  ```
  chmod +x ~/.scripts/bin/albumplayer.xsh
  echo 'export PATH="$HOME/.scripts/bin:$PATH"' >> ~/.zshrc
  ```

---

> [!TIP]
> - Use an absolute path for the library: read ~/.config/cmus/lib.pl instead of the current directory to avoid failures when launched from qtile.
> - Handle empty dmenu selections and missing files to prevent IndexError/file errors.
> - Matching by substring can collide (e.g., similar album names). Use a stable ID (index the list or store a map key alongside the display text) to resolve the selection.
> - Make dmenu flags configurable (e.g., environment var) instead of hardcoded -l 300.
> - Consider a CLI arg for the number of random albums (default 10) and the output m3u path (use mktemp).
> - Remove the debug print inside the random-album loop.
> - Chain cmus-remote calls minimally and check exit codes for robustness.