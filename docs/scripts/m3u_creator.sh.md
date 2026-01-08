# M3U Playlist Creator (Current Directory)

---

**m3u_creator.sh**: Create an .m3u playlist from all entries in the current directory

---

### Dependencies

- `bash` — script runtime
- `basename` — from `coreutils`, used to name the playlist after the current directory
- `ls` — from `coreutils`, used to list directory entries

### Description

This script generates a simple `.m3u` playlist based on the contents of your current working directory.

- The playlist name is derived from the directory name you’re currently in:
  - If you are in `~/Music/AphexTwin`, the output will be `AphexTwin.m3u`.
- It writes the playlist to the current directory.
- The playlist content is produced by `ls -1`, meaning:
  - One entry per line
  - Includes *everything* returned by `ls` (files, directories, etc., depending on what’s in the folder)
- The playlist is overwritten if it already exists.

This is a minimal “quick and dirty” generator, useful when you keep music in clean folders and want a fast playlist to load in players like `mpv`, `vlc`, or your music library tools.

### Usage

Run it from inside the directory you want to create a playlist for:

    cd ~/Music/SomeAlbum
    ~/.scripts/bin/m3u_creator.sh

Result:

    SomeAlbum.m3u

Open with a player (example with `mpv`):

    mpv SomeAlbum.m3u

Since it’s non-interactive and has no arguments, it’s a good fit for:
- a `qtile` keybinding (spawn in a terminal or direct spawn if `$PWD` is meaningful)
- a file manager “custom action” (recommended, since it runs relative to the folder)

---

> [!TIP]
> Consider filtering to actual audio files (e.g., `*.mp3 *.flac *.ogg`) and excluding the playlist file itself to avoid self-inclusion. Also note that `ls` is not robust for filenames with newlines and its ordering may not match “natural sort”; using `find -maxdepth 1 -type f -printf '%f\n' | sort` (or similar) is safer and more predictable.