# fzf_albumlauncher.xsh

# Album Player Script

This script allows you to choose an album using `fzf` (fuzzy finder) and play it using `cmus`, a small, fast, and powerful console music player.

## Prerequisites

- **xonsh**: Make sure you have the xonsh shell installed. You can get it [here](https://xon.sh/).
- **beets**: A music library manager to fetch your albums. Install it from [here](https://beets.io/).
- **fzf**: A general-purpose command-line fuzzy finder. You can get it [here](https://github.com/junegunn/fzf).
- **cmus**: A console-based music player. Available [here](http://cmus.github.io/).

## Usage

1. Save the script to a file, e.g., `play_album.xsh`.
2. Make the script executable:
    ```sh
    chmod +x play_album.xsh
    ```
3. Run the script:
    ```sh
    ./play_album.xsh
    ```

## Functionality

This script will:

1. Use `beet ls -a` to list all albums in your music library.
2. Utilize `sed` to format the list by removing everything before the album name.
3. Use `fzf` to allow you to interactively choose an album from the list.
4. If an album is selected, it will:
    - Set `cmus` to library view.
    - Clear the current playlist.
    - Return to the playlist view.
    - Filter the library for the selected album.
    - Mark the filtered results (the selected album).
    - Add the marked tracks to the queue.
    - Clear the filter to show all library content.
    - Return to the playlist view.
    - Save the current playlist to a file in M3U format.
    - Start and play the first song in the queue.

## Script Details

```xsh
#! /usr/bin/env xonsh

# Choose an album with fzf and play it with cmus

selection=$(beet ls -a | sed 's/.* - //g' | fzf).strip()
if selection:
    cmus-remote -C 'view 4'  # Switch to the library view
    cmus-remote -C clear     # Clear the current playlist
    cmus-remote -C 'view 2'  # Switch back to the playlist view
    query=f'filter album="{selection}"'
    cmus-remote -C @(query)  # Filter library for the selected album
    cmus-remote -C mark      # Mark the filtered results
    cmus-remote -C win-add-q # Add the marked tracks to the queue
    cmus-remote -C filter    # Clear the filter
    cmus-remote -C 'view 4'  # Return to the library view
    cmus-remote -C "lqueue 100" # Switch to library queue
    cmus-remote -n           # Start playing the first track in queue
    cmus-remote -p           # Play the track
    cmus-remote -C "save /home/matias/.temp/nowplaying.m3u" # Save the playlist
```

## Notes

- Ensure that paths and commands (e.g., cmus-remote, beet) are properly configured in your environment.
- Modify the save path `/home/matias/.temp/nowplaying.m3u` as per your system's directory structure and preference.