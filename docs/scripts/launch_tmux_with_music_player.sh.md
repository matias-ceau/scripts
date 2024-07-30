
---

A script to create a new tmux session for the cmus music player.

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

- `tmux`: Terminal multiplexer required for session management.
- `cmus`: Console music player that will run within the tmux session.

<a name="description" />

### Description

<a name="overview" />

#### Overview

This script automates the process of starting a new `tmux` session dedicated to the cmus music player. By running this script, users can have a tmux session named "MUSIC" with a window running cmus, allowing them to listen to music without needing to launch a separate terminal.

The script utilizes `tmux`'s ability to create a new session in the background (`-d`) and immediately starts cmus within that session. This setup is particularly useful for users who prefer working in a terminal environment and want easy access to music playback controls without cluttering their workspace with multiple terminal windows.

---

<a name="usage" />

#### Usage

To use this script, simply run it from your terminal. You can execute it as follows:

```bash
bash /home/matias/.scripts/launch_tmux_with_music_player.sh
```

Alternatively, you can assign it to a keybinding in your window manager (Qtile) for quicker access.

<a name="examples" />

#### Examples

To launch cmus in a tmux session named "MUSIC", use the command:

```bash
bash /home/matias/.scripts/launch_tmux_with_music_player.sh
```

You can then attach to the tmux session using:

```bash
tmux attach -t MUSIC
```

---

<a name="notes" />

### Notes

- Ensure that both `tmux` and `cmus` are installed on your system before running the script.
- To detach from the tmux session, you can use the shortcut `Ctrl + b`, followed by `d`.
- To close the session when done, simply exit cmus or type `exit` in the tmux command line.

> **Critique:** 
> - Consider adding checks to ensure `tmux` and `cmus` are installed before attempting to start them, improving the script's robustness. 
> - Implementing a mechanism to notify the user if the session already exists could prevent confusion.
> - The script could be extended to allow for command-line arguments, enabling users to specify the session name or player options dynamically. 
