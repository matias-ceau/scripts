# Random Album Selector

---

**[random_album.xsh](random_album.xsh)**: Select random album and play it with cmus

---

### Dependencies

- `cmus`: A small and fast music player for Unix-like operating systems.
- `xonsh`: A Python-powered shell that is useful for scripting.
- `beet`: An open-source music library manager that allows organization of music collections (optional based on commented lines).

### Description

The `random_album.xsh` script is designed for Arch Linux users who utilize the `cmus` music player and want to enhance their listening experience by automatically selecting and playing random albums from their music library. This script utilizes the xonsh shell to execute commands and manage files.

Key functionalities:
- The script first unsets the current view in `cmus` and prepares the environment for a new playlist.
- It retrieves the current music library paths from `cmus` and constructs a list of unique album names.
- It randomly shuffles these album names and then selects from them to build a temporary playlist.
- Finally, the constructed playlist is saved to a temporary `.m3u` file which is loaded by `cmus` for playback.

This automation is efficient for those who wish to enjoy listening without manual album selection.

### Usage

To execute the script, simply run it from a terminal or link it to a keyboard shortcut in your window manager. The use of `xonsh` means you can directly run this script as follows:

```bash
/home/matias/.scripts/random_album.xsh
```

When executed:
- The script clears any existing playlist in `cmus`.
- It generates a new playlist based on randomly selected albums.
- It plays the newly selected albums immediately.

You can adjust the number of albums played by changing the range in the for loop:

```python
for n in range(10):   # Change 10 to any number to adjust how many albums are selected
```

---

> [!TIP]  
> The script assumes there are at least 10 unique albums available. If there are fewer, this will result in an index error. Consider adding a check to handle cases where there are not enough unique albums. Additionally, the commented-out part regarding `beet` indicates a potential for enhancing album retrieval, which could be a useful feature to include in future iterations.
