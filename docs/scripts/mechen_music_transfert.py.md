# mechen_music_transfert.py

This is a Python script that appears to be designed to copy music from one location (likely a home directory) to a specific device called "Mecken" (/home/matias/MECHEN). The script uses various tools and libraries to achieve this, including:

1. `beet`: A Python library for managing music collections.
2. `subprocess`: A built-in Python module for running external commands.
3. `pandas`: A library for data manipulation and analysis.
4. `getpass`: A function for securely prompting the user for a password.

Here's an overview of the script's functionality:

1. **Get not listened to albums**: The script uses `beet` to list all albums that haven't been listened to (i.e., those with a status of 0). It then extracts the paths and short paths (relative to `/home/matias/music`) from this output.
2. **Calculate sizes**: The script uses `du` (a Unix command for calculating disk usage) to determine the size of each album in kilobytes. These sizes are stored in a list, which is then converted to megabytes and summed up to get the total size of all albums.
3. **Get artists on device**: The script lists the directories within `/home/matias/MECHEN` and extracts the names of the artists (i.e., the directory names).
4. **Create data frame**: The script creates a Pandas DataFrame containing information about each album, including its path, short path, artist, and size.
5. **Remove unnecessary albums**: If any albums are already present on the Mecken device that aren't in the DataFrame, they're removed using `sudo rm -rf`.
6. **Remove empty folders**: Any empty directories within `/home/matias/MECHEN` are also deleted.
7. **Create artist and album folders**: The script creates any necessary folders for each artist and album on the Mecken device.
8. **Rsync music**: Finally, the script uses `rsync` to copy the music from the original location to the Mecken device.

Overall, this script appears to be designed to maintain a synchronized music collection between two locations: `/home/matias/music` (the source) and `/home/matias/MECHEN` (the destination).