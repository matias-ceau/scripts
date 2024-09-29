# M3U Playlist Creator

---

**m3u_creator.sh**: Create an m3u file from files in the current directory

---

### Dependencies

- `bash`: The script is written for the Bash shell, which is typically available on most Unix-like systems including Arch Linux.

### Description

The `m3u_creator.sh` script automates the creation of an M3U playlist file from files located in the current directory. When executed, the script performs the following key actions:

1. Retrieves the name of the current directory using `basename "$PWD"`.
2. Constructs the name of the playlist file by appending the `.m3u` extension to the directory name.
3. Uses the `ls -1` command to list all files in the current directory in a single-column format and redirects this output to the newly created M3U file.

The simple yet effective design of this script allows for quick playlist generation, which can be particularly useful in media applications or for audio file management.

### Usage

To use the `m3u_creator.sh` script, follow these steps:

1. Open your terminal and navigate to the directory containing the media files you wish to include in your playlist.
2. Run the script by executing:

   ```bash
   /home/matias/.scripts/m3u_creator.sh
   ```

3. After running, you will find an M3U file named after the directory in which you executed the script. For example, if you are in a directory called `Music`, the resulting file will be `Music.m3u`.

```bash
$ cd ~/Music
$ /home/matias/.scripts/m3u_creator.sh
```

The created M3U file will contain a list of the files in the `Music` directory, ready for use in your media player!

---

> [!TIP]
> While the script serves its purpose well, it would benefit from error handling to manage potential issues such as empty directories or permission errors when creating the M3U file. Consider adding checks for these conditions and providing user-friendly messages. Furthermore, you might want to allow for excluding certain file types from the playlist or accept a custom file name as an argument.