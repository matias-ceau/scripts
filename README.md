# Scripts

## Description

<!-- llm_generated_output_start -->

> **Script Collection Overview**
> 
> This repository is a comprehensive toolbox of utility scripts tailored for a highly customized Arch Linux environment, optimized for use under the **qtile** window manager. It spans a wide range of tasks—workflow automation, system management, creative coding, and personal productivity—many of which are deeply integrated into keyboard-centric and TUI-based workflows ideal for advanced Linux desktop users.

**Key Domains & Workflow Philosophy:**
- **Interactive Launchers:** Many scripts use `fzf`, `dmenu`, or `rofi` as a user interface for quickly launching applications, scripts, or files. These are usually run in floating or dedicated terminals (like `alacritty` or `xterm`), often with rich preview support (`bat`, `eza`, `kitty icat`, `pastel`, etc.).
- **File, Script, and Repo Management:** Tools are available for navigating, searching, and editing files or scripts using powerful fuzzy-pickers or TUI menus, often keyed to your `$SCRIPTS` directory. Git workflows are tightly integrated, with multiple scripts automating everything from batch repository syncs and conflict-handling to AI-powered commit message generation.
- **Music & Media Workflows:** The collection offers sophisticated music playback controls and playlist management for `cmus`, quick spectral/cover art generation, as well as tools to randomize, select, or transfer music to various devices. Rapid wallpaper and PDF selection, and file preview utilities supplement daily creative tasks.
- **Knowledge & Note Management:** Integration with note systems (`obsidian`, Markdown note graphs, vimwiki), rapid visual browsing of vaults, and visualization of hyperlink relations reinforce the personal PKM (knowledge management) workflow.
- **System/Device Utilities:** There are scripts for interacting with devices (MIDI controllers, MEGA sync, FTP mounts), terminal-based spectrograms, systemd process overviews, as well as symlink and locate-db maintenance scripts for lightning-fast file/access throughout the system.
- **Automation & Doc Generation:** Utility scripts leverage AI/LLM models (OpenAI, Llama) to automate documentation generation and code summarization for all scripts in the repo, as well as provide Markdown/index updates for documentation hygiene and onboarding.
- **Theming & Color Tools:** Several scripts extract, visualize, and manipulate color palettes (ANSI, Flexoki, arbitrary hex), aiding in theme customization for terminals, editors, and status bars.
- **Personalization & Host-Specific Automation:** Many scripts are parameterized for per-host behavior, autostart routines, and device-specific cloud syncing or directory layouts. Where applicable, scripts use environment variables (e.g., `$SCRIPTS`, `$GIT_REPOS`, `$LOCALDATA`) to adapt to your personal configs.
- **Integration with qtile:** All scripts are designed to be seamlessly invoked as qtile keybindings, embedded into qtile autostart or quick-launch menus, and fit natural keyboard-driven window management. Scripts include samples for integration and tips for robust binding.

**Common Practices & Patterns:**
- Emphasis on **terminal UIs**: Nearly everything can run within a terminal, often in a floating/centered window for minimal disruption.
- **Extensive use of modern CLI tools**: Tools like `fd`, `rg`, `bat`, `eza`, `fzf`, `chezmoi`, `paru`, `tmux`, and the Python CLI ecosystem are “first-class citizens.”
- **Interactive error handling and dynamic previews** (file selection, git operations, syncing, etc.) aid in rapid, confident operations.
- **Parameterized and modular design**: Scripts expose arguments or flags for modes (interactive, embedded, dry-run, config), enabling their reuse and chaining.
- **Documentation & code health**: Doc-generation tools keep README, per-script docs, and indices up to date, leveraging AI where appropriate.

> **Note:**
> 
> While each utility generally works standalone, this collection truly shines when used as an integrated system, exploiting the power of qtile, Arch, and the Linux CLI ecosystem to boost productivity, orchestrate creative and development tasks, and keep personal infrastructure elegant and maintainable.

**Typical Use-Cases:**
- Fuzzy-search and launch applications/scripts, with rich previews.
- Instantly jump to, edit, or manage dotfiles, scripts, or configuration via `fzf`/`dmenu`.
- Automate music playback, playlists, device sync/transfers.
- Maintain rapid, reliable git workflows with robust error/conflict handling.
- Preview, manage, and document scripts and their relationships—with auto-generated documentation, graphs, and dependency insight.
- Sync and manage bookmarks, quickmarks, vaults, and knowledge base content.
- Integrate terminal utilities and custom workflows into a keyboard-first, distraction-free desktop environment.

*In summary: this is a power-user’s collection of scripts, purpose-built for a personalized Arch/qtile Linux desktop, offering seamless, scriptable control over files, configuration, repositories, media, and knowledge—all orchestrated from the terminal and tightly bound to your preferred WM and workflow.*

<!-- llm_generated_output_end -->

*Note: This section was entirely generated with gpt-4o-mini*

## [Index](docs/index.md)

<!-- table_start -->

| File | Description |
| --- | --- |
| [albumplayer.xsh](docs/scripts/albumplayer.xsh.md) | Selects and plays a full album (with extras queued) via cmus and dmenu |
| [ansi-cheatsheet.sh](docs/scripts/ansi-cheatsheet.sh.md) | Quickly displays a cheatsheet of ANSI escape codes in a syntax-highlighted view |
| [ansi8bit2rgb_hex.py](docs/scripts/ansi8bit2rgb_hex.py.md) | Converts 8-bit ANSI color codes to RGB or HEX representations with optional colorized output and names |
| [ardour-open.sh](docs/scripts/ardour-open.sh.md) | Interactive picker for Ardour sessions with formatted preview and recent-first sort |
| [citeboard.sh](docs/scripts/citeboard.sh.md) | Find academic references by citation key, copy their identifier, or open associated PDFs. |
| [closest_colors.py](docs/scripts/closest_colors.py.md) | Find the closest matching terminal color for a list of color hex codes. |
| [color_restrict.py](docs/scripts/color_restrict.py.md) | Restricts image colors to those in a custom palette with optional resizing. |
| [colormap_from_text.sh](docs/scripts/colormap_from_text.sh.md) | Extracts and displays unique color codes from text or config files in various formats |
| [command_prompt.sh](docs/scripts/command_prompt.sh.md) | Launches a command prompt with shell history suggestions using fuzzy search |
| [count_tokens_with_tiktoken.py](docs/scripts/count_tokens_with_tiktoken.py.md) | Count token usage for a text file or stdin using OpenAI `tiktoken`. |
| [create_cover_art.sh](docs/scripts/create_cover_art.sh.md) | generates a cover image by creating a spectrogram from a selected `.wav` file. |
| [desk_fzf.sh](docs/scripts/desk_fzf.sh.md) | Quickly search and launch `.desktop` applications using `fzf` and a cached file listing. |
| [dmenu_run_scripts.py](docs/scripts/dmenu_run_scripts.py.md) | Presents a list of runnable scripts via `rofi` integrated with xonsh for selection and execution. |
| [edit_chezmoi_cfg_files.sh](docs/scripts/edit_chezmoi_cfg_files.sh.md) | Fuzzy-find and edit dotfiles managed by chezmoi, with preview and optional sync/apply. |
| [editor.sh](docs/scripts/editor.sh.md) | Quickly edit files using fzf, with smart search modes and exclusions. |
| [flexoki_show.sh](docs/scripts/flexoki_show.sh.md) | Script to visually display the Flexoki color palette and roles in your terminal |
| [ftp-data-mount.sh](docs/scripts/ftp-data-mount.sh.md) | Mounts a remote DATA folder from Mega via FTP to /mnt/ftp/DATA |
| [fzf-file-manager.sh](docs/scripts/fzf-file-manager.sh.md) | Interactive terminal-based file manager leveraging `fzf` and `eza` for rapid navigation. |
| [fzf_albumlauncher.xsh](docs/scripts/fzf_albumlauncher.xsh.md) | Quickly search for and play an album in cmus using fzf and beets. |
| [fzf_songlauncher.sh](docs/scripts/fzf_songlauncher.sh.md) | Quickly choose and play a song with `cmus` using `fzf` fuzzy finder |
| [fzfmenu.sh](docs/scripts/fzfmenu.sh.md) | Helper script that runs `fzf` inside an `alacritty` terminal instance. |
| [fzfmenu_cache.sh](docs/scripts/fzfmenu_cache.sh.md) | Caches and lists executables in PATH instantaneously for fzfmenu launcher |
| [fzfmenu_run.sh](docs/scripts/fzfmenu_run.sh.md) | Launches app selection using fzf in a floating terminal, as a `dmenu_run` replacement. |
| [fzfpreview.sh](docs/scripts/fzfpreview.sh.md) | Display file or image contents in fzf preview window using various tools and fallback logic |
| [generate_commit_message.py](docs/scripts/generate_commit_message.py.md) | Generate an AI-powered git commit message from staged changes. |
| [get-windows.sh](docs/scripts/get-windows.sh.md) | Outputs information about currently open windows in qtile (ID, group, name, wm_class) |
| [get_hyperlinks_in_folder.py](docs/scripts/get_hyperlinks_in_folder.py.md) | Scans a folder of markdown notes and builds a hyperlink graph visualization. |
| [get_repos_present_on_host.sh](docs/scripts/get_repos_present_on_host.sh.md) | List and register two-level git repos present under `$GIT_REPOS` for this host. |
| [get_scripts_relations.py](docs/scripts/get_scripts_relations.py.md) | Scans user scripts to detect and visualize script dependencies. |
| [get_scripts_relations.xsh](docs/scripts/get_scripts_relations.xsh.md) | Scans `$SCRIPTS` directory for scripts and visualizes intra-folder dependencies as a directed graph |
| [git_cd.sh](docs/scripts/git_cd.sh.md) | Quickly `cd` to any git project directory found on the system using a fuzzy search. |
| [git_clone_by_author-repo.sh](docs/scripts/git_clone_by_author-repo.sh.md) | Clone a GitHub repository via SSH, HTTPS, or from a local path with developer-oriented subfolder convention. |
| [git_update_all_other_repos.sh](docs/scripts/git_update_all_other_repos.sh.md) | Batch-pulls all git repositories (with HTTPS remote) at exact depth 3 under `$GIT_REPOS` |
| [grub-tune-to-audio-python.py](docs/scripts/grub-tune-to-audio-python.py.md) | Converts a GRUB_INIT_TUNE string into an MP3 audio file |
| [gsi.sh](docs/scripts/gsi.sh.md) | Interactive, robust script for syncing a local Git repository with its remote, handling merges, conflicts, and summary display. |
| [help-pastel.sh](docs/scripts/help-pastel.sh.md) | Enhanced interactive subcommand and help browser for `pastel` CLI. |
| [help_pwcli.sh](docs/scripts/help_pwcli.sh.md) | Interactive helper for PipeWire CLI tools, displays per-command help with preview. |
| [html_viewer.py](docs/scripts/html_viewer.py.md) | Simple graphical viewer for local HTML and Markdown, with folder browsing. |
| [improved-fzfmenu.sh](docs/scripts/improved-fzfmenu.sh.md) | Launches an `fzf` session in an Alacritty floating terminal; flexible output piping. |
| [install_dependencies.sh](docs/scripts/install_dependencies.sh.md) | Bash script to bulk-install essential terminal and desktop utilities. |
| [interactive_git_sync.sh](docs/scripts/interactive_git_sync.sh.md) | Interactive script for syncing multiple git repositories with `fzf` selection. |
| [json_to_markdown.py](docs/scripts/json_to_markdown.py.md) | Converts a simple JSON file (list of dicts with "role" and "content") to a styled Markdown file. |
| [jupyter_new_notebook.xsh](docs/scripts/jupyter_new_notebook.xsh.md) | Quickly create and open a blank Jupyter notebook in Chromium via dmenu. |
| [keyboard-help.sh](docs/scripts/keyboard-help.sh.md) | Displays keyboard layout help in a floating terminal with syntax highlighting |
| [launch_tmux_with_music_player.sh](docs/scripts/launch_tmux_with_music_player.sh.md) | Creates a headless `tmux` session named "MUSIC" and starts the `cmus` music player within. |
| [list-openai-models.sh](docs/scripts/list-openai-models.sh.md) | Lists and caches available OpenAI API models with creation dates |
| [list_process.sh](docs/scripts/list_process.sh.md) | Lists all systemd services, showing their statuses sorted by type |
| [llama-all-scripts-describer.py](docs/scripts/llama-all-scripts-describer.py.md) | Automated Github-style markdown documentation for scripts using Llama 3.1 |
| [llm-script-describer.py](docs/scripts/llm-script-describer.py.md) | Automates documentation generation for user scripts using OpenAI's LLMs |
| [m3u_creator.sh](docs/scripts/m3u_creator.sh.md) | Quickly generate an m3u playlist file from all files in the current directory |
| [mechen_music_transfert.py](docs/scripts/mechen_music_transfert.py.md) | Syncs a subset of unlistened music albums to the MECHEN MP3 player, fitting within a max size. |
| [megacmd_launch_tmux.sh](docs/scripts/megacmd_launch_tmux.sh.md) | Launches `mega-cmd` inside a new detached tmux session. |
| [megaignore_editor.sh](docs/scripts/megaignore_editor.sh.md) | Fuzzy finder interface for searching, editing, and deleting `.megaignore` files. |
| [megasync.sh](docs/scripts/megasync.sh.md) | Launches MEGAsync with specific environment variables set for Qtile/Arch environments |
| [midi2arch.xsh](docs/scripts/midi2arch.xsh.md) | Transform a MIDI controller into a script/keyboard command launcher for Arch |
| [midi2cmd.py](docs/scripts/midi2cmd.py.md) | Manage and monitor MIDI controller input and test connections from the terminal |
| [minimal-browser.py](docs/scripts/minimal-browser.py.md) | Minimal local HTML viewer using PyQt6/QWebEngine, for local docs or apps |
| [minimal_gpt_call.py](docs/scripts/minimal_gpt_call.py.md) | Simple script to interact with OpenAI GPT-4o-mini for CSV sample generation. |
| [new_script_creator.sh](docs/scripts/new_script_creator.sh.md) | Quickly create or adapt user scripts with templating and permissions in `$SCRIPTS/bin`. |
| [next_album.xsh](docs/scripts/next_album.xsh.md) | Skips playback to the first track of the next album in cmus. |
| [nvim_in_new_terminal.sh](docs/scripts/nvim_in_new_terminal.sh.md) | Open a file in `nvim` inside a floating Alacritty terminal window |
| [nvpn-tui-help.sh](docs/scripts/nvpn-tui-help.sh.md) | Interactive terminal UI for navigating nordvpn (or other CLI programs) commands and help. |
| [obsidian-vault-selector.sh](docs/scripts/obsidian-vault-selector.sh.md) | Select and open an Obsidian vault from all available vaults using an interactive fuzzy finder. |
| [obsidian.xsh](docs/scripts/obsidian.xsh.md) | Quickly select and open an Obsidian vault via a fuzzy menu |
| [old-ousse](docs/scripts/old-ousse.md) | Generates a collection of custom mlocate databases for various areas of your filesystem |
| [open_url_in_instance.sh](docs/scripts/open_url_in_instance.sh.md) | Open a URL in an already running qutebrowser session, or start a new one if needed |
| [openwebui-launcher.sh](docs/scripts/openwebui-launcher.sh.md) | Bash script to launch Open WebUI and open it in a minimal browser. |
| [ousse-locate.sh](docs/scripts/ousse-locate.sh.md) | Experimental script for managing and searching local `.db` databases with preview support. |
| [ousse-update.sh](docs/scripts/ousse-update.sh.md) | Custom script to update various `mlocate` databases with personal folder scopes. |
| [pacman-fuzzy-search.sh](docs/scripts/pacman-fuzzy-search.sh.md) | Fuzzy search and install Arch Linux packages (repo/AUR) using paru and fzf |
| [pdfopener.sh](docs/scripts/pdfopener.sh.md) | Pick and open any PDF file in your home directory with evince (or fallback). |
| [playlist_player.xsh](docs/scripts/playlist_player.xsh.md) | Select and play a saved `.m3u` playlist in cmus via dmenu |
| [playlist_randomizer.xsh](docs/scripts/playlist_randomizer.xsh.md) | Picks a playlist of albums and plays them in random album order with cmus |
| [ppm-color-reducer](docs/scripts/ppm-color-reducer.md) | Reduce colors in a P6 PPM image to a user-defined palette |
| [pyman.sh](docs/scripts/pyman.sh.md) | Interactive fuzzy finder for Python topics, keywords, builtins, and installed modules/packages. |
| [qtile_dice_group.py](docs/scripts/qtile_dice_group.py.md) | Instantly switches to the workspace ("group") with a number summing to 7 with the current one. |
| [qtile_window_to_group_and_switch.py](docs/scripts/qtile_window_to_group_and_switch.py.md) | Moves the current focused window to the next or previous qtile group and switches focus to that group |
| [quick-pass.sh](docs/scripts/quick-pass.sh.md) | Fuzzy-find and copy your pass(1) passwords using `fzf` with one-click paste/edit support. |
| [qutebrowser-modify-source-bookmarks.sh](docs/scripts/qutebrowser-modify-source-bookmarks.sh.md) | Synchronizes qutebrowser bookmarks, quickmarks, and sessions with chezmoi dotfiles. |
| [random_album.xsh](docs/scripts/random_album.xsh.md) | Selects 10 random albums from your cmus library and plays them. |
| [random_wallpapers.xsh](docs/scripts/random_wallpapers.xsh.md) | Script to set a random wallpaper from the `~/.wallpapers` directory. |
| [read_the_fucking_manual.sh](docs/scripts/read_the_fucking_manual.sh.md) | Query and analyze your `man`/`batman` usage history for most searched entries. |
| [rgfzf.sh](docs/scripts/rgfzf.sh.md) | Search for text using ripgrep + fuzzy finder, preview with bat, open in neovim. |
| [sandisk_music_transfert.py](docs/scripts/sandisk_music_transfert.py.md) | Transfers unplayed albums from your music library to your Sandisk media player, automatically fitting them to available space. |
| [screenshot.sh](docs/scripts/screenshot.sh.md) | Simple utility for taking fullscreen or user-selected screenshots using `grim`. |
| [script.sh](docs/scripts/script.sh.md) | Launches `fzf` in an `xterm` window and types the selected entry using `xdotool`. |
| [script_launcher.sh](docs/scripts/script_launcher.sh.md) | Fuzzy-find and launch scripts with enhanced previews and editing options |
| [select_script](docs/scripts/select_script.md) | Interactively select and execute a script from cached metadata using Rofi |
| [send_email.py](docs/scripts/send_email.py.md) | Script to send an email from the command line with argparse and `smtplib` |
| [setting-up-syncs.sh](docs/scripts/setting-up-syncs.sh.md) | Automates MEGA cloud syncs for key folders and differentiates setup by host. |
| [shell_history_info.sh](docs/scripts/shell_history_info.sh.md) | Analyze and summarize the most frequent lines, words, or characters in your shell command history files. |
| [show-all-qutebrowser-scripts.sh](docs/scripts/show-all-qutebrowser-scripts.sh.md) | Display the content of Qutebrowser's bundled scripts using `bat` for preview |
| [show_keyboard_layout.py](docs/scripts/show_keyboard_layout.py.md) | Prints a custom visual keyboard layout to the terminal for reference. |
| [snekai.sh](docs/scripts/snekai.sh.md) | Utility for launching Jupyter Lab, Jupyter Notebook, or IPython from a dedicated Python virtual environment |
| [songlauncher.sh](docs/scripts/songlauncher.sh.md) | Quickly search and play music files via dmenu and cmus |
| [speach-to-text.py](docs/scripts/speach-to-text.py.md) | Python script for recording audio via a selected device and transcribing it to text using OpenAI Whisper. |
| [ssh-fzf.sh](docs/scripts/ssh-fzf.sh.md) | Fuzzy-find and execute ssh commands from `pass` using `fzf`. |
| [sync-repo-simple.py](docs/scripts/sync-repo-simple.py.md) | Automates syncing a git repository, handling conflicts, stashing, and summary output. |
| [sync-repo-simple.sh](docs/scripts/sync-repo-simple.sh.md) | Automates the process of syncing a local git repository with its remote, including smart error handling and conflict resolution. |
| [sync-repo.py](docs/scripts/sync-repo.py.md) | Python utility for automating git repository synchronization with rich terminal UI, local/remote conflict handling, and progress feedback. |
| [sync-repo.sh](docs/scripts/sync-repo.sh.md) | Synchronize a local git repository with its remote, handling stashes, conflicts, and pretty output |
| [terminal_with_command.sh](docs/scripts/terminal_with_command.sh.md) | Opens a floating Alacritty terminal to execute a given command, showing output and staying open. |
| [text_spectrogram.py](docs/scripts/text_spectrogram.py.md) | Live real-time text-based spectrogram using microphone input and ANSI colors. |
| [tmux_manager.py](docs/scripts/tmux_manager.py.md) | Python utility to manage named tmux sessions using a YAML configuration file |
| [tmux_session.sh](docs/scripts/tmux_session.sh.md) | Minimal script to launch a detached tmux session with a specified window and command |
| [toggle_picom.sh](docs/scripts/toggle_picom.sh.md) | Simple script to toggle the Picom compositor on and off with notifications. |
| [transform_symlink.sh](docs/scripts/transform_symlink.sh.md) | Convert symlinks into copies of their targets (both files and directories). |
| [try_the_bat_suit.sh](docs/scripts/try_the_bat_suit.sh.md) | Fuzzy-finds and previews files with syntax highlighting in terminal using `bat` and `fzf`. |
| [tui-gpt.py](docs/scripts/tui-gpt.py.md) | Interactive TUI chat application for GPT models themed as "Mother" from Aliens. |
| [ugc-python.py](docs/scripts/ugc-python.py.md) | Extracts and lists movie titles from HTML input piped via stdin. |
| [update_birthdays.sh](docs/scripts/update_birthdays.sh.md) | Extracts and records the creation date ("birthday") of all files in your scripts directory using git history. |
| [update_env.xsh](docs/scripts/update_env.xsh.md) | Extracts current environment API keys and writes them to a `.env` file. |
| [utils_update_symlinks.sh](docs/scripts/utils_update_symlinks.sh.md) | maintain and update symlinks for `$SCRIPTS` into `~/.local/bin`, logging actions and cleaning obsolete links |
| [utopia.sh](docs/scripts/utopia.sh.md) | Download selected Utopia Bordeaux film pages to HTML files |
| [vimwiki.sh](docs/scripts/vimwiki.sh.md) | Fuzzy search and open Markdown notes in Vim from your notes directory. |
| [vox.py](docs/scripts/vox.py.md) | Command-line utility to list and describe Vox amp modeling options |
| [wallpaper.sh](docs/scripts/wallpaper.sh.md) | Randomly select, set, or browse wallpapers using feh and optional GUIs. |
| [wrapper.sh](docs/scripts/wrapper.sh.md) | Wraps execution of any command, logs invocation with timestamp. |
| [xephyr.sh](docs/scripts/xephyr.sh.md) | Launches a nested X session with Xephyr, running a development Qtile instance. |
| [you_are_not_documented.sh](docs/scripts/you_are_not_documented.sh.md) | Finds scripts lacking specific inline documentation tags |

<!-- table_end -->
