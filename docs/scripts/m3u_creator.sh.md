# M3U Playlist Creator

---

**m3u_creator.sh**: Creates an M3U playlist file from all files in the current directory.

---

### Dependencies

- `bash`: The script is a Bash shell script and requires the Bash shell to run.
- `ls`: Utilized to list files in the current directory.

### Description

This script, `m3u_creator.sh`, is a simple utility designed to generate an M3U playlist from the current directory's files. Here's a breakdown of its functionality:

- It determines the name of the current directory using `basename "$PWD"`, which captures only the last part of your current working directory path.
- An M3U playlist file is created using this directory name, appended with a `.m3u` extension.
- The script uses the `ls -1` command to list all files in the directory one per line, which is redirected into the playlist file, effectively populating the M3U file with entries corresponding to each file in the directory.

### Usage

To use the `m3u_creator.sh` script, simply navigate to the directory containing the files you wish to include in your playlist and execute the script. Here’s how:

```bash
cd /path/to/your/music/directory
/home/matias/.scripts/bin/m3u_creator.sh
```

This will create a file named `your_directory_name.m3u` which contains an entry for each file in your current directory.

---

> [!NOTE]
> One issue with the script is that it includes all files in the current directory without filtering for specific types (e.g., audio files). Consider adding functionality to filter files based on extensions (like `.mp3`, `.wav`), as this would result in a more useful M3U playlist. Additionally, it might be worth adding a check to ensure the playlist file is not unintentionally overwritten if it exists.