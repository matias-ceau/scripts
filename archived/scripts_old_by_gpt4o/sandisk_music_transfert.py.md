# sandisk_music_transfert.py

# Music Transfer to Sandisk Media Player

This script transfers music from your local system to a Sandisk media player, ensuring that the total size of the transferred music does not exceed the maximum allowed space on the media player. The script also removes unsupported music formats and manages deletion and synchronization of files efficiently.

## Features

- Retrieves not listened to albums from the Beets music library.
- Calculates the total size of the albums.
- Filters out unsupported music formats.
- Randomly drops albums to fit within maximum allowed space.
- Manages the removal of unnecessary albums from the media player.
- Creates necessary artist and album directories on the media player.
- Synchronizes the local music with the media player using `rsync`.

## Requirements

- Python 3.x
- `pandas` library
- `beet` (Music library manager)
- `rsync`
- Suitable permissions to read/write to the media player

## Usage

To run the script:
```sh
python3 scriptname.py
```

## Code Overview

```python
#! /usr/bin/python3

import subprocess
from subprocess import PIPE
import os
import pandas as pd
import random
from getpass import getpass

# Maximum space allowed on the media player
MAX_SPACE = 30 * 1024**2
player_path = '/run/media/matias/EC95-4FBB/Music'

# Fetch not listened to albums
album_query = subprocess.run('beet ls -ap status:0', shell=True, capture_output=True)
album_paths = album_query.stdout.decode('ascii').splitlines()
short_paths = [i.replace('/home/matias/music/','') for i in album_paths]
print(f"len(album_paths)} not listened to")

# Calculate album sizes
sizes = [subprocess.run(['du','-sk',i],capture_output=True) for i in album_paths]
sizes = [int(i.stdout.decode('ascii').split('\t')[0]) for i in sizes]
print(f"Total size equal to round(sum(sizes)/1024/1024,2)} GB")

# Extract artist names
artist = [i.split('/')[4] for i in album_paths]

# Create a DataFrame for music data
df = pd.DataFrame({
    'path': album_paths,
    'short_path': short_paths,
    'artist': artist,
    'format': [os.listdir(i)[0].split('.')[-1] for i in album_paths if i != 'cover.jpg'],
    'size': sizes
})

# Filter out unsupported formats
df = df[df['format'].isin(['aac', 'm4a', 'flac', 'mp3', 'wav', 'wma'])]

# Helper function to drop a random artist's albums
def drop_random_artist(df):
    to_drop = random.choice(list(set(df.artist)))
    print(to_drop)
    return df[df['artist']!=to_drop]

# Helper function to check if DataFrame exceeds max space
def df_too_big(df):
    return df['size'].sum() > MAX_SPACE

# Drop random artists' albums until total size is under max space
while df_too_big(df):
    print('Too much data, removing:')
    df = drop_random_artist(df)

# List existing artists and albums on the media player
artists_on_device = [i for i in os.listdir(player_path) if os.path.isdir(i)]
albums_on_device = [[f"{i}/{b}" for b in os.listdir(os.path.join(player_path, i))] for i in artists_on_device]
albums_on_device = [i for j in albums_on_device for i in j]

# Remove unnecessary albums from the media player
for i in albums_on_device:
    if i not in df['short_path'].to_list():
        proc = subprocess.Popen(['sudo', '-S', 'rm', '-rf', os.path.join(player_path, i)], stdin=PIPE, stdout=PIPE, stderr=PIPE)
        proc.communicate(password.encode())

# Remove empty directories on the media player
for i in os.listdir(player_path):
    p = os.path.join(player_path, i)
    if os.path.isdir(p) and not os.listdir(p):
        subprocess.run(['rm', '-rf', p])

# Create directories for missing artists and albums
print('Creating folders...')
for i in df['short_path'].to_list():
    subprocess.run(['mkdir', '-p', os.path.join(player_path, i)])

# Synchronize local music with the media player
nb_albums = len(df)
for n, i in enumerate(df['short_path'].to_list()):
    print(f"Rsyncing {i} ({n+1}/{nb_albums})")
    subprocess.run(['rsync', '-rvu', '--delete', os.path.join('/home/matias/music', i)+'/', os.path.join(player_path, i)])
```

## Notes

- Ensure your media player is mounted correctly, and the `player_path` variable points to the correct mount location.
- This script assumes you have the `beets` library and `rsync` properly configured on your system.
- Sufficient permissions are required for file operations on the Sandisk media player.
- It uses `sudo` for certain delete operations which will require the appropriate system password.

## License

This project is licensed under the MIT License. [See LICENSE](LICENSE) for more information.

---

Feel free to contribute or raise issues in the issue tracker if you encounter any problems or have suggestions for improvements.