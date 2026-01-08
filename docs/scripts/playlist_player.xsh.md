# Cmus Playlist Picker (dmenu)

---

**playlist_player.xsh**: Pick a playlist from `~/.playlists` and play it in cmus

---

### Dependencies

- `xonsh` — script runtime
- `cmus-remote` — controls the running `cmus` instance
- `cmus` — must be running (or `cmus-remote` commands will fail)
- `dmenu` — interactive menu used to select a playlist (works well with qtile)
- `~/.playlists/*.m3u` — playlist directory and files expected by the script

### Description

This Xonsh script provides a fast “choose and play” workflow for `cmus` playlists stored in `~/.playlists`. It:

1. Switches cmus to the playlist/library view (`view 4`).
2. Clears the current playlist/queue (`clear`).
3. Builds a list of available playlists by listing files in `~/.playlists` that contain `m3u` in the name, then stripping the extension (everything after the first `.`).
4. Sends that list to `dmenu` (case-insensitive, 30 visible lines) so you can pick one quickly.
5. Adds the selected `.m3u` playlist to cmus, skips to next track, and starts playback (`-n` then `-p`).

This fits nicely into an Arch + qtile setup: bind it to a key to get an instant launcher-like playlist switcher.

### Usage

Run from a terminal, or more typically via a qtile keybinding/autostart command:

- Run directly:
  - `playlist_player.xsh`

- Example qtile binding:
  - `lazy.spawn("playlist_player.xsh")`

- Expected layout:
  - `~/.playlists/Chill.m3u`
  - `~/.playlists/Workout.m3u`

---

> [!TIP]
> Consider handling “no selection” (Esc) to avoid trying to add `/.m3u`. Also, filtering with `i.endswith(".m3u")` is safer than `'m3u' in i`, and `split('.')[0]` can break names like `my.mix.m3u`. Using `os.path.splitext(i)[0]` and quoting/escaping the path would improve robustness. You could also check whether `cmus` is running and show a `notify-send` message on failure.