# Improved FZF launcher (Alacritty, pipe-aware)

---

**improved-fzfmenu.sh**: Launch fzf in Alacritty with optional piping and preserved stdio

---

### Dependencies

- `alacritty` – terminal emulator used to host fzf
- `fzf` – fuzzy finder
- `systemd-run` – spawn the terminal in a user scope
- `bash` – script shell
- `qtile` (optional) – window rules can target the class `floating`
- `bat` (optional) – pretty previews in examples

### Description

This script opens an fzf session inside Alacritty with a predictable window class and title, suitable for qtile floating rules. It preserves the caller’s STDIN and, optionally, STDOUT across the terminal boundary using /proc file descriptors:

- Reads from caller input: fzf ... < /proc/$$/fd/0
- Writes back to caller output when --pipe is set: > /proc/$$/fd/1

Arguments not recognized by the wrapper are safely shell-escaped and forwarded to fzf. Two wrapper options are handled:

- --pipe: send selection back to the caller’s stdout
- --terminal-title=TITLE: set the Alacritty window title (default: i_fzfmenu)

The terminal class is fixed to floating, making it easy to match in qtile.

The command is started via systemd-run --user --scope for clean resource handling and isolation, then exec’d to replace the wrapper process.

### Usage

Basic (input via pipe, view result in the Alacritty window):
```
printf "apple\nbanana\ncherry\n" | ~/.scripts/bin/improved-fzfmenu.sh
```

Return the selection to your shell (--pipe):
```
printf "a\nb\nc\n" | ~/.scripts/bin/improved-fzfmenu.sh --pipe
```

Chain the result:
```
rg -n "" | ~/.scripts/bin/improved-fzfmenu.sh --pipe | cut -d: -f1 | xargs -r nvim
```

Pass fzf options (are forwarded as-is):
```
fd . ~/projects \
| ~/.scripts/bin/improved-fzfmenu.sh --pipe --terminal-title=Proj-Find \
    --preview 'bat --style=numbers --color=always {}' --ansi --height 80% -m
```

Qtile keybinding example:
```
Key([mod], "p",
    lazy.spawn("~/.scripts/bin/improved-fzfmenu.sh --pipe --reverse --height=90%")
)
```

---

> [!TIP]
> - Hardcoded terminal/class: add flags like --term=kitty and --class=… to match diverse rules.
> - Relying on /proc/$$/fd works locally; it may fail across user boundaries (sudo) or sandboxing.
> - Without --pipe, selections won’t reach the parent shell; document this prominently or default to --pipe when stdout is a pipe.
> - systemd-run overhead: consider --collect or properties to auto-clean transient scopes.
> - If no STDIN is provided, fzf reads from the parent TTY path; clarify expected input (usually via a pipe).