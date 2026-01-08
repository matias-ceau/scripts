# Launch tmux “MUSIC” session with cmus

---

**launch_tmux_with_music_player.sh**: Create a detached tmux session and start `cmus` in it

---

### Dependencies

- `tmux` — terminal multiplexer used to create/manage the session
- `cmus` — CLI music player started inside the tmux window

### Description

This script is a small helper to bootstrap a dedicated music tmux session in the background. It creates a new detached tmux session named `MUSIC`, with an initial window named `cmus`, and runs `cmus` as the window command.

Because the session is created with `-d` (detached), no terminal window is opened automatically—useful on Arch Linux with qtile when you want your music player always available without spawning a new terminal on startup or keypress.

What it runs:

- `tmux new-session -d` → create the session without attaching
- `-s MUSIC` → session name is `MUSIC`
- `-n cmus` → first window is named `cmus`
- `'cmus'` → command executed in that window

If the session already exists, `tmux` will error and the script will exit with a non-zero status.

### Usage

Run manually:

```sh
launch_tmux_with_music_player.sh
```

Attach to the session later:

```sh
tmux attach -t MUSIC
```

Or switch to it if you’re already inside tmux:

```sh
tmux switch-client -t MUSIC
```

Typical qtile use (example idea): bind a key to run the script once, and another key to open a terminal attached to `MUSIC`.

---

> [!TIP]
> Consider making the script idempotent: check whether the `MUSIC` session already exists (`tmux has-session -t MUSIC`) and only create it if missing. You may also want a companion “toggle/attach” script for qtile that launches the session if needed and then opens a terminal attached to it. Additionally, quoting is unnecessary for the simple `cmus` command, and you might prefer a lowercase session name for consistency, unless you intentionally use uppercase.