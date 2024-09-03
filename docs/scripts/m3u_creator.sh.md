# m3u Creator

---

**m3u_creator.sh**: Create an m3u file from files in the current directory

---

### Dependencies

- `bash`: The script is written in Bash and requires a Bash shell to execute.
- `ls`: Utilized to list the files in the current directory.

### Description

The `m3u_creator.sh` script is a simple utility designed to generate a `.m3u` playlist file from the files located in the current working directory. The script uses the following steps to create the playlist:

1. It retrieves the name of the current directory using `basename "$PWD"`, which is stored as `dir_name`.
2. It then constructs the name of the output playlist file by appending `.m3u` to the directory name.
3. The `ls -1` command lists the files in the directory, outputting each filename on a new line, which is then redirected into the created `.m3u` file.

This script is particularly useful for quickly generating a playlist for media players that support m3u files, allowing for efficient playback of all files present in a particular directory without the need for manual entry.

### Usage

To use the script, navigate to the directory containing the files you wish to include in your m3u playlist and execute the script as follows:

```bash
/path/to/m3u_creator.sh
```

After execution, you’ll find a new file named after the directory, ending with `.m3u`. For example, if your current directory is `Music`, the script will create a file named `Music.m3u` containing a list of all files in that directory.

---

> [!TIP] 
> While the script effectively creates an m3u file, it currently includes all files indiscriminately. It may be beneficial to modify the script to filter specific file types (e.g., only audio files) or to handle potential errors, such as when there are no files in the directory or issues with file permissions. This could greatly enhance usability and robustness.