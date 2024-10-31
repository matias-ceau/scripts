# Ardour Session Opener

---

**ardour-open.sh**: Opens the most recently modified Ardour session with a preview option through `fzf`.

---

### Dependencies

- `bash`: The script is implemented as a Bash script.
- `fd`: Used to search for files with the `.ardour` extension.
- `xargs`: Utilized to format the file paths.
- `stat`: Extracts modification time of files.
- `sed`: For text manipulation to format paths and output.
- `improved-fzfmenu.sh`: A custom script that acts as an input selector using `fzf`.
- `bat`: A code highlighter used to display XML contents with proper syntax highlighting.
- `ardour`: The audio workstation opened by the script.

### Description

This script aids in managing Ardour sessions by offering a way to open the most recently modified `.ardour` file within a certain directory hierarchy. It utilizes `fd` to find `.ardour` files within the `AUDIO_PROJECTS` directory, lists them by modification time using `stat`, sorts them with `sort`, and formats the output with `sed`. The use of ANSI color codes enhances readability in the terminal as it shows navigational paths in distinct colors.

The script employs a custom `improved-fzfmenu.sh` for interactive selection, allowing the user to preview the session file's XML structure through `bat` before opening it with Ardour. This ensures that users have a clear and colorful view of their session metadata during selection, enhancing the usability of this script especially within terminal environments.

### Usage

To use the script, make sure all dependencies are installed and the necessary environment variables are set, specifically `AUDIO_PROJECTS`, which should point to your Ardour project directory:

```bash
export AUDIO_PROJECTS="$HOME/audio/PROJECTS"
```

Run the script from the terminal:

```bash
~/.scripts/bin/ardour-open.sh
```

This will produce a list of sessions in the terminal where you can use the interactive menu to select and preview the session you want to open. The selected session will then open with Ardour.

---

> [!NOTE]
> The script requires the `improved-fzfmenu.sh`, which wasn't detailed or included. Ensure this script is available in your path. Additionally, improving error handling and ensuring paths are not assumed could make the script more robust. Allow customization for users with different directory configurations or on systems other than Arch Linux.