# Album Player for CMUS

---

**[albumplayer.xsh](/albumplayer.xsh)**: Play a random album selection with cmus using dmenu

---

### Dependencies

- `cmus`: A console music player that runs in a terminal.
- `dmenu`: A dynamic menu for X, allowing for easy selection of items.

### Description

This script provides a utility for playing a selected album through the `cmus` music player. It generates a list of albums based on a library file defined in the user's cmus configuration and allows for selection via `dmenu`. The following steps outline the script's functionality:

1. **Initialization**: It sets the temporary playlist file path in the user's cmus configuration directory.
2. **Album Listing**: It retrieves paths of music files from `lib.pl` and constructs a unique list of albums by parsing the directory paths.
3. **Display Albums**: Utilizing `dmenu`, it presents a list of formatted album names to the user. Each album can be a combination of the artist and the album title, truncated to ensure readability.
4. **Selection Process**: After an album is selected, the script creates a playlist that includes the chosen album and shuffles a set of additional albums.
5. **Playlist Creation**: It writes the playlist paths to a temporary M3U file, which is subsequently fed into `cmus`, allowing for smooth playback.

### Usage

Run the script in your terminal as follows:

```bash
/home/matias/.scripts/albumplayer.xsh 
```

#### Interactive Steps

1. **Select an Album**: Upon execution, a dmenu popup will show the available albums. Use keyboard navigation to select your preferred album.
2. **Playback**: After selection, the temporary playlist is populated, and `cmus` is instructed to play the new track sequence.

### Example 

```bash
$ /home/matias/.scripts/albumplayer.xsh
```

This will execute the script and allow you to pick an album for playback.

---

> [!TIP]  
> The script currently uses a fixed limit of 10 albums fetched randomly. Consider adding a customizable option for the user to define how many albums to display or to exclude certain albums based on user preference. Error handling can also be improved, especially for cases where there are no albums available or if cmus is not installed.
