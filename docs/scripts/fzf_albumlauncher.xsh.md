# FZF Album Launcher

---

**[fzf_albumlauncher.xsh](fzf_albumlauncher.xsh)**: Choose and play an album using fzf and cmus

---

### Dependencies

- `beet`: A tool to manage your music collection, extracting album titles.
- `fzf`: A command-line fuzzy finder to select albums interactively.
- `cmus`: A small and fast music player that supports various formats.

### Description

The **FZF Album Launcher** script utilizes `beet`, `fzf`, and `cmus` to make selecting and playing albums from a music library intuitive and efficient. Upon execution, it lists the available albums, allowing the user to interactively select one with `fzf`. Once an album is selected, the script interacts with `cmus` to update the queue and play the chosen album.

Here's an overview of the key operations performed by the script:

- The script pulls a list of albums using `beet ls -a` and processes this using `sed` to format the output.
- With the user’s input via `fzf`, it constructs a query for `cmus` to narrow down the selection to the chosen album.
- It clears the current queue and loads the newly selected album, preparing it for playback.
- Lastly, it saves the current queue state to a temporary `.m3u` file.

### Usage

To use the FZF Album Launcher, simply execute the script from the terminal:

```bash
$ ./fzf_albumlauncher.xsh
```

This will trigger the album selection process. Here’s a step-by-step breakdown of the interactions:

1. The script fetches the album list and passes it to `fzf`.
2. Once you make a selection:
   - The script clears the current queue in `cmus`.
   - It applies the selected album as a filter within the `cmus` interface.
   - The selected album gets marked and added to the queue for playback.
3. Finally, it informs `cmus` to play the queued songs.

Make sure to customize the paths or configuration based on your environment if necessary.

---

> [!TIP]  
> Consider implementing error handling for cases where `beet ls -a` returns no results, and ensure that `cmus` is running before attempting to execute commands. Additionally, adding option flags or arguments to customize the behavior or output paths could enhance the script's usability.
