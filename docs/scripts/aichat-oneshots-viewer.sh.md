# aichat oneshots viewer (fzf + preview server)

---

**aichat-oneshots-viewer.sh**: Browse aichat message blocks with fzf preview via a local netcat server

---

### Dependencies

- `bash` (uses arrays, `mapfile`, arithmetic)
- `rg` (ripgrep): finds chat headers with line numbers
- `fzf` (>= 0.38 recommended for `--listen`): interactive picker and IPC
- `nc` (netcat): simple local TCP server/client used for previews
- `bat`: renders markdown nicely (`-l md -pp`)
- `$XDG_DATA_HOME/aichat/messages.md`: expected data source file

### Description

This script turns your `messages.md` into “blocks” (one chat per header) and lets you browse them in an `fzf` UI with a live preview.

It works by starting a tiny background “block server”:

- It scans `messages.md` for header lines matching:
  - `^# CHAT: .* \[[0-9T:+-]{25}\]`
- It stores the matching line numbers in an array, plus an EOF marker (`wc -l`).
- For each incoming request (a start line number read from stdin), it finds the next header line and prints the range `start:end` using `bat` (pretty markdown output).

Then `fzf --listen 9999` starts an `fzf` instance that can receive items over a socket, and the preview command sends `{1}` (the selected item’s first field) to the local server, which returns the corresponding chat block.

### Usage

Run it from a terminal (typically launched from qtile with a keybinding into your preferred terminal):

- Start:
  
      ~/.scripts/dev/aichat-oneshots-viewer.sh

- Expected flow:
  - `fzf` opens
  - selecting an entry triggers the preview pane to show the full chat block

If you want to integrate with qtile, bind it to spawn in your terminal, e.g. (conceptually):

    terminal -e ~/.scripts/dev/aichat-oneshots-viewer.sh

---

> [!TIP]
> The current script never feeds any candidate lines into `fzf --listen 9999`, so `fzf` may open with no items unless something else is already sending data to port `9999`. Consider generating a list of chat headers (line number + title) and piping it into `fzf` directly, avoiding `--listen` entirely. Also add `set -euo pipefail`, validate that `$XDG_DATA_HOME` and the file exist, and pick a dynamic/free port (or use a UNIX socket) to avoid collisions and unintended exposure if `nc` binds beyond localhost.