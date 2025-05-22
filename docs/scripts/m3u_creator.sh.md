# m3u Creator Script

---

**m3u_creator.sh**: Quickly generate an m3u playlist file from all files in the current directory

---

### Dependencies

- `bash`  
  Standard GNU Bourne Again Shell.
- `ls`  
  Coreutils tool to list directory contents.

### Description

This script automates the creation of an `.m3u` playlist file containing all files (one per line) in the current directory. The generated playlist is named after the directory itself, following this pattern:

```
<directory-name>.m3u
```

For example, if you're in a directory called `MyMusic`, running this script will create a file called `MyMusic.m3u` that lists every file in that directory.

**How it works:**

- Retrieves the base name of your current working directory (`$PWD`).
- Runs `ls -1` to list all files (non-recursively) in the directory, one per line.
- Writes this file list into a new `.m3u` file whose name matches your current directory name.

This is useful for quickly generating simple playlist files compatible with music players that support the M3U format.

### Usage

You can run the script in any directory to create a playlist from the files in that directory.

#### Direct Terminal execution:
```bash
cd ~/Music/Albums/SomeAlbum
~/.scripts/bin/m3u_creator.sh
```

This creates `SomeAlbum.m3u` in the current directory, containing a list of all files found there.

#### Assigning to qtile keybinding:
To map the script to a keybinding in your qtile config:

```python
Key([mod], "F10", lazy.spawn("~/.scripts/bin/m3u_creator.sh"))
```
*(Replace `[mod]` and `"F10"` with your preferred modifier and key)*

#### TL;DR

```sh
# From within any folder:
m3u_creator.sh
# A playlist .m3u appears with the same name as the directory, listing all files inside.
```

---

> [!TIP]
>
> - The script lists **all files**, regardless of file type. Consider filtering for music files (e.g., `.mp3`, `.flac`) if you want your playlist to include only relevant formats.
> - Files are listed in alphabetical order and not recursively. Subfolders and their contents are not included.  
> - Filenames containing newlines or special characters could cause issues with some players.  
> - If re-run, the script overwrites any existing `.m3u` with the same name, which might lead to data loss if your playlist was edited manually.  
> - For a more robust solution, use `find` and filtering, e.g.  
>   `find . -maxdepth 1 -type f -iname "*.mp3" | sort > "$playlist_file"`  
>   This way, only music files are included in the playlist.