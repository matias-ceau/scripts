# FZF Album Launcher for cmus

---

**fzf_albumlauncher.xsh**: Pick an album via fzf (beets) and queue/play it in cmus

---

### Dependencies

- `xonsh` — shell interpreter for this script (`#!/usr/bin/env xonsh`)
- `beets` — provides the `beet` CLI and your album library
- `fzf` — fuzzy finder UI to choose an album
- `sed` — used to strip “Artist - ” prefix from beets output
- `cmus` / `cmus-remote` — music player and remote control

### Description

This xonsh script lets you browse your beets albums with fzf and immediately play the selection in cmus. It does the following:

1) Builds a list of albums: `beet ls -a` (albums) piped through `sed 's/.* - //g'` to remove the leading “Artist - ”, then through `fzf` for interactive selection.
2) If a selection is made, it manipulates cmus via `cmus-remote`:
   - Switches views, clears any previous queue, and navigates to the library view.
   - Applies a filter for the chosen album: `filter album="…"`
   - Marks the filtered tracks and enqueues them (`win-add-q`).
   - Clears the filter and returns to the queue view.
   - Starts playback (`-n`, then `-p`) and saves the current queue to `/tmp/nowplaying.m3u`.

The script uses xonsh-specific constructs: Python string methods (`.strip()`), f-strings (`f'...'`), and argument splicing `@(query)` to pass the computed filter to `cmus-remote`.

### Usage

- Make executable and ensure it’s in your PATH:
  - chmod +x ~/.scripts/bin/fzf_albumlauncher.xsh
- Start cmus before launching:
  - cmus &
- Run from a terminal:
  - fzf_albumlauncher.xsh
- Suggested qtile keybinding:
  - In your qtile config:
    - Key([mod], "a", lazy.spawn("~/.scripts/bin/fzf_albumlauncher.xsh"))

tldr:
- arrow/typing in fzf to pick an album
- press Enter → queue and play album in cmus
- playlist saved to /tmp/nowplaying.m3u

---

> [!TIP]
> Potential improvements:
> - Ambiguity: stripping to album-only can collide when different artists share the same album name. Prefer using a beets format string (e.g., `beet ls -a -f '$albumartist — $album'`) and filter by both `albumartist` and `album`.
> - Robustness: add checks for empty selection, missing dependencies, or when cmus isn’t running (optionally auto-start cmus).
> - Quoting: escape double quotes in album names to avoid filter parsing issues.
> - UX: show a preview in fzf (track count, year) and allow abort without side effects.
> - Portability: replace `sed` parsing with a beets format to avoid brittle text manipulation.