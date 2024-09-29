# Ardour Session Opener

---

**ardour-open.sh**: A script to open Ardour sessions from a user-defined directory.

---

### Dependencies

- `bash`: The default shell used to run the script.
- `fd`: A simple, fast, and user-friendly alternative to `find`.
- `xargs`: A command that builds and executes command lines from standard input.
- `stat`: Used to display file or file system status.
- `sort`: Sorts lines of text files.
- `sed`: A stream editor for filtering and transforming text.
- `bat`: A cat clone with syntax highlighting and Git integration.
- `fzf`: A command-line fuzzy finder allowing you to open file selections interactively.

### Description

This script provides a quick way to open Ardour project sessions located in a designated directory (`$HOME/audio/PROJECTS`). It utilizes several Unix utilities to search for `.ardour` files, display them in a visually organized manner, and allow the user to select one for opening in Ardour.

1. **File Search**: The script leverages `fd` to find all `.ardour` files in the specified project directory and retrieves their modification times. The results are sorted in descending order.
   
2. **Visual Display**: The paths are formatted with ANSI escape codes for colored output, making it easier to navigate the session list when using a terminal.

3. **Session Preview**: Utilizes `bat` for a preview of the selected Ardour file, offering an enhanced viewing experience before opening the session.

4. **Session Launch**: The selected Ardour session is opened using the `ardour` command at the end of the script.

### Usage

To execute the script, you will typically run it from your terminal. Here’s a short summary of how to use it:

```bash
bash /home/matias/.scripts/ardour-open.sh
```

Upon execution, you will see a list of your Ardour project sessions. You can navigate through this list using the arrow keys (when utilizing `fzf`) and hit Enter to select and open the desired session.

Alternatively, this script can be bound to a key in your window manager (like qtile) to make it more accessible.

---

> [!IMPORTANT]
> This script assumes that the `$AUDIO_PROJECTS` directory is correctly set and contains Ardour sessions. Ensure `fzf` and `bat` are installed for the best experience. It is also advisable to handle situations where no `*.ardour` files are found, as this could lead to errors. Adding error checking and informative messages could improve user experience.