# random_album.xsh

# Random Album Player for CMUS

## Description

This script randomly selects an album from your CMUS library and plays it. The script performs the following tasks:

1. Clears the current playlist.
2. Creates a temporary playlist containing tracks from a randomly selected album.
3. Loads and plays the album in CMUS.

## Prerequisites

- **CMUS**: Make sure CMUS is installed on your system.
- **Xonsh**: This script uses Xonsh shell for execution.

## Installation

Save the script to a file, for example, `play_random_album.xsh`, and make it executable:

```bash
chmod +x play_random_album.xsh
```

## Usage

Run the script:

```bash
./play_random_album.xsh
```

## Script Details

```python
#! /usr/bin/env xonsh

#DOC#@RUN@ "Select random album and play it with cmus"

import random
import os

temp_path = os.path.expanduser('~/.config/cmus/.temp.m3u') 

# Clear the current CMUS playlist
cmus-remote -U
cmus-remote -C "view 4"
cmus-remote -C clear

# Read the library file and parse album paths
paths = $(cat .config/cmus/lib.pl).splitlines()
albums = list(set(['/'.join(i.split('/')[-3:-1]) for i in paths]))
random.shuffle(albums)
playlist_paths = []

# Select tracks from 10 random albums
for n in range(10):
    playlist_paths += [i+'\n' for i in paths if (albums[n]+'/') in i]

# Write the selected tracks to the temporary playlist
with open(temp_path, 'w') as f:
    f.writelines(playlist_paths)
#albums = $(beet ls -a).splitlines()
#albums = [x.split(' - ')[-1] for x in albums]
#selection = random.choice(albums)

# Load the temporary playlist in CMUS and start playback
cmus-remote -q @(temp_path)
cmus-remote -p
cmus-remote -n
```

## Detailed Functionality

1. **Initialize**:
   - Creates a path for the temporary playlist file in `~/.config/cmus/.temp.m3u`.

2. **Clear Current Playlist**:
   - Executes `cmus-remote -U` to update the CMUS library.
   - Switches to the playlist view using `cmus-remote -C "view 4"`.
   - Clears the current playlist using `cmus-remote -C clear`.

3. **Load Library and Select Albums**:
   - Reads the CMUS library file (`~/.config/cmus/lib.pl`).
   - Processes the paths to extract unique albums.
   - Randomly shuffles the list of albums.
   - Selects tracks from 10 random albums to create a temporary playlist.

4. **Write Playlist and Play**:
   - Writes the selected album tracks to the temporary playlist file.
   - Loads the temporary playlist into CMUS using `cmus-remote -q`.
   - Starts playing the loaded playlist using `cmus-remote -p` and skips to the next track with `cmus-remote -n`.

Now, you can enjoy randomly selected albums from your CMUS library with a simple script!