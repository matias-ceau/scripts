# Open Ardour Session Script

---

**ardour-open.sh**: Opens an Ardour session by searching for `.ardour` files

---

### Dependencies

- `bash`: The shell in which the script runs.
- `fd`: A simple, fast and user-friendly alternative to `find`.
- `xargs`: A command that builds and executes command lines from standard input.
- `stat`: Used to retrieve file or file system status.
- `sort`: Sorts lines of text files.
- `sed`: A stream editor for filtering and transforming text.
- `bat`: A cat clone with syntax highlighting and Git integration.
- `improved-fzfmenu.sh`: A custom FZF (fuzzy finder) menu script that enhances the user selection experience.

### Description

The `ardour-open.sh` script is designed to facilitate the process of opening an Ardour session by visually displaying available `.ardour` files within a specified audio projects directory. The script leverages various utilities to search, filter, and preview Ardour project files.

Here's a breakdown of the main functions within the script:

- **search_cmd**: This function utilizes `fd` to find all `.ardour` files within the `$AUDIO_PROJECTS` directory, retrieves their modification times and formats the output using ANSI color codes to improve readability in the FZF menu.

- **strip_ansi**: This function removes any ANSI escape codes from text to ensure clean paths are displayed.

- **get_path**: A utility function that constructs and cleans the path to the selected Ardour project file.

- **preview_cmd**: Uses `bat` to preview the content of the selected `.ardour` file, providing syntax highlighting and a structured view in the terminal.

### Usage

To use the script, simply run it in your terminal. The script conducts a search through your predefined audio project directory and presents a selectable list of `.ardour` files. You can invoke it using:

```bash
bash /home/matias/.scripts/ardour-open.sh
```

Once you run the script, a menu will appear allowing you to select a session. You can navigate the list with arrow keys, preview the content of a project using the predefined preview window, and press Enter to open the selected project in Ardour.

---

> [!TIP] 
> Consider adding error handling to manage cases where no `.ardour` files are found or if the `ardour` command fails. Additionally, ensuring that all dependencies are installed during setup will provide a smoother user experience. You could also consider making the hard-coded paths configurable through command-line arguments.