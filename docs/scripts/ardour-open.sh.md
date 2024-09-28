# Ardour Session Opener

---

**ardour-open.sh**: Script to open the most recent Ardour session

---

### Dependencies

- `fd`: A simple, fast, and user-friendly alternative to `find`.
- `xargs`: A command to build and execute command lines from standard input.
- `stat`: Displays file or file system status.
- `sed`: Stream editor for filtering and transforming text.
- `bat`: A `cat` clone with syntax highlighting and Git integration; used here for XML files.
- `improved-fzfmenu.sh`: A custom script presumably functioning as an enhanced fzf interface. Ensure it's executable and in your PATH.
- `ardour`: A digital audio workstation for recording and mixing.
- `dmenu` (commented out): A dynamic menu for X11; optionally required if the commented code is reintroduced.
  
### Description

This script is designed to streamline the process of opening audio projects in Ardour on your Arch Linux system with qtile as the window manager. It operates by searching through Ardour project files (`*.ardour`) within a designated directory, sorting them by their modification time to offer the most recently modified project files for selection. 

**Core Functions:**

- `search_cmd()`: Uses `fd` to find Ardour files and presents them with timestamps in a color-coded and human-readable format.
- `strip_ansi()`: Removes ANSI color codes from text.
- `get_path()`: Constructs a full path for the selected file, stripping ANSI codes for accuracy.
- `preview_cmd()`: Uses `bat` for a color-highlighted preview of the selected Ardour file’s XML content.

Finally, it employs `improved-fzfmenu.sh` to facilitate a menu-driven selection of the desired Ardour file and opens it with Ardour for editing or playback.

### Usage

Run the script by executing the following command in your terminal:

```bash
bash /home/matias/.scripts/ardour-open.sh
```

You can also bind this script to a key combination in your qtile configuration for quick access. Upon execution, a list of `.ardour` files, sorted by modification time, is presented. Navigate through them using the selection menu and confirm your choice to open it in Ardour.

---

> [!TIP]
> Consider removing the commented-out code section or fully integrating it following a decision to switch to `dmenu` based implementation. Moreover, ensure that the `improved-fzfmenu.sh` script is accessible and compatible. Adding error handling in case no file is selected would improve user experience by preventing unintended behavior.