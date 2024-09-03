# fzf Album Launcher

---

**fzf_albumlauncher.xsh**: Launches and plays selected albums using fzf and cmus.

---

### Dependencies

- `beet`: A music library manager for easier organization and playback of music collections.
- `fzf`: A command-line fuzzy finder for selecting items from a list.
- `cmus`: A lightweight console music player that is used for playback in this script.
- `xonsh`: A Python-powered shell that is used to execute this script.

### Description

The `fzf_albumlauncher.xsh` script allows the user to select an album from their music library and play it using cmus. It employs `beet` to list available albums and `fzf` to provide a user-friendly interface for selection. 

Upon choosing an album, the script sends commands to cmus to clear the current playlist and filter in the selected album. This is done through various `cmus-remote` commands, which facilitate interaction with the cmus player. The script also saves the current playlist for future reference. 

### Usage

To use this script, simply run it in your terminal. Ensure you have `beet`, `fzf`, and `cmus` installed and configured properly. Here’s a step-by-step guide:

1. Make sure the script is executable:
   ```bash
   chmod +x /home/matias/.scripts/fzf_albumlauncher.xsh
   ```
   
2. Execute the script with:
   ```bash
   /home/matias/.scripts/fzf_albumlauncher.xsh
   ```

3. A list of albums will be presented via fzf, use your arrow keys to navigate and select your desired album.

4. The script will automatically play your selected album in cmus.

**Note:** You may bind the script to a key combination in your window manager (qtile) for quicker access. 

---

> [!TIP]  
> The script relies on `beet` for listing albums, which means your albums need to be configured correctly in Beet. Consider adding error handling to manage situations when no albums are found or if cmus is not running. Additionally, the script currently interacts with a hardcoded path for saving playlists, which may not be ideal for all users. You might want to make the save path configurable.