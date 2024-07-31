# Launch Tmux with Music Player (launch_tmux_with_music_player.sh)

---

A script to start a new tmux session for cmus music player.

---

### Table of contents

- [Dependencies](#dependencies)
- [Description](#description)
    - [Overview](#overview)
    - [Usage](#usage)
    - [Examples](#examples)
- [Notes](#notes)

---

<a name="dependencies" />

### Dependencies

- `tmux`: Terminal multiplexer.
- `cmus`: Console-based music player.

<a name="description" />

### Description

<a name="overview" />

#### Overview

This script creates a new detached `tmux` session specifically for the `cmus` music player. It allows users to manage music playback in a dedicated terminal session without needing to interactively open a terminal window. By using `tmux`, multiple terminal sessions can run simultaneously, making it efficient for users who multitask.

The script utilizes the command:

```bash
tmux new-session -d -s MUSIC -n cmus 'cmus'
```

Here's a breakdown of the command:

- `tmux new-session`: Initiates a new tmux session.
- `-d`: Starts the session in detached mode (it runs in the background).
- `-s MUSIC`: Names the session "MUSIC".
- `-n cmus`: Names the window within the session "cmus".
- `'cmus'`: Executes the cmus player within this session.

---

<a name="usage" />

#### Usage

To use this script, ensure that it has executable permissions and is located in your desired path:

1. Make the script executable:
   ```bash
   chmod +x /home/matias/.scripts/launch_tmux_with_music_player.sh
   ```

2. Run the script from the terminal:
   ```bash
   /home/matias/.scripts/launch_tmux_with_music_player.sh
   ```

You can also bind the script to a keyboard shortcut in your window manager (qtile) for quick access.

<a name="examples" />

#### Examples

- Start a new tmux session for cmus:
  ```bash
  /home/matias/.scripts/launch_tmux_with_music_player.sh
  ```

After executing, you can attach to the session by running:
```bash
tmux attach-session -t MUSIC
```

---

<a name="notes" />

### Notes

- Ensure you have `tmux` and `cmus` installed on your Arch Linux system for the script to function correctly.
- This script is ideal for users who want to keep their music player running in a separate, manageable session.

> **Critique:** 
> The script is straightforward and effectively achieves its purpose; however, it lacks error handling. Consider adding checks to ensure `tmux` and `cmus` are both installed before attempting to run them, which can enhance user experience by providing meaningful feedback if dependencies are missing. Additionally, you might want to include a feature that can check if the session already exists to avoid creating multiple sessions with similar names.