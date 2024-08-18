# Open Ardour Session

---

**ardour-open.sh**: A script to quickly find and open Ardour audio projects.

---

### Dependencies

- `bash`: The shell in which the script runs.
- `fd`: A simple, fast file search tool that is used to locate `.ardour` files.
- `stat`: A command for displaying file or file system status.
- `sed`: A stream editor for filtering and transforming text.
- `xargs`: A command that builds and executes command lines from standard input.
- `bat`: A cat(1) clone with syntax highlighting and Git integration.
- `improved-fzfmenu.sh`: An improved version of `fzf` for fuzzy finding, used for selecting files.

### Description

This script enables users to quickly locate and open Ardour session files located in a specified directory (default: `$HOME/audio/PROJECTS`). It leverages the `fd` command to find files with the `.ardour` extension, displaying the files in a user-friendly format with colors for better readability.

Key functions:
- **search_cmd**: Looks for `.ardour` files in the defined audio projects directory, sorts them by modification time, and formats the output with colored paths.
- **strip_ansi**: Removes ANSI color codes from strings.
- **get_path**: Prepares the full file path for the selected Ardour project after removing formatting.
- **preview_cmd**: Uses `bat` to provide a preview of the selected Ardour file in an improved format.

Once a file is selected through the `improved-fzfmenu.sh`, the script opens the desired Ardour project.

### Usage

To run this script, you can simply execute it from a terminal:

```bash
bash /home/matias/.scripts/ardour-open.sh
```

Upon running the script, you will be presented with a list of `.ardour` files. Navigate using the arrow keys and press `Enter` to open the selected session in Ardour.

You can also bind this script to a key in your window manager (Qtile) as follows:

```python
Key([mod], "a", lazy.spawn("/home/matias/.scripts/ardour-open.sh")),
```

This will allow you to open Ardour projects with a simple key press.

---

> [!TIP] 
> The script could be improved by adding error handling to manage scenarios where no `.ardour` files are found or the user cancels the selection. Additionally, consider adding configuration options for customizing the search path directly in the script or via environment variables. This will enhance its flexibility and usability in various user environments.