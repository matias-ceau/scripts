# playlist_player.xsh

# Play Playlist Script

This script allows you to select a playlist and play it using `cmus`, a small, fast, and powerful console music player. The playlist files must be in `.m3u` format and located in the `~/.playlists` directory.

## Functionality

- It lists all `.m3u` playlist files located in the `~/.playlists` directory.
- Displays a menu to select a playlist using `dmenu`.
- Clears the current playlist in `cmus`.
- Adds the selected playlist to `cmus`.
- Starts playing the selected playlist.

## Usage

Simply run the script. Ensure you have `cmus`, `dmenu`, and `xonsh` shell installed and properly configured on your system.

## Requirements

- `cmus`
- `dmenu`
- `xonsh` shell

## Script Breakdown

1. **Set Playlist Path**
    ```python
    import os
    PLAYLIST_PATH = os.path.expanduser('~/.playlists')
    ```

   This sets the path to the directory that contains your `.m3u` playlist files.

2. **Configure `cmus`**
    ```python
    cmus-remote -C 'view 4'
    cmus-remote -C clear
    ```

   Switch `cmus` to the playlist view and clear the current playlist.

3. **List Available Playlists**
    ```python
    options = '\n'.join(sorted([i.split('.')[0] for i in os.listdir(PLAYLIST_PATH) if 'm3u' in i]))
    ```

   Generate a sorted list of available playlists by stripping the `.m3u` extension.

4. **Select Playlist**
    ```python
    choice = $(echo @(options) | dmenu -i -l 30).strip()
    ```

   Use `dmenu` to display the list of playlists and let the user pick one.

5. **Add and Play Playlist**
    ```python
    cmus-remote -C @(f'add {PLAYLIST_PATH}/{choice}.m3u')
    cmus-remote -n
    cmus-remote -p
    ```

   Adds the selected playlist to `cmus`, skips to the next item, and starts playback.

## Running the Script

To run the script, save it with a `.xsh` extension and execute it in your terminal using the `xonsh` shell.

Example:
```sh
xonsh your_script.xsh
```

Ensure that `cmus` and `dmenu` are installed and available in your `PATH`.

---

This simple yet powerful script enables you to quickly switch between different music playlists in `cmus` with ease using a graphical menu.