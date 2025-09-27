# FZF Album Launcher for cmus

---

**fzf_albumlauncher.xsh**: Pick an album via fzf and queue/play it in cmus

---

### Dependencies

- `xonsh` — script interpreter.
- `beets` (`beet`) — provides album list; `beet ls -a` outputs albums.
- `fzf` — fuzzy finder for interactive selection.
- `cmus` and `cmus-remote` — audio player and its remote control.
- `sed` — used to extract album names from beets output.

### Description

This xonsh script lets you fuzzy-search your beets album library and instantly queue and play the selection in cmus.

Flow:
- Lists albums with `beet ls -a`, then uses `sed 's/.* - //g'` to keep only the album title (dropping the artist).
- Pipes into `fzf` for interactive selection; the chosen line is `.strip()`’d.
- If a selection is made, cmus is controlled via `cmus-remote`:
  - Switches to the queue view, clears it, then goes to the sorted library view.
  - Applies a filter `album="<selection>"`, marks results, and adds them to the queue (`win-add-q`).
  - Clears the filter, returns to the queue, nudges playback (`-n`, `-p`), and saves the queue to `/tmp/nowplaying.m3u`.

On Arch Linux, install dependencies with pacman: `cmus`, `fzf`, `beets`, `xonsh`, `sed`. Ensure cmus is running before using the script.

### Usage

- Make executable: `chmod +x ~/.scripts/bin/fzf_albumlauncher.xsh`
- Run from a terminal: `~/.scripts/bin/fzf_albumlauncher.xsh`
- From qtile, bind a key (example): `Key([mod], "a", lazy.spawn("~/.scripts/bin/fzf_albumlauncher.xsh"))`
- If `fzf` layout needs tuning, set `FZF_DEFAULT_OPTS` (e.g., `--height 60% --reverse`) in your shell env.
- Result: Selected album is queued and starts playing; the current queue is saved to `/tmp/nowplaying.m3u`.

---

> [!TIP]
> Improvements and caveats:
> - Ambiguity: Only album names are used. If two artists have an album with the same title, both may be queued. Consider feeding `fzf` with `"$albumartist - $album"` and filtering with both fields (e.g., `filter album="$album" albumartist="$artist"`).
> - Quoting: Albums containing double quotes will break the filter. Escape quotes in the query (e.g., replace `"` with `\"`).
> - `sed` split: Using `s/.* - //` assumes the format includes “ - ” once; album titles containing “ - ” will be truncated. Prefer `beet ls -a -f '$albumartist\t$album'` and parse robustly.
> - cmus state: Ensure cmus is running; otherwise `cmus-remote` will fail. Consider auto-starting cmus if not detected.