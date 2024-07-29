# next_album.xsh

# Skip to Next Album in CMus

This script is designed to automate the process of skipping to the next album in [cmus](https://cmus.github.io/), a popular console music player.

## Functionalities

The script performs the following actions:
1. **Switch to Album View in cmus:**
    - Run `cmus-remote -C 'view 4'` command to make sure cmus is in the correct view mode to list the albums.
    
2. **Save Now Playing Playlist:**
    - Run `cmus-remote -C 'save /home/matias/.temp/now_playing.m3u'` to save the currently playing tracks to a temporary playlist file.
    
3. **Parse Playlist File:**
    - Read the saved playlist file and split its contents into individual lines, filtering out any empty lines.
    
4. **Extract Album Names:**
    - Extract the album names from the file paths in the playlist.
    
5. **Find Current Album:**
    - Determine the album of the currently playing track by running the `cmus-remote -Q` command and parsing its output.
    
6. **Skip Tracks to Next Album:**
    - Iterate through tracks and skip (`cmus-remote -n`) until the next album is reached.
    
## Usage 
To execute the script, use xonsh, a shell which combines Python and shell scripting capabilities:

```sh
./skip_to_next_album.xsh
```

Make sure you give execution permissions to your script if you haven't already:

```sh
chmod +x skip_to_next_album.xsh
```

## Environment

- **xonsh**: Ensure that the xonsh shell is installed and properly configured as this script uses xonsh specific syntax and commands.
- **cmus-remote**: cmus and its remote command interface must be installed and configured.

## Notes

- Paths and specific commands may need to be adjusted based on your setup and environment.
- The temporary playlist location (`/home/matias/.temp/now_playing.m3u`) should be accessible and writable.

## Example

To see the script in action, start playing music in cmus and run the script:

```sh
./skip_to_next_album.xsh
```

This will automatically skip to the next album in your cmus playlist.

---

By using this script, you can automate and streamline your music listening experience in cmus, making it easy to jump to a new album without manual intervention.