# M3U Playlist Creator

---

**[m3u_creator.sh](m3u_creator.sh)**: Generate an M3U playlist file from the current directory files.

---

### Dependencies

- `bash`: The script is written in Bash and requires a Bash shell to execute.
- `ls`: Utilized to list files in the current directory.

### Description

This script automatically creates an M3U playlist file from all files located in the current directory. An M3U playlist is a plain text file that specifies the locations of one or more media files, often used with media players.

When you run this script, it performs the following actions:

1. Retrieves the name of the current directory using `basename "$PWD"`.
2. Constructs the name of the M3U playlist file based on the current directory (e.g., if the directory is named "Music", the file will be "Music.m3u").
3. Executes the `ls -1` command, which lists all files in the current directory, and directs the output to the newly created M3U file.

The resulting M3U file will contain a list of all the files present in the directory, one per line, which any compatible media player can utilize to play the listed tracks.

### Usage

To use the script, follow these steps:

1. Open a terminal and navigate to the desired directory containing your media files.
2. Run the script with the following command:

   ```bash
   bash /home/matias/.scripts/m3u_creator.sh
   ```

3. After the script runs, you will find a file named after the current directory, with a `.m3u` extension. For example, if you are in a directory named "MyMusic", the file will be named "MyMusic.m3u".

This script can also be assigned to a keybinding in your window manager if desired, allowing for quick creation of playlists directly from your file browser or desktop environment.

---

> [!TIP]  
> This script is simple and effective for small playlists. However, it does not filter file types, which may lead to unexpected entries in the playlist if non-audio files are present. Consider enhancing the script to include parameters for specific file extensions, e.g., only including `.mp3` and `.wav` files.
