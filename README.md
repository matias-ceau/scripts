# Scripts

## Description

<!-- llm_generated_output_start -->

The repository contains a collection of versatile scripts tailored for use in an Arch Linux environment with the Qtile window manager. These scripts serve a wide range of functionalities, from automating mundane tasks to enhancing productivity for developers, musicians, and general users alike. Below are some categories and notable capabilities of the scripts included in this repository:

- **File and Directory Management**:
  Scripts like [fix-markdown-links.sh](docs/scripts/fix-markdown-links.md) help maintain and fix common issues in Markdown files, while utilities like [get_repos_present_on_host.sh](docs/scripts/get_repos_present_on_host.md) easily list local Git repositories, allowing for efficient project management.

- **Music and Audio Control**:
  For music enthusiasts, there are several scripts designed to integrate with the `cmus` audio player. For instance, [playlist_player.xsh](docs/scripts/playlist_player.xsh) lets users quickly select and play an album, while [fzf_albumlauncher.xsh](docs/scripts/fzf_albumlauncher.xsh) provides a fuzzy-finding interface to easily navigate through available albums.

- **Documentation Generation**:
  Scripts like [llm-script-describer.py](docs/scripts/llm-script-describer.md) and [chatgpt-all-scripts-describer.py](docs/scripts/chatgpt-all-scripts-describer.md) use AI to automatically generate Markdown documentation for user scripts, ensuring that all scripts are well-documented and easy to understand.

- **Wallpaper Management**:
  The repository includes tools like [random_wallpapers.xsh](docs/scripts/random_wallpapers.xsh) that automatically pick a random wallpaper from a specified folder, enhancing the desktop experience with minimal effort.

- **Tmux and Terminal Utilities**:
  A variety of scripts facilitate terminal-based improvements, including [tmux-help.py](docs/scripts/tmux-help.py), which assists users in navigating tmux commands. The [terminal_with_command.sh](docs/scripts/terminal_with_command.sh) script opens floating terminal windows for executing commands and viewing output without cluttering the workspace.

- **Configuration and Setup Automation**:
  Scripts such as [install_dependencies.sh](docs/scripts/install_dependencies.md) automate the installation of essential packages for development and productivity, making it easy to set up a new environment, while [chezmoi_on_a_new_system.sh](docs/scripts/chezmoi_on_a_new_system.md) simplifies the configuration of dotfiles across different systems.

- **Image and Format Processing**:
  Utilities like [create_cover_art.sh](docs/scripts/create_cover_art.md) convert audio spectrograms into visual representations for album cover art, proving useful for content creators.

Overall, this repository offers a comprehensive toolkit for Arch Linux users who wish to optimize their workflow and manage their systems or audio files more efficiently. Whether you're a developer, an audio enthusiast, or simply looking to enhance your desktop experience, these scripts provide valuable solutions catered to your needs.

<!-- llm_generated_output_end -->

*Note: This section was entirely generated with gpt-4o-mini*

## [Index](docs/index.md)

<!-- table_start -->

| File | Description |
| --- | --- |
| [albumplayer.xsh](docs/scripts/albumplayer.xsh.md) | Play a random album selection with cmus using dmenu |
| [ardour-open.sh](docs/scripts/ardour-open.sh.md) | A script to quickly find and open Ardour audio projects. |
| [chatgpt-all-scripts-describer.py](docs/scripts/chatgpt-all-scripts-describer.py.md) | Automatic documentation generator for user scripts using OpenAI API. |
| [chezmoi_on_a_new_system.sh](docs/scripts/chezmoi_on_a_new_system.sh.md) | Script to initialize Chezmoi on a new system for a specific user |
| [citeboard.sh](docs/scripts/citeboard.sh.md) | A script to find and handle paper citations easily. |
| [colormap_from_text.sh](docs/scripts/colormap_from_text.sh.md) | Script to extract color palettes from text files |
| [command_prompt.sh](docs/scripts/command_prompt.sh.md) | Launch a command with history suggestions using fzf. |
| [count_tokens_with_tiktoken.py](docs/scripts/count_tokens_with_tiktoken.py.md) | A Python script to count the number of tokens in a text file using tiktoken |
| [create_cover_art.sh](docs/scripts/create_cover_art.sh.md) | A script to generate cover art from WAV file spectrograms |
| [dmenu_run_scripts.py](docs/scripts/dmenu_run_scripts.py.md) | A Python script to dynamically run scripts using rofi as a dmenu alternative. |
| [dmenu_run_scripts.xsh](docs/scripts/dmenu_run_scripts.xsh.md) | A script to run user scripts via dmenu or rofi. |
| [edit_chezmoi_cfg_files.sh](docs/scripts/edit_chezmoi_cfg_files.sh.md) | A script to browse and edit Chezmoi-managed configuration files. |
| [editor.sh](docs/scripts/editor.sh.md) | Quickly edit files using `fzf` to find them across specified directories. |
| [fix-markdown-links.sh](docs/scripts/fix-markdown-links.sh.md) | A script to fix relative links in Markdown files. |
| [flexoki_show.sh](docs/scripts/flexoki_show.sh.md) | Generate a color palette with hex, RGB values, and names for quick reference. |
| [fzf_albumlauncher.xsh](docs/scripts/fzf_albumlauncher.xsh.md) | Choose and play an album using fzf and cmus |
| [fzf_songlauncher.sh](docs/scripts/fzf_songlauncher.sh.md) | Play a song with cmus using fzf to choose the file. |
| [fzfmenu.sh](docs/scripts/fzfmenu.sh.md) | Launches fzf in an xterm window using provided arguments. |
| [fzfmenu_run.sh](docs/scripts/fzfmenu_run.sh.md) | A script to replace Dmenu with fzf for enhanced run functionality. |
| [get_repos_present_on_host.sh](docs/scripts/get_repos_present_on_host.sh.md) | Script to list git repositories on the local host and save to files. |
| [git_clone_by_author-repo.sh](docs/scripts/git_clone_by_author-repo.sh.md) | A script to clone git repositories based on developer/package name using various options. |
| [grub-tune-to-audio-python.py](docs/scripts/grub-tune-to-audio-python.py.md) | Converts GRUB_INIT_TUNE strings into audio files. |
| [improved-fzfmenu.sh](docs/scripts/improved-fzfmenu.sh.md) | A script to enhance fzf interface in Alacritty terminal, with output piping option. |
| [install_dependencies.sh](docs/scripts/install_dependencies.sh.md) | Installs essential development and productivity tools on Arch Linux |
| [jupyter_new_notebook.xsh](docs/scripts/jupyter_new_notebook.xsh.md) | A script to create and open a new Jupyter notebook in Chromium |
| [keyboard-help.sh](docs/scripts/keyboard-help.sh.md) | Launches a terminal displaying the current keyboard layout. |
| [launch_tmux_with_music_player.sh](docs/scripts/launch_tmux_with_music_player.sh.md) | Script to create a tmux session for running cmus |
| [list_process.sh](docs/scripts/list_process.sh.md) | Script to list all running services on the system in sorted order. |
| [llama-all-scripts-describer.py](docs/scripts/llama-all-scripts-describer.py.md) | Automates script documentation generation using Llama 3.1 |
| [llm-script-describer.py](docs/scripts/llm-script-describer.py.md) | Generates markdown documentation for user scripts using GPT-4. |
| [m3u_creator.sh](docs/scripts/m3u_creator.sh.md) | Generate an M3U playlist file from the current directory files. |
| [mechen_music_transfert.py](docs/scripts/mechen_music_transfert.py.md) | Custom script to copy music to Mechen |
| [megacmd_launch_tmux.sh](docs/scripts/megacmd_launch_tmux.sh.md) | Launches the MEGA command line interface in a new tmux session. |
| [megaignore_editor.sh](docs/scripts/megaignore_editor.sh.md) | A bash script for editing and managing .megaignore files interactively |
| [midi2arch.xsh](docs/scripts/midi2arch.xsh.md) | A script to transform a MIDI controller into a keyboard/script launcher |
| [new_script_creator.sh](docs/scripts/new_script_creator.sh.md) | A simple script to create new scripts with directory linking |
| [next_album.xsh](docs/scripts/next_album.xsh.md) | Skip to the next album in CMUS audio player |
| [nvim_in_new_terminal.sh](docs/scripts/nvim_in_new_terminal.sh.md) | Opens a floating terminal to edit a file with nvim |
| [obsidian-vault-selector.sh](docs/scripts/obsidian-vault-selector.sh.md) | Script to select and open an Obsidian vault from a directory. |
| [obsidian.xsh](docs/scripts/obsidian.xsh.md) | Open any Obsidian vault from a user-defined directory |
| [pdfopener.sh](docs/scripts/pdfopener.sh.md) | A script to pick and open a PDF file using Evince |
| [playlist_player.xsh](docs/scripts/playlist_player.xsh.md) | A script for selecting and playing playlists in cmus with dmenu. |
| [playlist_randomizer.xsh](docs/scripts/playlist_randomizer.xsh.md) | Randomly selects and plays a playlist of albums in cmus. |
| [ppm-color-reducer](docs/scripts/ppm-color-reducer.md) | A tool to reduce color depth in PPM images based on a given palette. |
| [quick-pass.sh](docs/scripts/quick-pass.sh.md) | Quickly select a password from your password store using fzf. |
| [random_album.xsh](docs/scripts/random_album.xsh.md) | Select random album and play it with cmus |
| [random_wallpapers.xsh](docs/scripts/random_wallpapers.xsh.md) | Pick a random wallpaper from a specified folder. |
| [read_the_fucking_manual.sh](docs/scripts/read_the_fucking_manual.sh.md) | A script to display the most researched manual entries based on history. |
| [sandisk_music_transfert.py](docs/scripts/sandisk_music_transfert.py.md) | Python script to transfer music to a Sandisk media player from a local library. |
| [script_launcher.sh](docs/scripts/script_launcher.sh.md) | Run scripts with fzf for a streamlined execution and documentation preview. |
| [select_script](docs/scripts/select_script.md) | A C script for selecting and executing a script from a cached list. |
| [setting-up-syncs.sh](docs/scripts/setting-up-syncs.sh.md) | Automates syncing of user directories to a backup location. |
| [shell_history_info.sh](docs/scripts/shell_history_info.sh.md) | Analyze and retrieve the most frequent entries in shell history |
| [show_keyboard_layout.py](docs/scripts/show_keyboard_layout.py.md) | Displays a formatted representation of the keyboard layout. |
| [songlauncher.sh](docs/scripts/songlauncher.sh.md) | Play a song with cmus using dmenu |
| [sync-repo.sh](docs/scripts/sync-repo.sh.md) | A script to sync a local git repository with its remote counterpart. |
| [terminal_with_command.sh](docs/scripts/terminal_with_command.sh.md) | Opens a floating terminal to run a command and see the output. |
| [tmux-help.py](docs/scripts/tmux-help.py.md) | tmux-help.py - A script providing helpful utilities and search capabilities for tmux commands. |
| [toggle_picom.sh](docs/scripts/toggle_picom.sh.md) | Script to toggle the Picom compositor on and off. |
| [transform_symlink.sh](docs/scripts/transform_symlink.sh.md) | Convert symlinks to copies of their target files or directories. |
| [update_env.xsh](docs/scripts/update_env.xsh.md) | update_env.xsh - Update .env file with API keys from xonsh environment |
| [utils_update_symlinks.sh](docs/scripts/utils_update_symlinks.sh.md) | Create and maintain symbolic links in ~/.local/bin. |
| [vimwiki.sh](docs/scripts/vimwiki.sh.md) | Open a note in vim using fzf for quick selection. |
| [vox.py](docs/scripts/vox.py.md) | A Python script to list and describe Vox amp options in a formatted manner. |
| [wallpaper.sh](docs/scripts/wallpaper.sh.md) | Automatically change wallpapers from a specified collection. |
| [you_are_not_documented.sh](docs/scripts/you_are_not_documented.sh.md) | A script that finds scripts without inline documentation |

<!-- table_end -->
