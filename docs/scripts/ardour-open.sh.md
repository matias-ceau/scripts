# Ardour Session Opener

---

**ardour-open.sh**: Open an Ardour session quickly with previews from audio projects.

---

### Dependencies

- `bash`: The shell interpreter used to run the script.
- `fd`: A fast and user-friendly alternative to `find` for searching files.
- `xargs`: A command that builds and executes command lines from standard input.
- `stat`: A command used to display file or file system status.
- `sort`: A command for sorting lines of text files.
- `sed`: A stream editor for filtering and transforming text.
- `bat`: A cat clone with syntax highlighting and Git integration.
- `fzf`: A general-purpose command-line fuzzy finder, used for selecting items.
- `improved-fzfmenu.sh`: A custom script to enhance fzf selection experience.

### Description

The `ardour-open.sh` script is designed to streamline the process of opening Ardour audio sessions from a specified directory containing `.ardour` files. It leverages powerful command-line tools to search, sort, and preview sessions interactively.

1. **Search Functionality**: The `search_cmd` function utilizes `fd` to locate `.ardour` files within the `AUDIO_PROJECTS` directory, sorting them by last modification date.

2. **Interactive Preview**: The `preview_cmd` function makes use of `bat` to provide a visually appealing preview of the selected session files using terminal color coding.

3. **ANSI Stripping**: The `strip_ansi` function cleans up ANSI color codes from the output, ensuring that file paths are presented cleanly to the user.

The script makes extensive use of exporting functions to be accessible within the context of the `improved-fzfmenu.sh` script, facilitating a smooth user interaction for file selection.

### Usage

To use `ardour-open.sh`, simply execute the script via the terminal:

```bash
bash /home/matias/.scripts/ardour-open.sh
```

Once executed, it will:

1. **Search for `.ardour` files**: Displays a list of available Ardour sessions sorted by their modification time.
2. **Preview files**: Allows you to preview the contents of each session before selecting one.
3. **Open Selected Session**: After making a selection, the script automatically opens the chosen Ardour session.

For better usability, consider binding this script to a key in your window manager (qtile). Here’s a sample keybinding in your `config.py`:

```python
Key([mod], "a", lazy.spawn("bash /home/matias/.scripts/ardour-open.sh")),
```

---

> [!TIP]  
> The script currently relies heavily on external dependencies like `bat` and `fzf`. Ensure these are installed and configured properly for optimal functionality. Additionally, consider adding error handling in the `search_cmd` to manage cases where no `.ardour` files are found, enhancing user experience.