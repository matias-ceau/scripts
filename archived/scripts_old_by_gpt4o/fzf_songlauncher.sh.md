# fzf_songlauncher.sh

# Play a Song with cmus and fzf

This script allows you to play a song using `cmus`, a popular console music player, by selecting it with `fzf`, a command-line fuzzy finder. By leveraging `fzf`, you can quickly search and select a song from your music directory.

## Prerequisites

Before using this script, ensure you have the following tools installed:

- **cmus**: Music player for the command line.
- **fzf**: Command-line fuzzy finder.

## Usage

To execute the script, open your terminal and simply run:

```sh
./path-to-your-script.sh
```

Replace `path-to-your-script.sh` with the actual path to your script file.

## How It Works

1. **Searching for Songs**:
    - The script uses the `find` command to locate all files within the `music` directory (`-L` option to traverse symbolic links).
    - It filters out files to be used by `fzf`.

2. **Selecting a Song**:
    - `fzf` presents an interactive menu to select one of the files found.

3. **Playing the Selected Song**:
    - Once a file is selected, `cmus-remote -f` is used to play the chosen song.

## Script Code

```sh
#! /bin/sh

# Play a song with cmus (chose it with fzf)
cmus-remote -f "$(find -L music -type f | fzf)"
```

## Example

Assuming your music files are stored in a directory named `music`:

1. Navigate to the directory containing your script.
2. Run the script:
    ```sh
    ./play_song.sh
    ```
3. Use the `fzf` interface to search and select a song from the list presented.
4. The selected song will start playing in `cmus`.

## Notes

- **Customize Music Directory**: If your music folder is named differently or located elsewhere, modify the `find -L music` part of the script accordingly.
- **Existing cmus Instance**: Ensure `cmus` is running, as `cmus-remote` requires an active `cmus` session to send commands.

## Troubleshooting

- **fzf Not Installed**: If you encounter a `command not found: fzf` error, install `fzf` using your package manager (e.g., `brew install fzf` on macOS, `sudo apt-get install fzf` on Debian-based Linux).
- **cmus Not Installed**: If `cmus` is not installed, you can get it via your package manager (e.g., `brew install cmus` on macOS, `sudo apt-get install cmus` on Debian-based Linux).
- **No Songs Found**: Ensure that the `music` directory contains playable files and that there are no permission issues preventing `find` from accessing the directory.

Feel free to customize and extend the script to better fit your needs!