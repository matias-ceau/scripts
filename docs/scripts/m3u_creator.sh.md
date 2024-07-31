# M3U Creator Script (m3u_creator.sh)

---

Create an m3u file from music files in the current directory.

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

- Bash shell
- Basic command-line tools (ls)

<a name="description" />

### Description

<a name="overview" />

#### Overview

This script generates an M3U playlist file from all the files in the current directory. It retrieves the name of the directory using `basename "$PWD"` and constructs the M3U file by listing all the files present in that directory. The output file will be named after the current directory followed by the `.m3u` extension.

- **Directory Determination**: The script uses `basename` to get the name of the current directory (`$PWD`).
- **Playlist Creation**: It lists the files in the directory using `ls -1`, which outputs each file on a new line, and redirects the output to a new M3U file.

---

<a name="usage" />

#### Usage

1. Navigate to the directory containing the audio files you want to include in the playlist.
2. Execute the script by running the following command in the terminal:

   ```bash
   /home/matias/.scripts/m3u_creator.sh
   ```

3. After execution, an M3U playlist file named `<directory_name>.m3u` will be created in the same directory.

<a name="examples" />

#### Examples

- To create a playlist from files in the directory `/home/user/music`, run the script while in that directory:

   ```bash
   cd /home/user/music
   /home/matias/.scripts/m3u_creator.sh
   ```

- Check the output by listing the files:

   ```bash
   ls
   ```

  This should show a new file named `music.m3u`.

---

<a name="notes" />

### Notes

- Ensure that the directory contains audio files, as the script will list all files indiscriminately.
- The script assumes it is run in a directory that contains media files, and it does not filter file types.

> **Critique**: 
> The script currently lists all files without filtering for audio formats. Adding additional functionality to filter files (e.g., `.mp3`, `.wav`, etc.) would provide a more practical output. Additionally, the script could benefit from error handling to manage situations where no files exist in the directory. This would make it more robust for different user scenarios.