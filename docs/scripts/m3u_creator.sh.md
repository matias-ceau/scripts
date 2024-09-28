# M3U Creator Script

---

**m3u_creator.sh**: Script to create an M3U playlist file from files in the current directory

---

### Dependencies

- `bash`: This script is written in bash, so ensure you have bash installed to execute it.

### Description

This script is designed to quickly generate an M3U playlist file from all the files in the current directory. The M3U format is commonly used for playlists in media players. When executed, the script performs the following steps:

1. It retrieves the current working directory's name using `basename "$PWD"`, which is used to create the playlist filename.
2. It lists all files in the current directory using `ls -1` and writes the list to a file named after the directory with the `.m3u` extension.

This script assumes that the user is already in the desired directory containing media files and that such files are ready to be added to an M3U playlist.

### Usage

You can use this script by executing it in the terminal while you're located in the desired directory for playlist creation:

```bash
cd /path/to/media/files
bash /home/matias/.scripts/m3u_creator.sh
```

After running, a `.m3u` file will be created in the current directory, named after the directory itself (e.g., `mediafiles.m3u` if the directory is named `mediafiles`).

---

> [!TIP] 
> - The script could be improved by filtering files based on extensions typically used for media (like `.mp3`, `.mp4`) to ensure only playable files are included in the playlist.
> - Consider adding error handling to check if the `ls` command was successful.
> - This script assumes that filenames do not contain new lines. If they do, they might cause issues in the M3U file.