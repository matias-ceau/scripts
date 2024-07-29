# m3u_creator.sh

**Script Description:**
This is a Bash script that generates an M3U playlist file from the list of files present in the current working directory.

**Functionality:**

Here's how it works:

1. The script uses the `basename` command to extract the name of the current directory (`$PWD`) and assigns it to the variable `dir_name`.
2. It then constructs a filename for the M3U playlist file by appending `.m3u` to the directory name, resulting in e.g., "current_dir.m3u" if the script is run from a directory named "current dir".
3. The `ls -1` command is used to list all files (option `-l` provides detailed information, but we use `-1` to suppress this and only show filenames) in the current directory.
4. The output of the `ls` command (`stdout`) is redirected using the `>` operator to create a new file with the filename specified in step 2.

**Result:**
The script will generate an M3U playlist file containing the list of files from the current working directory, one per line. The file can be played back using media players that support M3U playlists (e.g., VLC, MPC-HC).

Note: Be cautious when running this script, as it will overwrite any existing file with the same name in the current directory!