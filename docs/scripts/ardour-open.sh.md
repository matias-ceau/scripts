# Open Ardour Session Script

---

**ardour-open.sh**: Script to search and open Ardour session files.

---

### Dependencies

- `fd`: A simple, fast and user-friendly alternative to `find`, used to search for `.ardour` files.
- `bat`: A cat clone with syntax highlighting and Git integration, used for previewing session files.
- `fzf`: A command-line fuzzy finder that allows interactive searching.
- `improved-fzfmenu.sh`: A custom script that enhances the fzf functionality and integrates with this script.

### Description

This script allows users to open Ardour session files with ease by providing a search functionality through their audio projects directory. It leverages several powerful command-line utilities to enhance the user experience. 

1. **Searching for Session Files**: The function `search_cmd` uses `fd` to find `.ardour` files in the specified `AUDIO_PROJECTS` directory, retrieves their last modification times, and formats the output with ANSI colors for better visual distinction. 
   
2. **Previewing Files**: The `preview_cmd` function utilizes `bat` for a concise preview of the selected session file before opening it in Ardour. 

3. **User Interaction**: The script uses `improved-fzfmenu.sh` to provide an interactive menu for the user to select the session they want to open. 

### Usage

To use this script, simply execute it from your terminal:

```bash
bash /home/matias/.scripts/ardour-open.sh
```

You will be presented with an interactive list of your Ardour session files, sorted by modification time. You can navigate through this list using arrow keys. Press `Enter` to open the selected session in Ardour.

**Example Command:**
```bash
./ardour-open.sh
```

**Keybindings within fzf**: 
- `enter`: Open the selected session in Ardour.
- Resizing the preview window with `resize:refresh-preview`.

---

> [!TIP]
> Consider adding error handling to improve user experience. For example, check if the `AUDIO_PROJECTS` directory contains any `.ardour` files before proceeding with the search, and handle cases where dependencies like `fd`, `bat`, and `fzf` are not installed. This will make the script more robust.