# Mechen Music Transfert Utility

---

**mechen_music_transfert.py**: Syncs a subset of unlistened music albums to the MECHEN MP3 player, fitting within a max size.

---

### Dependencies

- `python3`
- `pandas`: Data manipulation and filtering.
- `beet` (from beets): For querying the music library; used to list unlistened albums.
- `du`, `rsync`, `mkdir`, `rm`, `sudo`: Used for size calculation, syncing, and filesystem operations.
- Your music should be organized in `/home/matias/music` and the player mounted at `/home/matias/MECHEN`.

### Description

This script helps you transfer a random subset of unlistened music albums to your MECHEN MP3 player device, keeping within a specified storage size (`50MB` by default, `MAX_SPACE`). The process is as follows:

1. **Password Prompt**: Requests your sudo password interactively (once per run).
2. **Album Discovery**: Uses `beet` (beets) to find all unlistened albums by status.
3. **Size Calculation**: Gathers directory sizes to stay within `MAX_SPACE`.
4. **Randomized Filtering**: Randomly removes artists from the selection until the fit is right.
5. **Cleanup**: Removes albums and artists from the device not in the current selection.
6. **Directory Creation**: Makes sure album/artist folders exist on the player device.
7. **Sync**: Uses `rsync` (with `sudo`) to copy album contents.

This script manages both the selection logic and the device's filesystem state, so your MECHEN always contains "fresh" unlistened albums, without going over its storage limit.

### Usage

- Make sure your player is mounted at `/home/matias/MECHEN`.
- You need to have your music library managed by [beets](https://beets.io/) and tagged appropriately.
- Run the script in a terminal:
  ```
  python3 /home/matias/.scripts/bin/mechen_music_transfert.py
  ```
- You will be prompted for your sudo password (used for file operations on the player device).
- The script will display progress as it selects albums, prepares folders, and syncs files.

**Tip:** Set up a keybinding in your Qtile config to quickly launch this script in a terminal if you refresh your player frequently.

---

> [!TIP]
> - The script hardcodes paths (music library, player mount), space limits, and uses sudo, which makes it less portable and somewhat risky (danger of `rm -rf`). Consider parameterizing these with command-line arguments or a config file, and add more user prompts for destructive actions.
> - Error handling is minimal—if a subprocess fails, it silently continues. Checking exit statuses and printing errors would make it more robust.
> - Using `getpass` for the sudo password is practical for you, but reusing the password for every operation is slow; consider using a root-owned helper script or running the script with `sudo` directly.
> - You might want to log operations for troubleshooting, especially if synced files go missing!
> - This script is powerful for your workflow, but double-check your beets status tags and consider backing up the MECHEN folder before using.