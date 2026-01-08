# Cmus Album Player (dmenu)

---

**albumplayer.xsh**: Build a temp playlist from a chosen album and play it in cmus

---

### Dependencies

- `xonsh` — script runtime
- `cmus` — music player
- `cmus-remote` — control `cmus` from the CLI (usually shipped with `cmus`)
- `dmenu` — interactive album selector
- `cat`, `echo` — standard coreutils (used via xonsh subprocess calls)

---

### Description

This xonsh script reads your `cmus` library file (`.config/cmus/lib.pl` relative to your `$HOME`), derives a list of “albums” from track paths, lets you pick one album via `dmenu`, then generates a temporary playlist at `/tmp/temp.m3u`.

Album detection is done by taking the last two directory components before the filename (`.../<artist>/<album>/<track>`), and storing them as `artist/album`. A “fancy” display string is built for `dmenu` to improve readability (artist padded/truncated, then an em dash and album name). After you select an album, the script:

1. Collects all tracks belonging to the selected album.
2. Randomly shuffles the remaining albums and appends tracks from the next 10 albums (a quick “radio after this album” queue).
3. Writes everything to `/tmp/temp.m3u`.
4. Uses `cmus-remote` to clear the current queue, load the playlist, start playback, and skip to the next track once (`-n`)—effectively ensuring playback begins.

This is well-suited to a qtile keybinding since it’s non-interactive except for `dmenu`.

---

### Usage

Run from anywhere (it expects `~/.config/cmus/lib.pl` to exist):

    albumplayer.xsh

Typical qtile binding (example):

    Key([mod], "a", lazy.spawn("albumplayer.xsh"))

Notes:
- You must have `cmus` running for `cmus-remote` commands to work.
- The generated playlist file is always `/tmp/temp.m3u` and will be overwritten.

---

> [!TIP]
> Potential improvements:
> - Use `~/.config/cmus/lib.pl` explicitly (currently it’s missing the `~/` prefix, so it may fail unless run from `$HOME`).
> - Handle cancel/empty selection from `dmenu` (currently `res_[0]` will crash if nothing is selected).
> - Consider quoting/escaping paths more defensively and ensuring `.m3u` entries are absolute and valid for `cmus`.
> - Remove the stray `print(playlist_paths[-1])` or gate it behind a debug flag.