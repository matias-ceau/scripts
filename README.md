# Scripts

## Description

<!-- llm_generated_output_start -->

This repository is a personal **Arch Linux / qtile–oriented toolbox**: lots of small, composable scripts that turn common desktop and CLI tasks into fast, keyboard-driven actions. The overall style is “build tiny primitives, then wire them into keybindings”, using either **dmenu/rofi** for minimal GUI prompts or **fzf** inside a dedicated terminal (often floated via WM_CLASS/title conventions). Many scripts are deliberately non-interactive beyond the picker step, making them ideal for qtile `lazy.spawn(...)`.

A big theme is **menu-driven launchers** and “command palettes” for *your own* ecosystem: scripts to enumerate executables, cache candidates, preview sources/docs, and then run/attach/edit quickly. This includes wrappers that preserve stdin/stdout across spawned terminals (so pickers can behave like `dmenu` in pipelines) and helpers that standardize previews via `bat`, directory trees via `eza`, and consistent colors (Flexoki).

There’s also a strong **workflow automation** angle:
- **dotfiles / chezmoi** helpers to quickly find, edit, apply, and sync configuration changes
- **git maintenance** utilities ranging from single-repo “safe sync” flows to bulk updates and per-host repo inventories
- “meta” tooling that keeps the repo maintainable (symlink inventory, doc generation, relation graphs)

For desktop ergonomics, you have several **qtile-specific utilities** (window/group introspection and actions), plus convenience scripts for wallpapers, screenshots, compositor toggles, performance profiles, and lightweight viewers (Markdown/HTML). Audio is another pillar: cmus/beets playlist/album launchers, simple playlist generators, and a few media/DAW helpers.

The codebase mixes **bash**, **python**, **xonsh**, and a few small compiled tools (C). Python scripts often use `uv` shebangs for reproducible deps, while shell scripts lean on the Arch “power user” stack (`fd`, `rg`, `fzf`, `bat`, `eza`, `systemd-run`, notifications).

Key building blocks worth knowing because many scripts revolve around them:
- a modular environment loader: [env.sh](docs/scripts/env.sh.md)
- a robust floating picker wrapper: [improved-fzfmenu.sh](docs/scripts/improved-fzfmenu.sh.md)
- a central symlink/index workflow for `$SCRIPTS/bin` and `~/.local/bin` (docs + metadata kept in sync)

Overall: it’s a cohesive, keyboard-first personal “OS layer” on top of Arch + qtile, optimized for speed, previewability, and reuse.

<!-- llm_generated_output_end -->

*Note: This section was entirely generated with gpt-4o-mini*

## [Index](docs/index.md)

<!-- table_start -->

| File | Description |
| --- | --- |
| [_megaCMD-download_1.sh](docs/scripts/_megaCMD-download_1.sh.md) | Downloads MEGAcmd Arch package and installs it via pacman |
| [albumplayer.xsh](docs/scripts/albumplayer.xsh.md) | Build a temp playlist from a chosen album and play it in cmus |
| [ansi-cheatsheet.sh](docs/scripts/ansi-cheatsheet.sh.md) | Render a quick ANSI escape codes cheatsheet with syntax highlighting |
| [ansi8bit2rgb_hex.py](docs/scripts/ansi8bit2rgb_hex.py.md) | Convert ANSI 256-color codes to RGB or HEX (with optional preview) |
| [ardour-open.sh](docs/scripts/ardour-open.sh.md) | Pick a recent Ardour session from ~/audio/PROJECTS and open it |
| [birdcage.sh](docs/scripts/birdcage.sh.md) | Run a command in a private Firejail cage with a domain-whitelisted HTTP(S) proxy |
| [build_and_link.sh](docs/scripts/build_and_link.sh.md) | Build a C/C++/Python app into `$SCRIPTS/bin` and symlink it locally |
| [citeboard.sh](docs/scripts/citeboard.sh.md) | Select a BibTeX citation key, then open the PDF or copy the key |
| [closest_colors.py](docs/scripts/closest_colors.py.md) | Find closest palette colors to a list of target hex colors |
| [color_restrict.py](docs/scripts/color_restrict.py.md) | Reduce an image to a fixed RGB palette by nearest-color matching |
| [colormap_from_text.sh](docs/scripts/colormap_from_text.sh.md) | Extract unique hex colors from text and print as RGB/hex (optionally previewed) |
| [command_prompt.sh](docs/scripts/command_prompt.sh.md) | Pick a past command from shell history via fzf and output it |
| [count_tokens_with_tiktoken.py](docs/scripts/count_tokens_with_tiktoken.py.md) | Count tokens for a text using tiktoken and an OpenAI model encoding |
| [create_cover_art.sh](docs/scripts/create_cover_art.sh.md) | Create a cover art image from a `.wav` spectrogram |
| [desk_fzf.sh](docs/scripts/desk_fzf.sh.md) | Search and launch installed apps by selecting a .desktop file via fzf |
| [dmenu_run_scripts.py](docs/scripts/dmenu_run_scripts.py.md) | Rofi-based launcher for your “active” scripts using xonsh metadata |
| [edit_chezmoi_cfg_files.sh](docs/scripts/edit_chezmoi_cfg_files.sh.md) | Fuzzy-pick chezmoi-managed files/dirs, edit them, then optionally apply/sync |
| [editor.sh](docs/scripts/editor.sh.md) | Fuzzy-find files with `fd`/`fzf` and open them in `nvim` (optionally sudo) |
| [env.sh](docs/scripts/env.sh.md) | Modular environment loader for your scripts (paths, colors, fzf, git) |
| [flexoki_show.sh](docs/scripts/flexoki_show.sh.md) | Print a Flexoki color reference table with ANSI truecolor swatches |
| [ftp-data-mount.sh](docs/scripts/ftp-data-mount.sh.md) | Mounts the MEGA “DATA” FTP endpoint into `/mnt/ftp/DATA` |
| [fzf-file-manager.sh](docs/scripts/fzf-file-manager.sh.md) | FZF-based interactive file browser with rich previews (eza/bat/kitty) |
| [fzf_albumlauncher.xsh](docs/scripts/fzf_albumlauncher.xsh.md) | Pick a beets album via fzf and enqueue it in cmus |
| [fzf_songlauncher.sh](docs/scripts/fzf_songlauncher.sh.md) | Pick a music file with fzf and play it in cmus |
| [fzfmenu.sh](docs/scripts/fzfmenu.sh.md) | Launches `fzf` in an Alacritty window, acting like a terminal dmenu helper |
| [fzfmenu_cache.sh](docs/scripts/fzfmenu_cache.sh.md) | Build and maintain a cached list of executables found in `$PATH` |
| [fzfmenu_run.sh](docs/scripts/fzfmenu_run.sh.md) | Pick a command with fzf and run it via systemd-run (user scope) |
| [fzfpreview.sh](docs/scripts/fzfpreview.sh.md) | FZF preview script for text, binaries, and images (kitty/chafa/imgcat) |
| [generate_commit_message.py](docs/scripts/generate_commit_message.py.md) | Generate a commit message from the staged diff (LLM or fallback) |
| [get-windows.sh](docs/scripts/get-windows.sh.md) | Print Qtile windows as TSV (id, group, name, wm_class) |
| [get_hyperlinks_in_folder.py](docs/scripts/get_hyperlinks_in_folder.py.md) | Scan a folder of markdown notes for `[[wiki links]]` and build a graph |
| [get_repos_present_on_host.sh](docs/scripts/get_repos_present_on_host.sh.md) | Scan `$GIT_REPOS` and record repos present on this machine |
| [get_scripts_relations.py](docs/scripts/get_scripts_relations.py.md) | Build and visualize a directed graph of script cross-references |
| [get_scripts_relations.xsh](docs/scripts/get_scripts_relations.xsh.md) | Build and display a dependency graph between scripts under `$SCRIPTS` |
| [git_cd.sh](docs/scripts/git_cd.sh.md) | Fuzzy-pick a git repo directory from `locate` and print its path |
| [git_clone_by_author-repo.sh](docs/scripts/git_clone_by_author-repo.sh.md) | Clone a GitHub repo into `$GIT_REPOS/<author>/<repo>` with ssh/https/local |
| [git_update_all_other_repos.sh](docs/scripts/git_update_all_other_repos.sh.md) | Bulk `git pull` for repos under `$GIT_REPOS` and report successes/errors |
| [grub-tune-to-audio-python.py](docs/scripts/grub-tune-to-audio-python.py.md) | Convert a GRUB_INIT_TUNE string into an MP3 audio file |
| [gsi.sh](docs/scripts/gsi.sh.md) | fetch, fast-forward/rebase, auto-commit, push (optional dry-run) |
| [help-pastel.sh](docs/scripts/help-pastel.sh.md) | Interactive `pastel` help browser with `fzf` + previews |
| [help_pwcli.sh](docs/scripts/help_pwcli.sh.md) | Browse PipeWire CLI tools and preview their `-h` help in fzf |
| [html_viewer.py](docs/scripts/html_viewer.py.md) | PyQt6 viewer for HTML/Markdown/text with folder index + wiki links |
| [hyprlaunch.sh](docs/scripts/hyprlaunch.sh.md) | Launch Hyprland from a TTY with clean Wayland/systemd-user env handling |
| [improved-fzfmenu.sh](docs/scripts/improved-fzfmenu.sh.md) | Launches `fzf` in a floating foot terminal, optionally piping output |
| [install_dependencies.sh](docs/scripts/install_dependencies.sh.md) | Install a base set of Arch packages via paru (AUR helper) |
| [interactive_git_sync.sh](docs/scripts/interactive_git_sync.sh.md) | Pick a repo via fzf and run your sync-repo.sh on it |
| [json_to_markdown.py](docs/scripts/json_to_markdown.py.md) | Convert a chat-like JSON array into a simple Markdown transcript |
| [jupyter_new_notebook.xsh](docs/scripts/jupyter_new_notebook.xsh.md) | Create an empty Jupyter notebook in ~/projects and open it in Chromium |
| [keyboard-help.sh](docs/scripts/keyboard-help.sh.md) | Open a floating xterm showing your current keyboard layout |
| [launch_tmux_with_music_player.sh](docs/scripts/launch_tmux_with_music_player.sh.md) | Create a detached tmux session and start `cmus` in it |
| [list-openai-models.sh](docs/scripts/list-openai-models.sh.md) | List OpenAI models with creation dates, cached for 24h in TSV |
| [list_process.sh](docs/scripts/list_process.sh.md) | List systemd services (all states) sorted by unit file state |
| [llama-all-scripts-describer.py](docs/scripts/llama-all-scripts-describer.py.md) | Generate per-script markdown docs from your symlink CSV using Ollama |
| [llm-script-describer.py](docs/scripts/llm-script-describer.py.md) | Auto-generate per-script docs + README summary from your $SCRIPTS repo |
| [m3u_creator.sh](docs/scripts/m3u_creator.sh.md) | Create an .m3u playlist from all entries in the current directory |
| [mechen_music_transfert.py](docs/scripts/mechen_music_transfert.py.md) | Sync a random selection of unlistened albums to the MECHEN player |
| [megacmd_launch_tmux.sh](docs/scripts/megacmd_launch_tmux.sh.md) | Start `mega-cmd` in a dedicated detached tmux session |
| [megaignore_editor.sh](docs/scripts/megaignore_editor.sh.md) | Find, preview, edit or delete `.megaignore` files interactively |
| [megasync.sh](docs/scripts/megasync.sh.md) | Launches `megasync` with env vars to avoid Qt theme/desktop issues |
| [midi2arch.xsh](docs/scripts/midi2arch.xsh.md) | Map nanoKONTROL2 MIDI CC events to shell commands on Arch Linux |
| [midi2cmd.py](docs/scripts/midi2cmd.py.md) | List/test/monitor ALSA MIDI controllers and print messages (raw/parsed) |
| [minimal-browser.py](docs/scripts/minimal-browser.py.md) | Minimal PyQt6 WebEngine viewer for local HTML/docs (or any URL) |
| [minimal_gpt_call.py](docs/scripts/minimal_gpt_call.py.md) | Tiny Python script that calls OpenAI chat completions and prints the response |
| [new_script_creator.sh](docs/scripts/new_script_creator.sh.md) | Quickly create or import scripts into `$SCRIPTS/bin` with templates |
| [next_album.xsh](docs/scripts/next_album.xsh.md) | Skip to the next album in cmus by advancing tracks until album changes |
| [nvim_in_new_terminal.sh](docs/scripts/nvim_in_new_terminal.sh.md) | Open a floating Alacritty terminal running Neovim for a given file |
| [nvpn-tui-help.sh](docs/scripts/nvpn-tui-help.sh.md) | Browse CLI subcommands and help via fzf using shell completions |
| [obsidian-vault-selector.sh](docs/scripts/obsidian-vault-selector.sh.md) | Interactive picker to open any Obsidian vault from your config |
| [obsidian.xsh](docs/scripts/obsidian.xsh.md) | Pick an Obsidian vault from `$HOME/PKM` and open it via URI |
| [old-ousse](docs/scripts/old-ousse.md) | Generate multiple `locate` databases for different filesystem scopes |
| [ollama-list.sh](docs/scripts/ollama-list.sh.md) | Fetch and format Ollama library models with a 7-day local cache |
| [open_url_in_instance.sh](docs/scripts/open_url_in_instance.sh.md) | Send a URL to qutebrowser via IPC, or start qutebrowser if needed |
| [openwebui-launcher.sh](docs/scripts/openwebui-launcher.sh.md) | Start Open WebUI in tmux, wait until ready, then open in browser |
| [openwebui_serve.sh](docs/scripts/openwebui_serve.sh.md) | Launch Open WebUI via uvx with data stored in XDG data directory |
| [ousse-locate.sh](docs/scripts/ousse-locate.sh.md) | Inspect `.local/share/ousse` DB files (size/age) and list entries |
| [ousse-update.sh](docs/scripts/ousse-update.sh.md) | Build multiple `updatedb` databases for different filesystem scopes |
| [pacman-fuzzy-search.sh](docs/scripts/pacman-fuzzy-search.sh.md) | Fuzzy-find Arch packages (repo/AUR) with previews and install on enter |
| [pdfopener.sh](docs/scripts/pdfopener.sh.md) | Pick a PDF from `$HOME` and open it (Evince fallback) |
| [playlist_player.xsh](docs/scripts/playlist_player.xsh.md) | Pick a playlist from `~/.playlists` and play it in cmus |
| [playlist_randomizer.xsh](docs/scripts/playlist_randomizer.xsh.md) | Pick a playlist and play albums in randomized order via cmus |
| [ppm-color-reducer](docs/scripts/ppm-color-reducer.md) | Reduce a P6 PPM image to the nearest colors from a given palette |
| [pyman.sh](docs/scripts/pyman.sh.md) | Interactive pydoc/fzf browser for Python topics, keywords, builtins and libs |
| [qdrant_local.py](docs/scripts/qdrant_local.py.md) | Start a local Qdrant Docker container with persistent storage and ports |
| [qtile_dice_group.py](docs/scripts/qtile_dice_group.py.md) | Switch to the complementary group (dice sum to 7) in Qtile |
| [qtile_window_to_group_and_switch.py](docs/scripts/qtile_window_to_group_and_switch.py.md) | Move focused window to adjacent qtile group and switch to it |
| [quick-pass.sh](docs/scripts/quick-pass.sh.md) | Fuzzy-pick a pass entry and type it via ydotool |
| [qutebrowser-modify-source-bookmarks.sh](docs/scripts/qutebrowser-modify-source-bookmarks.sh.md) | Mirror qutebrowser bookmarks/quickmarks and sessions into your chezmoi source |
| [random_album.xsh](docs/scripts/random_album.xsh.md) | Build a random-albums playlist from cmus library and start playback |
| [random_wallpapers.xsh](docs/scripts/random_wallpapers.xsh.md) | Pick a random wallpaper from `~/.wallpapers` and set it |
| [read_the_fucking_manual.sh](docs/scripts/read_the_fucking_manual.sh.md) | Show your most searched man/batman pages from shell history |
| [rgfzf.sh](docs/scripts/rgfzf.sh.md) | Fuzzy-search ripgrep matches, preview with bat, open in Neovim at line |
| [sandisk_music_transfert.py](docs/scripts/sandisk_music_transfert.py.md) | Randomly select unlistened albums and sync them to a Sandisk player |
| [screenshot.sh](docs/scripts/screenshot.sh.md) | Take a screenshot with Grim, optionally selecting an area |
| [script.sh](docs/scripts/script.sh.md) | Run `fzf` in xterm and type the selection into the focused window |
| [script_launcher.sh](docs/scripts/script_launcher.sh.md) | Interactive launcher for `$SCRIPTS` entries with fzf + previews |
| [select_script](docs/scripts/select_script.md) | Rofi-based picker to execute a script from a cached CSV description list |
| [send_email.py](docs/scripts/send_email.py.md) | Send a plaintext email via Gmail SMTP using a password from `pass` |
| [setting-up-syncs.sh](docs/scripts/setting-up-syncs.sh.md) | Register Mega sync pairs for XDG folders and host-specific storage |
| [shell_history_info.sh](docs/scripts/shell_history_info.sh.md) | Show most frequent lines/words/chars/options in your shell history |
| [show-all-qutebrowser-scripts.sh](docs/scripts/show-all-qutebrowser-scripts.sh.md) | Display qutebrowser’s installed script files with syntax highlighting |
| [show_keyboard_layout.py](docs/scripts/show_keyboard_layout.py.md) | Print a preformatted keyboard layout map to stdout |
| [snekai.sh](docs/scripts/snekai.sh.md) | Launch Jupyter Lab/Notebook/IPython from the `snekai` virtualenv |
| [songlauncher.sh](docs/scripts/songlauncher.sh.md) | Pick a track via dmenu and play it in cmus |
| [speach-to-text.py](docs/scripts/speach-to-text.py.md) | Record audio from a chosen device and transcribe it with OpenAI Whisper |
| [ssh-fzf.sh](docs/scripts/ssh-fzf.sh.md) | Pick an SSH command from pass via fzf and execute it in a login shell |
| [sync-repo-simple.py](docs/scripts/sync-repo-simple.py.md) | pull/rebase safely, auto-commit local changes, then push |
| [sync-repo-simple.sh](docs/scripts/sync-repo-simple.sh.md) | Sync a git repo with remote, stashing local changes and auto-committing |
| [sync-repo.py](docs/scripts/sync-repo.py.md) | Sync a git repo with interactive conflict handling and rich output |
| [sync-repo.sh](docs/scripts/sync-repo.sh.md) | fetch, rebase/ff, stash, auto-commit, push, pretty output |
| [terminal_with_command.sh](docs/scripts/terminal_with_command.sh.md) | Open a floating Alacritty terminal, run a command, then stay open |
| [test-env.sh](docs/scripts/test-env.sh.md) | Quick sanity checks for `env.sh` minimal and feature-specific loads |
| [text_spectrogram.py](docs/scripts/text_spectrogram.py.md) | Live terminal spectrogram from microphone input with adjustable gain |
| [tmux_manager.py](docs/scripts/tmux_manager.py.md) | Manage and launch tmux sessions/windows from a YAML config |
| [tmux_session.sh](docs/scripts/tmux_session.sh.md) | Create a detached tmux session/window and run a command inside |
| [toggle-performance.sh](docs/scripts/toggle-performance.sh.md) | Toggle between tuned balanced and throughput-performance CPU profiles |
| [toggle_picom.sh](docs/scripts/toggle_picom.sh.md) | Toggle `picom` compositor on/off with desktop notifications |
| [transform_symlink.sh](docs/scripts/transform_symlink.sh.md) | Turn symlinks into copies of their targets (file or directory) |
| [try_the_bat_suit.sh](docs/scripts/try_the_bat_suit.sh.md) | Pick a file and preview it with `bat` using a chosen syntax language |
| [tui-gpt.py](docs/scripts/tui-gpt.py.md) | Textual-based TUI chat client streaming responses from OpenAI |
| [ugc-python.py](docs/scripts/ugc-python.py.md) | Extracts and numbers movie titles from UGC-like HTML read from stdin |
| [update_birthdays.sh](docs/scripts/update_birthdays.sh.md) | Rebuilds `bdays.csv` with each script’s “birth date” from git history |
| [update_env.xsh](docs/scripts/update_env.xsh.md) | Writes `*_API_KEY` environment vars into `~/.env` |
| [utils_update_symlinks.sh](docs/scripts/utils_update_symlinks.sh.md) | Sync executable symlinks from `$SCRIPTS` into `~/.local/bin` and log results |
| [utopia.sh](docs/scripts/utopia.sh.md) | Download Utopia Bordeaux film pages for a fixed list of film IDs |
| [vimwiki.sh](docs/scripts/vimwiki.sh.md) | Pick a Markdown note with fzf and open it in Neovim |
| [vox.py](docs/scripts/vox.py.md) | Print and filter a Vox amp-model option table from the terminal |
| [wallpaper.sh](docs/scripts/wallpaper.sh.md) | Set wallpapers (random/select/gui) and keep a history for “previous” |
| [wrapper.sh](docs/scripts/wrapper.sh.md) | Runs a command, then logs it with a timestamp to a fixed log file |
| [xephyr.sh](docs/scripts/xephyr.sh.md) | Launch Qtile in Xephyr with a terminal for safe config testing |
| [you_are_not_documented.sh](docs/scripts/you_are_not_documented.sh.md) | #` documentation marker |

<!-- table_end -->
