# Album Player Script

---

**albumplayer.xsh**: Play an album using cmus with random selection of other albums

---

### Dependencies

- `cmus`: A console music player that can be controlled via command line.
- `dmenu`: A dynamic menu for X to select options interactively.

### Description

The `albumplayer.xsh` script is designed to streamline the playback of music albums using the `cmus` player on Arch Linux, specifically tailored for `qtile` as the window manager. The script accomplishes the following:

1. It retrieves paths of music files from the `cmus` library configuration.
2. It constructs a list of unique album names derived from these paths.
3. It presents the album list to the user via `dmenu`, allowing for user selection.
4. Upon selection, the script shuffles other album paths, picks a subset, and compiles a playlist.
5. Finally, it communicates with `cmus` to manage playback by creating a temporary playlist and controlling the player's state.

The selected album and randomly chosen additional albums are then written to a temporary M3U file which `cmus` uses to manage playback.

### Usage

To run the script, simply execute it in a terminal:

```bash
/home/matias/.scripts/albumplayer.xsh
```

This will present a graphical selection menu via `dmenu` where you can choose your desired album. 

When an album is selected:
- The script will clear the current playlist in `cmus`.
- Load the new playlist from the generated temporary M3U file.
- Start playing the selected album along with a few randomly chosen other albums.

### Example

Once executed, you should see a `dmenu` list like this:

```
             Album Name One    —    Artist One
             Album Name Two    —    Artist Two
             Album Name Three  —    Artist Three
```

Selecting any of the albums from this list will lead to the playback of that album in `cmus`.

---

> [!TIP]  
> Consider adding error handling for scenarios when no albums are found or when `cmus` is not running. This will enhance user experience and prevent unexpected crashes or failures. Additionally, providing a way to customize the number of random albums loaded could be beneficial for users wanting a different listening experience each time.