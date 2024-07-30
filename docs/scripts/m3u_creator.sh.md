
---

Create an m3u file from all files in the current directory.

---

### Table of contents

- [Dependencies](#dependencies)
- [Description](#description)
    - [Overview](#overview)
    - [Usage](#usage)
    - [Examples](#examples)
- [Notes](#notes)

---

<a name="dependencies" />

### Dependencies

- Bash (default shell on Arch Linux)

<a name="description" />

### Description

<a name="overview" />

#### Overview

The `m3u_creator.sh` script is a simple Bash script that generates an M3U playlist file from all the files present in the current working directory. It uses the `ls` command to list files and redirects the output to create an M3U file named after the current directory. M3U files are commonly used for playlists in media players.

The script performs the following steps:
1. It retrieves the name of the current working directory using `basename "$PWD"`.
2. It constructs the playlist filename by appending `.m3u` to the directory name.
3. Finally, it uses the `ls -1` command to list the files in a single column format and creates the playlist.

This script is particularly useful for quickly generating playlists without manually listing files.

---

<a name="usage" />

#### Usage

To use the `m3u_creator.sh` script:
1. Open a terminal and navigate to the directory containing the media files you want to include in the playlist.
2. Execute the script by running `./m3u_creator.sh`.
3. The script will create a new file named `<directory_name>.m3u` in the same directory.

Make sure the script is executable by running `chmod +x m3u_creator.sh` if necessary.

<a name="examples" />

#### Examples

- Navigate to the directory:
    ```bash
    cd ~/Music
    ```

- Run the script:
    ```bash
    ./m3u_creator.sh
    ```

- Check the contents of the generated playlist:
    ```bash
    cat Music.m3u
    ```

---

<a name="notes" />

### Notes

- This script assumes all files in the directory should be included in the playlist and does not filter by file type. Consider modifying it if specific file types are required.
- If there are subdirectories, they will not be listed in the M3U file.

> **Critique**
>
> The script is straightforward but could be enhanced for better usability. For instance:
> - Adding options for filtering files based on extensions (e.g., only `.mp3` or `.wav` files).
> - Including error handling to check if the directory is empty or if there are no suitable files for the playlist.
> - Allowing the user to specify the output file name instead of using the default directory name could improve flexibility.