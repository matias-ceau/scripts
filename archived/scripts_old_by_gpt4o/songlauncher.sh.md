# songlauncher.sh

# Play Song Script

## Description
This script allows you to play a song using `cmus` (a command-line music player) and `dmenu` (a dynamic menu for X). The songs are sourced from the `music` directory and presented in an interactive selection menu.

## Usage
```sh
./play_song.sh
```

## Functionalities
- **Music Selection**: The script scans the `music` directory for music files.
- **Interactive Menu**: It uses `dmenu` to present the user with an interactive menu for song selection.
- **Play Song**: Once a song is selected through the menu, it is played using `cmus`.

## Requirements
- `cmus`: A command-line music player.
- `dmenu`: A dynamic menu for X.

## Script

```sh
#! /bin/sh

#INFO:#@RUN@ "Play a song with cmus using dmenu"

cmus-remote -f "$(find -L music -type f | dmenu -i -l 30)"
```

## Details
1. **Directory Scan**: The command `find -L music -type f` searches the `music` directory for files, following symbolic links (`-L`) and listing only files (`-type f`).
2. **Menu Presentation**: The output of the `find` command is piped to `dmenu` for interactive selection. The `dmenu` options provided are:
   - `-i`: Case-insensitive match.
   - `-l 30`: Display up to 30 lines at once.
3. **Playing the Song**: The selected song file path is passed to `cmus-remote -f` to play the song using `cmus`.

## Author
*This script is authored to provide a simple interface for playing music using cmus and dmenu.*

## License
This script is open-source. Feel free to use, modify, and distribute it as per your needs.

Feel free to add any additional details or instructions specific to your usage of the script.
