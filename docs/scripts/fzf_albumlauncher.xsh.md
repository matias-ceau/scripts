# FZF Album Launcher (beets → cmus)

---

**fzf_albumlauncher.xsh**: Pick a beets album via fzf and enqueue it in cmus

---

### Dependencies

- `xonsh`: script runtime (`#!/usr/bin/env xonsh`)
- `beet` (beets): provides the album list via `beet ls -a`
- `sed`: trims `beet` output (`s/.* - //g`)
- `fzf`: interactive selector UI
- `cmus-remote`: controls cmus (queueing, playback, saving playlist)
- `cmus`: must be running for `cmus-remote` to work

### Description

This script bridges your beets library and cmus: it lists albums with `beet ls -a`, extracts the album title portion, then lets you choose one with `fzf`. Once selected, it uses a sequence of `cmus-remote -C` commands to:

1. Clear the current selection/filters.
2. Apply a filter matching the chosen album (`filter album="…"`) in the library view.
3. Mark the filtered results and add them to the queue (`win-add-q`).
4. Return to the queue view, cap queue display (`lqueue 100`), and start playback (`-n`, `-p`).
5. Export the resulting queue/now playing list to `/tmp/nowplaying.m3u`.

It’s well-suited to a qtile keybinding because it’s a quick, single-shot interactive picker (fzf), then hands off to cmus.

### Usage

Run from a terminal (needs fzf interaction):

    fzf_albumlauncher.xsh

Typical flow:

- Type to fuzzy-search an album name
- Press `Enter` to enqueue and start playing
- `/tmp/nowplaying.m3u` is updated with the current selection

qtile example idea (run in a terminal like `alacritty`):

    alacritty -e /home/matias/.scripts/bin/fzf_albumlauncher.xsh

---

> [!TIP]
> The `sed 's/.* - //g'` simplification may cause ambiguous matches if different artists share album titles; consider using `beet ls -a -f '$albumartist - $album'` and filtering on both fields. Also, `filter album="..."` will break if the album contains double quotes; escaping/sanitizing the selection would make it more robust. Finally, saving to a fixed `/tmp/nowplaying.m3u` is convenient, but you may want to ensure permissions and consider a user-scoped runtime dir (`$XDG_RUNTIME_DIR`) on Arch.