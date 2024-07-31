# Next Album in CMUS

---

**[next_album.xsh](next_album.xsh)**: Skip to the next album in CMUS audio player

---

### Dependencies

- `cmus` - A powerful and lightweight CLI audio player.
- `xonsh` - A Python-powered shell that offers advanced functionality over traditional shells.

### Description

This script is designed to streamline your music listening experience by enabling you to skip to the next album in the CMUS (C Music Player) audio player. The script utilizes the `cmus-remote` command to interact with CMUS, fetching the currently playing album and providing an easy way to navigate through your album collection.

Here is a breakdown of the script's functionality:

1. **View Current Album**: The script first fetches the album details currently being viewed in CMUS by executing the command `cmus-remote -C 'view 4'`.

2. **Save Current Playlist**: It saves the currently playing tracks to a temporary M3U file using `cmus-remote -C 'save /home/matias/.temp/now_playing.m3u'`.

3. **Process the Playlist**: The script reads the temporary M3U file, filters out any empty lines, and extracts the album names from the file path.

4. **Identify Current Album**: It identifies the current album by querying CMUS and splitting the retrieved data to isolate the album name.

5. **Skip to Next Album**: The script counts how many albums are ahead of the current one and uses a loop to skip to the next album using `cmus-remote -n`.

### Usage

To use this script, ensure it is executable and run it from the terminal or assign it to a keybinding in your window manager (QTile in this case). Here’s how you can execute it from the terminal:

```bash
chmod +x /home/matias/.scripts/next_album.xsh
/home/matias/.scripts/next_album.xsh
```

This command will trigger the script, causing CMUS to skip to the next album automatically.

---

> [!TIP]  
> The script could be enhanced by adding error handling to manage cases where CMUS is not running, or when the playlist file does not exist. This would make the script more robust and user-friendly. Additionally, consider implementing a feature that allows the user to configure where the temporary M3U file is stored, which could help prevent potential permission issues.
