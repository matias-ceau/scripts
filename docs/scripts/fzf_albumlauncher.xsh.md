# FZF Album Launcher

---

**fzf_albumlauncher.xsh**: Choose an album with fzf and play it with cmus.

---

### Dependencies

- `fzf`: A command-line fuzzy finder, needed for selecting albums from your music library.
- `cmus`: A music player which the script interfaces with to play selected albums.
- `beet`: A command-line tool to manage your music library, used here to list albums.

### Description

This script provides a convenient way to select and play a music album using `fzf` and `cmus` on your Arch Linux setup with `qtile`. It retrieves a list of albums from your music library managed by `beet`, and allows you to conveniently choose one through the fuzzy finder interface.

Here's a breakdown of how the script operates:

1. **Album Selection**: The script fetches a list of albums from `beet` and processes it to produce a clean list using `sed`. This list is then piped to `fzf`, where the user can interactively select an album.
   
2. **Control cmus**: Once an album is selected, the script utilizes `cmus-remote` commands to:
   - Clear the current playlist.
   - Filter the music library according to the selected album.
   - Mark the filtered songs to be added to the cmus queue.
   - Enqueue the songs, and play them immediately.

3. **Playlist Management**: Finally, it saves the current song list to a temporary playlist file, allowing for a quick resume of the session.

### Usage

To run the script, simply call it from your terminal:

```bash
/home/matias/.scripts/fzf_albumlauncher.xsh
```

This will present a fuzzy search interface to select an album. After selection, the script will manage playback in cmus accordingly.

You may also bind this script to a key in your `qtile` configuration to allow for quick access. Here’s an example of how you might set that up:

```python
keybindings = [
    Key([mod], "a", lazy.spawn("/home/matias/.scripts/fzf_albumlauncher.xsh")),
]
```

---

> [!TIP]
> The script relies on `cmus` for playback, which means it must be running in the background for the commands to work. If `cmus` is not started, the script will fail silently. Consider adding error handling to notify the user if `cmus` is not active. Additionally, using `strip()` directly after the selection may lead to errors if nothing is selected; handling empty selections could enhance user experience.