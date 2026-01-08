# FZF Song Launcher

---

**fzf_songlauncher.sh**: Pick a music file with fzf and play it in cmus

---

### Dependencies

- `cmus` / `cmus-remote` — controls the `cmus` player from the shell
- `fzf` — interactive fuzzy finder UI
- `find` — lists files recursively
- A `music` directory in the current working directory (or a symlink, since `find -L` is used)

### Description

This script is a minimal “song picker” meant for quick launching of a track into **cmus**. It:

1. Recursively lists every file under `music` (following symlinks via `find -L`).
2. Pipes the list into `fzf` so you can fuzzy-search by filename/path.
3. Sends the selected path to `cmus-remote -f`, which tells cmus to load/play that file.

Because it uses a relative path (`music`), the behavior depends on where you run it from. On an Arch + qtile setup, it’s typically intended to be run from a terminal or bound to a keybinding that launches it in a terminal emulator.

### Usage

Run interactively (needs a TTY for `fzf`):

    fzf_songlauncher.sh

Typical “tldr” flow:

- Start `cmus` in a terminal (or ensure it’s already running).
- Run the script.
- Type to filter, press `Enter` to play the selected file.

Example qtile keybinding concept (launch in your terminal):

    alacritty -e /home/matias/.scripts/bin/fzf_songlauncher.sh

---

> [!TIP]
> Improvements to consider:
> - Handle cancel/empty selection: if you press `Esc` in `fzf`, `cmus-remote -f ""` may error; guard with `selection=$(...) || exit` and `[ -n "$selection" ]`.
> - Use an absolute music path (e.g., `$HOME/music`) so it works from any CWD.
> - Quote/escape and/or restrict file types (e.g., `-iname '*.mp3' -o -iname '*.flac'`) to avoid picking non-audio files.
> - If `cmus` isn’t running, `cmus-remote` fails; you could auto-start cmus or show a notification.