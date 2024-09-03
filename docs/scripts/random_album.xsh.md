# Random Album Selector

---

**random_album.xsh**: Selects a random album and plays it with cmus.

---

### Dependencies

- `cmus`: A lightweight music player that the script interfaces with to select and play music.
- `xonsh`: A Python-powered shell that executes the script.

### Description

This script leverages the capabilities of `xonsh` to automate the selection and playback of a random album using the `cmus` music player. 

The script begins by defining the path where a temporary playlist will be saved in M3U format, specifically targeting `~/.config/cmus/.temp.m3u`. It then communicates with `cmus` to prepare for clearing the current playlist. 

The main functionality revolves around retrieving the paths to music files stored in the `cmus` library (`lib.pl`) and generating a list of unique albums derived from these paths. The script shuffles the list of albums and selects ten tracks from the chosen album to create a playlist.

Once the playlist is generated, it is saved to the defined temporary file path, after which `cmus` is instructed to load this playlist and begin playback at the newly added tracks. The entire workflow ultimately provides a random yet curated listening experience.

### Usage

To use the script, ensure it is executable and then run it from the terminal:

```bash
chmod +x /home/matias/.scripts/random_album.xsh
/home/matias/.scripts/random_album.xsh
```

This script can also be bound to a key in `qtile` for quick access, allowing you to play a random album effortlessly.

---

> [!TIP] 
> The script could benefit from error handling, particularly for scenarios where there are fewer than ten albums available or if the `lib.pl` file cannot be found. Adding user feedback for such occurrences could improve usability, along with a feature to let the user specify the number of tracks to select. Additionally, consider cleaning up the commented-out lines for clarity and to avoid confusion.