# ardour-open.sh

# Open Ardour Session Script

This script offers a simple way to open an Ardour session from a predefined directory using a dmenu interface. The script allows the user to select from a list of Ardour session files (.ardour) located within the specified directory.

## Prerequisites

- **Ardour**: Make sure Ardour is installed on your system and is accessible from the command line.
- **dmenu**: Install dmenu (`sudo apt-get install dmenu` on Debian-based systems).

## Installation

1. Copy the script into a file, e.g., `open_ardour_session.sh`.
2. Make the script executable:

    ```sh
    chmod +x open_ardour_session.sh
    ```

## Usage

Run the script from the command line:

```sh
./open_ardour_session.sh
```

This will display a dmenu interface presenting a list of available Ardour session files to choose from.

## Script Overview

```sh
#! /bin/sh

# DOC@RUN@ "Open an ardour session"

session="$(find /home/matias/audio/PROJECTS | grep "\.ardour$" | sed 's/\/home\/matias\/audio\/PROJECTS//' | dmenu -i -l 30)"
ardour "/home/matias/audio/PROJECTS/$session"
```

### Script Breakdown

1. **Shebang**: The script starts with `#!/bin/sh`, which tells the system to execute the script using the Bourne shell.

2. **Documentation Line**: The line `#DOC#@RUN@ "Open an ardour session"` is a documentation comment.

3. **Find Session Files**:
    - `find /home/matias/audio/PROJECTS | grep "\.ardour$"`: This command searches for all files ending with `.ardour` within the `/home/matias/audio/PROJECTS` directory.
    - `sed 's/\/home\/matias\/audio\/PROJECTS//'`: This strips the directory path from the found files, leaving only the filenames.

4. **dmenu Interface**: The filtered list of session files is passed to `dmenu`:
    - `dmenu -i -l 30`: This displays an interactive dmenu interface with a vertical list of 30 items from which the user can select the desired session file.

5. **Open Selected Session**:
    - The selected file is stored in the `session` variable.
    - `ardour "/home/matias/audio/PROJECTS/$session"`: This command opens the selected Ardour session using Ardour.

## Note

- Make sure the `PROJECTS` directory path and user name (`matias`) in the script match your actual directory structure.
- If necessary, update the script to reflect your specific environment.