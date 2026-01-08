# Next Album (cmus)

---

**next_album.xsh**: Skip to the next album in cmus by advancing tracks until album changes

---

### Dependencies

- `xonsh` — to run the script (`.xsh`)
- `cmus`
- `cmus-remote` — controls the running cmus instance
- `cat` — reads the temporary playlist file

### Description

This script automates “skip to next album” in **cmus**. Since cmus doesn’t provide a direct “next album” command, it approximates it by:

1. Switching cmus to a specific view (`view 4`) and exporting the current visible list as a playlist:
   - `cmus-remote -C 'save /tmp/now_playing.m3u'`
2. Reading `/tmp/now_playing.m3u`, filtering empty lines, and extracting album names by taking the parent directory of each track path (`.../Album/track.ext` → `Album`).
3. Querying cmus (`cmus-remote -Q`) to get the currently playing file path, then extracting its album folder.
4. Counting how many consecutive entries belong to the current album, then calling `cmus-remote -n` that many times to advance until the next album begins.

This design matches common “music library layout = Artist/Album/Track” setups on Arch, and is suitable for binding in qtile for quick navigation during playback.

### Usage

Run while cmus is open:

- From a terminal:
  - `next_album.xsh`

- Typical qtile keybinding idea (spawn the script):
  - `lazy.spawn("next_album.xsh")`

Behavior notes:
- It advances by multiple `next track` commands; it does not jump instantly.
- It relies on the track path structure to infer the album name.

---

> [!TIP]
> Potential improvements:
> - Avoid brittle parsing: `cmus-remote -Q` line indexing (`splitlines()[1]`) may break; prefer searching for the `file ` line explicitly.
> - Album detection via `path.split('/')[-2]` assumes a strict directory layout; consider using tags (e.g., `album`) if available, or handle edge cases (streams, single-file albums, unusual paths).
> - `/tmp/now_playing.m3u` is a fixed filename; using a unique temp file (or cleaning up) would be safer if multiple scripts run concurrently.
> - `view 4` is user-config-dependent; document what view 4 is in your cmus config or make it configurable.