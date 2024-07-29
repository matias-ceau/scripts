# albumplayer.xsh

# Script Documentation

## Overview

This script is designed to interact with the `cmus` music player, allowing the user to select and play an album using `dmenu`. The script requires both `cmus` and `dmenu` to be installed on the system. It reads a list of available music files, allows the user to select an album, and then creates a playlist that is played by `cmus`.

## Requirements
- cmus
- dmenu

## Functionalities

1. **Reading Music Library:**
    - The script reads from a library file located at `~/.config/cmus/lib.pl`.
    - It gathers all file paths listed in this library.

2. **Album Selection:**
    - Extracts album names from the file paths.
    - Processes the album names into a more readable format and displays them using `dmenu` for the user to select an album.

3. **Create and Shuffling Playlist:**
    - Based on the selected album, it creates a temporary playlist.
    - Also includes songs from a few other randomly shuffled albums to diversify the playlist.

4. **Playing the Playlist:**
    - Saves the playlist into a temporary file at `~/.config/cmus/.temp.m3u`.
    - Uses `cmus-remote` commands to load, clear the previous playlist, and play the new playlist.

## Script Details

```python
#! /usr/bin/env xonsh

#DOC#@RUN@=2024-06= "Play an album using cmus"
#+required+ cmus dmenu

import os
import random

# Path to the temporary playlist file
temp_path = os.path.expanduser('~/.config/cmus/.temp.m3u') 

# Read the paths from the library file
paths = $(cat ~/.config/cmus/lib.pl).splitlines()

# Extract album names while ensuring uniqueness
albums = list(set(['/'.join(i.split('/')[-3:-1]) for i in paths]))

# Create a dictionary for fancy display names
fancy_dict = {k : (k.split('/')[0] ,  k.split('/')[-1]) for k in albums}
fancy_dict = {k : f"{i[:50]:>100}    \u2014    {j}" for k,(i,j) in fancy_dict.items()}
fancy_names = '\n'.join([v for v in fancy_dict.values()])

# Display album choices using dmenu and get the selected item
selected = $(echo @(fancy_names) | dmenu -i -l 300)

# Find the selected path based on the dmenu output
res_ = [f"{k}#{v}" for k,v in fancy_dict.items() if v in selected]
sel_path,sel_fancy = res_[0].split('#')

# Create a playlist from the selected album and some random other albums
playlist_paths = [p+'\n' for p in paths if sel_path+'/' in p]

# Shuffle and pick some additional albums for the playlist
albums = [a for a in albums if sel_path+'/' not in a]
random.shuffle(albums)

# Add songs from the additional albums to the playlist
rest = []
for a in albums[:10]:
    playlist_paths += [p+'\n' for p in paths if (a+'/') in p]
    print(playlist_paths[-1])

# Save the playlist to the temporary file
with open(temp_path, 'w') as f:
    f.writelines(playlist_paths)

# Commands to play the playlist using cmus
cmus-remote -U
cmus-remote -C "view 4"
cmus-remote -C clear
cmus-remote -Q
cmus-remote -q @(temp_path)
cmus-remote -p
cmus-remote -n
```

## How to Use
1. Ensure that `cmus` and `dmenu` are installed on your system.
2. Place the script in a directory of your choosing, and make sure it has executable permissions (`chmod +x script_name`).
3. Update your `cmus` library file location if it differs from `~/.config/cmus/lib.pl`.
4. Run the script from a terminal.

When executed, the script will display a list of albums using `dmenu`. Upon selecting an album, the script will generate a playlist and start playing it in `cmus`.