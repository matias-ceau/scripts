# playlist_randomizer.xsh

# Random Playlist Generator and Player

This script allows the user to pick a playlist of albums and play it in a random order using `cmus`, a small, fast and powerful console music player. The script is written in the `xonsh` shell language and uses `pandas` to manage and shuffle the playlist.

## Features

- Displays a list of available playlists to the user using `dmenu`.
- Randomizes the order of albums in the selected playlist.
- Generates a new playlist with the randomized album order.
- Plays the randomized playlist in `cmus`.

## Prerequisites

- Install `cmus`:
  
  ```sh
  sudo apt-get install cmus
  ```

- Install `xonsh`:
  
  ```sh
  sudo pip install xonsh
  ```

- Install `dmenu`:
  
  ```sh
  sudo apt-get install dmenu
  ```

- Install `pandas`:
  
  ```sh
  sudo pip install pandas
  ```

## Usage

Save the script in a file, for example `randomize_playlist.xsh`, and make it executable:

```sh
chmod +x randomize_playlist.xsh
```

Run the script:

```sh
./randomize_playlist.xsh
```

## Script Breakdown

```python
#! /usr/bin/env xonsh

# Pick a playlist of albums and play in random order in cmus

import pandas as pd
import random
import os

# Path to the playlists folder
PLAYLIST_PATH = os.path.expanduser('~/.playlists') 

# Get list of available playlists
options = '\n'.join([i.split('.')[0] for i in $(ls @PLAYLIST_PATH).split('\n') if 'm3u' in i])

# Open dmenu to select a playlist
selected = $(echo @(options) | dmenu -i -l 30).replace('\n','')
print(selected)

# Read the selected playlist
content = $(cat @(f'/home/matias/notes/playlists/{selected}.m3u')).splitlines()
content = [i for i in content if i]

# Extract album and song information
albums = [i.split('/')[-2] for i in content]
songs = [i.split('/')[-1] for i in content]

# Create a DataFrame with the playlist information
df = pd.DataFrame({'albums'  : albums,
                   'songs'   : songs,
                   'content' : content})

# Get a list of unique albums and randomize the order
indiv_albums = df.albums.unique().tolist()
random.shuffle(indiv_albums)

# Create a mapping of albums to their new order
mapping = {k:v for v,k in enumerate(indiv_albums)}
df['order'] = [mapping[i] for i in df.albums]

# Sort the DataFrame based on the new order and songs
df = df.sort_values(['order', 'songs'])

# Create a new randomized playlist content
random_pl = '\n'.join(df.content.tolist())
echo @(random_pl) > /home/matias/.temp/randomized.m3u

# Commands to control cmus and play the new playlist
cmus-remote -C 'view 4'
cmus-remote -C clear
cmus-remote -C 'add /home/matias/.temp/randomized.m3u'
cmus-remote -n
cmus-remote -p
```

## How It Works

1. The script defines the path to the `.playlists` directory and retrieves all `.m3u` files.
2. It uses `dmenu` to display the list of playlists and lets the user select one.
3. The selected playlist is read, and its contents are parsed to extract the album and song information.
4. The script creates a `pandas` DataFrame to manipulate the playlist.
5. The albums are randomized, and a new order is assigned to each song's album.
6. The DataFrame is sorted based on this new order and the songs, and a new randomized playlist is generated.
7. The new randomized playlist is saved to a temporary file.
8. Finally, various `cmus-remote` commands are issued to clear the current playlist, add the new one, and start playing it.

## Notes

- Ensure that the `PLAYLIST_PATH` and other paths used in the script match your environment.
- This script assumes that the playlist files are in M3U format.

Feel free to customize the script according to your needs.