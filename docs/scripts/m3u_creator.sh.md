# m3u_creator.sh

# Create an m3u File from Files in Current Directory

This script is designed to create an `.m3u` playlist file from the files in the current directory. The `.m3u` file will contain a list of filenames, one per line. The name of the playlist file will be based on the name of the current directory.

## How It Works

1. The script extracts the name of the current directory.
2. It creates a `.m3u` file using the current directory name.
3. It lists all files in the current directory and writes the list to the `.m3u` file.

## Requirements

- Bash shell

## Usage

Run the script in the terminal while in the directory where you want to generate the `.m3u` file:

```bash
./script_name.sh
```

## Example

Suppose you are in a directory named `Music` with the following files:

```
song1.mp3
song2.mp3
song3.mp3
```

Running the script will create a file named `Music.m3u` with the following content:

```
song1.mp3
song2.mp3
song3.mp3
```

## Script Content

```bash
#!/bin/bash

#DOC#=2024-07=@CLI@ "Create an m3u file from files in current dir"

dir_name=$(basename "$PWD")
playlist_file="${dir_name}.m3u"
ls -1 > "$playlist_file"
```

## Explanation

- `dir_name=$(basename "$PWD")`
  - Gets the base name of the current working directory and assigns it to the variable `dir_name`.

- `playlist_file="${dir_name}.m3u"`
  - Creates the name of the playlist file by appending `.m3u` to the directory name.

- `ls -1 > "$playlist_file"`
  - Lists all files in the current directory, one per line, and writes this list to the playlist file specified in `playlist_file`.

## Notes

- Ensure you have execution permissions for the script. You can set the permission using:
  ```bash
  chmod +x script_name.sh
  ```

- This script assumes that all files in the directory should be included in the `.m3u` file. If you wish to filter files by extension or any other criteria, you might need to modify the script accordingly.