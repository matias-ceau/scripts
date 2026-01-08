# Song Launcher (cmus + dmenu)

---

**songlauncher.sh**: Pick a track via dmenu and play it in cmus

---

### Dependencies

- `bash`
- `cmus-remote` (from `cmus`) — controls an existing cmus instance
- `find` (from `findutils`) — enumerates audio files
- `dmenu` — interactive menu (often launched from a keybinding in qtile)
- `music` directory in the current working directory (or a symlink target)

### Description

This script is a tiny “track picker” for your Arch Linux workflow: it lists every file under a `music/` directory and lets you fuzzy-search/select one via `dmenu`. The chosen path is then sent to cmus using `cmus-remote -f`, which loads the file and starts playback in the currently running cmus session.

Key behavior details:

- `find -L music -type f` follows symlinks (`-L`) and outputs all regular files under `music/`.
- `dmenu -i -l 30` enables case-insensitive matching and shows a 30-line list, making it usable from a qtile keybinding.
- `cmus-remote -f "<path>"` plays the selected file; cmus must already be running (or the command will fail).

Because it relies on the current working directory, how you launch it (terminal vs keybinding) affects where it looks for `music/`.

### Usage

Run from a context where `music/` exists:

    ./songlauncher.sh

Typical “tldr” flow:

1. Ensure cmus is running (e.g., in a terminal: `cmus`).
2. Launch the script (from terminal or qtile keybinding).
3. Type to filter, press Enter to play.

Example qtile keybinding idea:

    lazy.spawn("~/.scripts/bin/songlauncher.sh")

---

> [!TIP]
> Consider making the music path absolute (e.g., `"$HOME/music"`) to avoid failures when launched from qtile with a different working directory. You may also want to restrict file types (mp3/flac/ogg), handle “no selection” gracefully (avoid calling `cmus-remote` with an empty string), and optionally auto-start cmus if it isn’t running.