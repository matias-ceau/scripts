# Scripts

## Description

<!-- llm_generated_output_start -->

This repository features a collection of utility scripts designed to streamline various tasks within an Arch Linux environment, leveraging the Qtile window manager. The scripts cover a wide range of functionalities, focusing on enhancing productivity and usability through intuitive command-line interfaces and lightweight tool integration. The repository includes scripts for file management, music playback, environment management, and more, specifically tailored for Arch Linux use.

The scripts utilize several external dependencies, promoting a rich user interaction experience:
- **Fuzzy Finder Capabilities**: Many scripts harness the power of `fzf` to provide quick, interactive selections from large lists, improving efficiency, especially in file management tasks. For example, `[fzf-file-manager.sh](docs/scripts/fzf-file-manager.sh.md)` allows users to navigate their filesystem interactively.
- **Notification Support**: Utilizing `notify-send`, several scripts provide desktop notifications for user feedback following actions, such as switching wallpaper or launching applications.
- **Customizable Environments**: Scripts like `[obsidian-vault-selector.sh](docs/scripts/obsidian-vault-selector.sh.md)` enable users to manage personal productivity tools effectively, allowing quick access to frequently used applications or files.
- **Audio Management Tools**: With scripts designed for handling music playback, such as `[albumplayer.xsh](docs/scripts/albumplayer.xsh.md)` and `[fzf_albumlauncher.xsh](docs/scripts/fzf_albumlauncher.xsh.md)`, users can efficiently select and play albums from their music library using `cmus`, a terminal-based audio player.
- **Markdown and Documentation Utilities**: Several scripts focus on transforming data into user-friendly formats, such as `[json_to_markdown.py](docs/scripts/json_to_markdown.py.md)` that converts JSON data into structured Markdown files, perfect for documentation prep.

The repository offers tools for detailed interactions with git repositories, configuration management via `chezmoi`, and even commands for visualizing data dependencies among scripts using libraries like `networkx` and `matplotlib`. The versatility offered by the various tools included not only enhances file and media management but also supports developers in maintaining organized and documented workflow processes.

To get started, users only need to have the prerequisites installed based on scripts in the repository. Each script is accompanied by user-friendly documentation detailing usage instructions, dependencies, and helpful tips for customization and improvement. By leveraging these scripts, Arch Linux and Qtile users can significantly enhance their workflow and task management, all within a lightweight and efficient command-line interface.

<!-- llm_generated_output_end -->

*Note: This section was entirely generated with gpt-4o-mini*

## [Index](docs/index.md)

<!-- table_start -->

| File | Description |
| --- | --- |
| [albumplayer.xsh](docs/scripts/albumplayer.xsh.md) | Play an album using cmus |
| [ansi-cheatsheet.sh](docs/scripts/ansi-cheatsheet.sh.md) | A script to display a comprehensive ANSI escape code cheatsheet using `bat`. |
| [ansi8bit2rgb_hex.py](docs/scripts/ansi8bit2rgb_hex.py.md) | A script to convert 8-bit ANSI color codes to RGB or HEX formats. |
| [ardour-open.sh](docs/scripts/ardour-open.sh.md) | A script to open Ardour sessions from a user-defined directory. |
| [chatgpt-all-scripts-describer.py](docs/scripts/chatgpt-all-scripts-describer.py.md) | Automates GitHub documentation generation for scripts using OpenAI. |
| [chezmoi_on_a_new_system.sh](docs/scripts/chezmoi_on_a_new_system.sh.md) | Automates Chezmoi setup on a new system for user matias-ceau. |
| [citeboard.sh](docs/scripts/citeboard.sh.md) | A script to select and manage paper citations from a local BibTeX database. |
| [closest_colors.py](docs/scripts/closest_colors.py.md) | Find and compare the closest ANSI colors based on hexadecimal input. |
| [colormap_from_text.sh](docs/scripts/colormap_from_text.sh.md) | Simple script that extracts color palettes from config files |
| [command_prompt.sh](docs/scripts/command_prompt.sh.md) | Launch a command with history suggestions |
| [count_tokens_with_tiktoken.py](docs/scripts/count_tokens_with_tiktoken.py.md) | A script to count tokens in a given text or file using Tiktoken. |
| [create_cover_art.sh](docs/scripts/create_cover_art.sh.md) | Creates cover art based on file spectrograms from WAV files. |
| [display_markdown.py](docs/scripts/display_markdown.py.md) | Displays Markdown content in a rich console panel. |
| [dmenu_run_scripts.py](docs/scripts/dmenu_run_scripts.py.md) | A script to select and run scripts using rofi with custom output formatting. |
| [edit_chezmoi_cfg_files.sh](docs/scripts/edit_chezmoi_cfg_files.sh.md) | A script for editing and applying changes to chezmoi-managed configuration files. |
| [editor.sh](docs/scripts/editor.sh.md) | A script to quickly edit files using `fzf` in a terminal. |
| [fix-markdown-links.sh](docs/scripts/fix-markdown-links.sh.md) | Fixes markdown links to be relative based on a specified base directory. |
| [flexoki_show.sh](docs/scripts/flexoki_show.sh.md) | A script to display a color palette with HEX, RGB, and names. |
| [fzf-file-manager.sh](docs/scripts/fzf-file-manager.sh.md) | A Bash script using `fzf` and `eza` for enhanced file management. |
| [fzf_albumlauncher.xsh](docs/scripts/fzf_albumlauncher.xsh.md) | Choose an album with fzf and play it with cmus. |
| [fzf_songlauncher.sh](docs/scripts/fzf_songlauncher.sh.md) | Play a song with cmus (choose it with fzf) |
| [fzfmenu.sh](docs/scripts/fzfmenu.sh.md) | A script that uses `fzf` to provide a fuzzy search interface in `xterm`. |
| [fzfmenu_run.sh](docs/scripts/fzfmenu_run.sh.md) | A script to replace DMenu with fzf for executing commands in a floating terminal. |
| [get-window-thumbnails.sh](docs/scripts/get-window-thumbnails.sh.md) | Script to capture and resize screenshots of all open windows. |
| [get_hyperlinks_in_folder.py](docs/scripts/get_hyperlinks_in_folder.py.md) | Script to extract Markdown hyperlinks in a directory and visualize them as a graph. |
| [get_repos_present_on_host.sh](docs/scripts/get_repos_present_on_host.sh.md) | Script to list git repositories in a specified directory and organize them by hostname. |
| [get_scripts_relations.py](docs/scripts/get_scripts_relations.py.md) | This script generates a visual representation of script dependencies. |
| [git_cd.sh](docs/scripts/git_cd.sh.md) | Quickly navigate to a Git repository directory using a fuzzy finder. |
| [git_clone_by_author-repo.sh](docs/scripts/git_clone_by_author-repo.sh.md) | A script to clone git repositories by specifying the developer/package format. |
| [git_update_all_other_repos.sh](docs/scripts/git_update_all_other_repos.sh.md) | A script to update all Git repositories excluding a specific one. |
| [grub-tune-to-audio-python.py](docs/scripts/grub-tune-to-audio-python.py.md) | Converts a GRUB initialization tune string to an MP3 audio file. |
| [help-pastel.sh](docs/scripts/help-pastel.sh.md) | A script to enhance the `pastel` command help display with capabilities for previewing. |
| [improved-fzfmenu.sh](docs/scripts/improved-fzfmenu.sh.md) | A script that utilizes `fzf` in an `alacritty` terminal, with output piping support. |
| [install_dependencies.sh](docs/scripts/install_dependencies.sh.md) | A script to automatically install essential dependencies on Arch Linux. |
| [json_to_markdown.py](docs/scripts/json_to_markdown.py.md) | A script to convert JSON files into Markdown format. |
| [jupyter_new_notebook.xsh](docs/scripts/jupyter_new_notebook.xsh.md) | Script to create a new Jupyter notebook and open it in Chromium. |
| [keyboard-help.sh](docs/scripts/keyboard-help.sh.md) | Launches an xterm to display the current keyboard layout. |
| [launch_tmux_with_music_player.sh](docs/scripts/launch_tmux_with_music_player.sh.md) | Script to create a new tmux session named music and launch cmus. |
| [list_process.sh](docs/scripts/list_process.sh.md) | A script to list all running services using systemd. |
| [llama-all-scripts-describer.py](docs/scripts/llama-all-scripts-describer.py.md) | Automatically generates GitHub documentation for scripts using Llama 3.1 model. |
| [llm-script-describer.py](docs/scripts/llm-script-describer.py.md) | Generates documentation for user scripts using OpenAI's API. |
| [m3u_creator.sh](docs/scripts/m3u_creator.sh.md) | Create an m3u file from files in the current directory |
| [mechen_music_transfert.py](docs/scripts/mechen_music_transfert.py.md) | Custom script to copy music to Mechen |
| [megacmd_launch_tmux.sh](docs/scripts/megacmd_launch_tmux.sh.md) | Launches a new Tmux session for MegaCMD command line interface. |
| [megaignore_editor.sh](docs/scripts/megaignore_editor.sh.md) | A script to edit `.megaignore` files using fzf and nvim. |
| [midi2arch.xsh](docs/scripts/midi2arch.xsh.md) | Transform a MIDI controller into a keyboard/script launcher |
| [new_script_creator.sh](docs/scripts/new_script_creator.sh.md) | A script to create and manage user scripts effortlessly. |
| [next_album.xsh](docs/scripts/next_album.xsh.md) | Skip to the next album in the Cmus music player. |
| [nvim_in_new_terminal.sh](docs/scripts/nvim_in_new_terminal.sh.md) | Opens a floating terminal to edit a file using nvim |
| [obsidian-vault-selector.sh](docs/scripts/obsidian-vault-selector.sh.md) | Script to open any Obsidian vault from a user-defined selection. |
| [obsidian.xsh](docs/scripts/obsidian.xsh.md) | A script to open any Obsidian vault using `fzf`. |
| [open_url_in_instance.sh](docs/scripts/open_url_in_instance.sh.md) | Launches a URL in an instance of Qutebrowser. |
| [openwebui-launcher.sh](docs/scripts/openwebui-launcher.sh.md) | A script to launch and monitor the Open Web UI service. |
| [pacman-fuzzy-search.sh](docs/scripts/pacman-fuzzy-search.sh.md) | A script for fuzzy searching Arch Linux packages with previews. |
| [pdfopener.sh](docs/scripts/pdfopener.sh.md) | A simple script to select and open PDF files from the home directory using Evince. |
| [playlist_player.xsh](docs/scripts/playlist_player.xsh.md) | Plays a selected playlist using cmus from a predefined directory. |
| [playlist_randomizer.xsh](docs/scripts/playlist_randomizer.xsh.md) | Picks a playlist of albums and plays them in random order in cmus. |
| [ppm-color-reducer](docs/scripts/ppm-color-reducer.md) | A tool to reduce colors in PPM images using a provided palette. |
| [pyman.sh](docs/scripts/pyman.sh.md) | A bash script for managing and exploring Python packages with enhanced interactivity. |
| [qtile_dice_group.py](docs/scripts/qtile_dice_group.py.md) | Switches to the complementary group in Qtile based on the current group number. |
| [qtile_window_to_group_and_switch.py](docs/scripts/qtile_window_to_group_and_switch.py.md) | A script to toggle windows to specific groups in Qtile. |
| [quick-pass.sh](docs/scripts/quick-pass.sh.md) | A script to quickly search and display password entries using fzf. |
| [qutebrowser-modify-source-bookmarks.sh](docs/scripts/qutebrowser-modify-source-bookmarks.sh.md) | Syncs local Qutebrowser bookmarks with Chezmoi-managed config files. |
| [random_album.xsh](docs/scripts/random_album.xsh.md) | Select random album and play it with cmus |
| [random_wallpapers.xsh](docs/scripts/random_wallpapers.xsh.md) | Pick random wallpaper from a predefined list of wallpapers. |
| [read_the_fucking_manual.sh](docs/scripts/read_the_fucking_manual.sh.md) | A script to check frequently searched manual entries. |
| [rgfzf.sh](docs/scripts/rgfzf.sh.md) | Search files with Ripgrep, filter with fzf, and open in Vim. |
| [sandisk_music_transfert.py](docs/scripts/sandisk_music_transfert.py.md) | A script to transfer music albums to a Sandisk media player. |
| [script_launcher.sh](docs/scripts/script_launcher.sh.md) | Simple script launcher utilizing fzf for enhanced command execution. |
| [select_script](docs/scripts/select_script.md) | C program for selecting and executing scripts based on cached information. |
| [setting-up-syncs.sh](docs/scripts/setting-up-syncs.sh.md) | A script to synchronize directories with a MEGA cloud storage backup. |
| [shell_history_info.sh](docs/scripts/shell_history_info.sh.md) | Script to extract most frequent lines, words, or characters from shell history. |
| [show-all-qutebrowser-scripts.sh](docs/scripts/show-all-qutebrowser-scripts.sh.md) | Displays all available Qutebrowser scripts with syntax highlighting. |
| [show_keyboard_layout.py](docs/scripts/show_keyboard_layout.py.md) | A simple script displaying a text representation of a keyboard layout. |
| [songlauncher.sh](docs/scripts/songlauncher.sh.md) | Play a song with cmus using dmenu |
| [speach-to-text.py](docs/scripts/speach-to-text.py.md) | A Python script that records audio and transcribes it to text using OpenAI's Whisper. |
| [sync-repo.sh](docs/scripts/sync-repo.sh.md) | A Bash script to synchronize a Git repository efficiently. |
| [terminal_with_command.sh](docs/scripts/terminal_with_command.sh.md) | Opens a floating terminal to run a command and see the output. |
| [tmux-help.py](docs/scripts/tmux-help.py.md) | A script providing helpful guidance on tmux commands. |
| [toggle_picom.sh](docs/scripts/toggle_picom.sh.md) | Script to toggle the picom compositor in Arch Linux. |
| [transform_symlink.sh](docs/scripts/transform_symlink.sh.md) | A script to convert symlinks into copies of their target files or directories. |
| [try_the_bat_suit.sh](docs/scripts/try_the_bat_suit.sh.md) | A script that utilizes `bat` and `fzf` for enhanced file previewing. |
| [tui-gpt.py](docs/scripts/tui-gpt.py.md) | A terminal-based user interface for interacting with an AI named Mother from the Aliens movies. |
| [update_env.xsh](docs/scripts/update_env.xsh.md) | A script to extract and update API keys in a .env file. |
| [utils_update_symlinks.sh](docs/scripts/utils_update_symlinks.sh.md) | Script to create and manage symlinks in ~/.local/bin. |
| [vimwiki.sh](docs/scripts/vimwiki.sh.md) | Open a note in vim using fzf for selection. |
| [vox.py](docs/scripts/vox.py.md) | A Python script to list and describe Vox amplifier options. |
| [wallpaper.sh](docs/scripts/wallpaper.sh.md) | Pick random wallpaper from wallpaper list |
| [you_are_not_documented.sh](docs/scripts/you_are_not_documented.sh.md) | A script that finds scripts without inline docs. |

<!-- table_end -->
