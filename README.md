# Scripts

## Description

<!-- llm_generated_output_start -->

This repository contains a diverse collection of scripts designed to enhance productivity and streamline workflows on an Arch Linux environment running the Qtile window manager. The scripts cover a wide range of functionalities, from multimedia management and dynamic document editing to automatic documentation generation and music playback. Below, we summarize key features and common dependencies that you'll encounter in the various scripts:

- **Multimedia and Music Management**: Several scripts focus on managing audio files, particularly leveraging the `cmus` music player and tools like `dmenu`, `fzf`, and `rofi`. For instance, the [albumplayer.xsh](docs/scripts/albumplayer.xsh.md) and [songlauncher.sh](docs/scripts/songlauncher.sh.md) scripts use these utilities to facilitate the selection and playback of media files seamlessly.

- **Document Handling**: Scripts like [pdfopener.sh](docs/scripts/pdfopener.sh.md) allow for easy navigation and opening of PDF files. The use of [fzf](https://github.com/junegunn/fzf) for interactive selections enhances user experience by allowing for fuzzy searching and quick access to documents.

- **Configuration Management**: Scripts such as [chezmoi_on_a_new_system.sh](docs/scripts/chezmoi_on_a_new_system.sh.md) and [edit_chezmoi_cfg_files.sh](docs/scripts/edit_chezmoi_cfg_files.sh.md) integrate with the Chezmoi tool to manage dotfiles effectively across systems, promoting a clean and organized configuration.

- **Dynamic Interaction**: Interactive scripts leverage tools like `dmenu`, `fzf` and their enhancements to provide users with an intuitive selection interface. For example, [dmenu_run_scripts.xsh](docs/scripts/dmenu_run_scripts.xsh.md) and [fzf_albumlauncher.xsh](docs/scripts/fzf_albumlauncher.xsh.md) allow users to dynamically select and run scripts or choose albums for playback.

- **Documentation Generation**: The repository includes scripts for generating documentation automatically using LLMs—like [chatgpt-all-scripts-describer.py](docs/scripts/chatgpt-all-scripts-describer.py.md) and [llm-script-describer.py](docs/scripts/llm-script-describer.py.md)—that analyze script composition and produce Markdown files, making documentation management straightforward and efficient.

**Common Dependencies**:
- **SoX, ImageMagick, and dmenu**: Used across various scripts for handling audio processing, image manipulation, and menu generation.
- **Python Packages**: Libraries like `pandas`, `beet`, and `tiktoken` are frequently employed for data manipulation, music library management, and token counting, respectively.
- **Shell Tools**: Tools such as `bash`, `fzf`, `rg`, and `pv` enhance functionality by enabling task automation and interactive user engagement.

In conclusion, this repository serves as a comprehensive toolkit tailored for users who want to leverage their scripting capabilities on Arch Linux with Qtile. Each script is equipped with dependencies that enhance its functionality, making daily tasks more efficient and enjoyable. Feel free to explore individual documentation for more in-depth usage instructions and tips to optimize these scripts according to your workflow needs.

<!-- llm_generated_output_end -->

*Note: This section was entirely generated with gpt-4o-mini*

## [Index](docs/index.md)

<!-- table_start -->

| File | Description |
| --- | --- |
| [albumplayer.xsh](docs/scripts/albumplayer.xsh.md) | Play a random album selection with cmus using dmenu |
| [ardour-open.sh](docs/scripts/ardour-open.sh.md) | A script to open Ardour sessions quickly using dmenu. |
| [chatgpt-all-scripts-describer.py](docs/scripts/chatgpt-all-scripts-describer.py.md) | Automatic documentation generator for user scripts using OpenAI API. |
| [chezmoi_on_a_new_system.sh](docs/scripts/chezmoi_on_a_new_system.sh.md) | Script to initialize Chezmoi on a new system for a specific user |
| [citeboard.sh](docs/scripts/citeboard.sh.md) | A script to find and handle paper citations easily. |
| [colormap_from_text.sh](docs/scripts/colormap_from_text.sh.md) | Extracts color palettes from config files. |
| [count_tokens_with_tiktoken.py](docs/scripts/count_tokens_with_tiktoken.py.md) | A Python script to count the number of tokens in a text file using tiktoken |
| [create_cover_art.sh](docs/scripts/create_cover_art.sh.md) | A script to generate cover art from WAV file spectrograms |
| [dmenu_run_scripts.py](docs/scripts/dmenu_run_scripts.py.md) | A Python script to dynamically run scripts using rofi as a dmenu alternative. |
| [dmenu_run_scripts.xsh](docs/scripts/dmenu_run_scripts.xsh.md) | A script to run user scripts via dmenu or rofi. |
| [edit_chezmoi_cfg_files.sh](docs/scripts/edit_chezmoi_cfg_files.sh.md) | A script to edit Chezmoi managed configuration files using fzf. |
| [editor.sh](docs/scripts/editor.sh.md) | Edit any file in current folder or subfolders (recursively) |
| [fzf_albumlauncher.xsh](docs/scripts/fzf_albumlauncher.xsh.md) | Choose and play an album using fzf and cmus |
| [fzf_songlauncher.sh](docs/scripts/fzf_songlauncher.sh.md) | Play a song with cmus using fzf to choose the file. |
| [fzfmenu.sh](docs/scripts/fzfmenu.sh.md) | A wrapper script to launch fzf in a terminal for menu selection. |
| [fzfmenu_run.sh](docs/scripts/fzfmenu_run.sh.md) | A script to replace dmenu with fzf for running commands in a floating terminal. |
| [get_repos_present_on_host.sh](docs/scripts/get_repos_present_on_host.sh.md) | Script to list git repositories on the local host and save to files. |
| [git_clone_by_author-repo.sh](docs/scripts/git_clone_by_author-repo.sh.md) | A script to clone git repositories based on developer/package name using various options. |
| [improved-fzfmenu.sh](docs/scripts/improved-fzfmenu.sh.md) | A Bash script that launches `fzf` in an Alacritty terminal with custom settings. |
| [jupyter_new_notebook.xsh](docs/scripts/jupyter_new_notebook.xsh.md) | A script to create and open a new Jupyter notebook in Chromium |
| [launch_tmux_with_music_player.sh](docs/scripts/launch_tmux_with_music_player.sh.md) | Script to create a tmux session for running cmus |
| [list_process.sh](docs/scripts/list_process.sh.md) | Script to list all running services on the system in sorted order. |
| [llama-all-scripts-describer.py](docs/scripts/llama-all-scripts-describer.py.md) | Automates script documentation generation using Llama 3.1 |
| [llm-script-describer.py](docs/scripts/llm-script-describer.py.md) | Auto-generates Markdown documentation for user scripts. |
| [m3u_creator.sh](docs/scripts/m3u_creator.sh.md) | Generate an M3U playlist file from the current directory files. |
| [mechen_music_transfert.py](docs/scripts/mechen_music_transfert.py.md) | Custom script to copy music to Mechen |
| [midi2arch.xsh](docs/scripts/midi2arch.xsh.md) | A script to transform a MIDI controller into a keyboard/script launcher |
| [next_album.xsh](docs/scripts/next_album.xsh.md) | Skip to the next album in CMUS audio player |
| [obsidian.xsh](docs/scripts/obsidian.xsh.md) | A script to open Obsidian vaults using a selection menu. |
| [pdfopener.sh](docs/scripts/pdfopener.sh.md) | A script to pick and open a PDF file using Evince |
| [playlist_player.xsh](docs/scripts/playlist_player.xsh.md) | A script for selecting and playing playlists in cmus with dmenu. |
| [playlist_randomizer.xsh](docs/scripts/playlist_randomizer.xsh.md) | Randomly selects and plays a playlist of albums in cmus. |
| [ppm-color-reducer](docs/scripts/ppm-color-reducer.md) | A tool to reduce color depth in PPM images based on a given palette. |
| [random_album.xsh](docs/scripts/random_album.xsh.md) | Select random album and play it with cmus |
| [random_wallpapers.xsh](docs/scripts/random_wallpapers.xsh.md) | Pick a random wallpaper from a specified directory |
| [sandisk_music_transfert.py](docs/scripts/sandisk_music_transfert.py.md) | Python script to transfer music to a Sandisk media player from a local library. |
| [script_launcher.sh](docs/scripts/script_launcher.sh.md) | Launches user scripts using fzf with a preview pane. |
| [select_script](docs/scripts/select_script.md) | A C script for selecting and executing a script from a cached list. |
| [songlauncher.sh](docs/scripts/songlauncher.sh.md) | Play a song with cmus using dmenu |
| [sync-repo.sh](docs/scripts/sync-repo.sh.md) | Bash script for synchronizing a Git repository with practical features |
| [tmux-help.py](docs/scripts/tmux-help.py.md) | tmux-help.py - A script providing helpful utilities and search capabilities for tmux commands. |
| [toggle_picom.sh](docs/scripts/toggle_picom.sh.md) | Script to toggle the Picom compositor on and off. |
| [transform_symlink.sh](docs/scripts/transform_symlink.sh.md) | Convert symlinks to copies of their target files or directories. |
| [update_env.xsh](docs/scripts/update_env.xsh.md) | update_env.xsh - Update .env file with API keys from xonsh environment |
| [utils_update_symlinks.sh](docs/scripts/utils_update_symlinks.sh.md) | Automates the creation and management of symlinks in ~/.local/bin |
| [vimwiki.sh](docs/scripts/vimwiki.sh.md) | Open a note in vim using fzf for quick selection. |
| [vox.py](docs/scripts/vox.py.md) | A script for listing and displaying options for Vox amplifiers. |
| [wallpaper.sh](docs/scripts/wallpaper.sh.md) | Automatically change wallpapers from a specified collection. |
| [you_are_not_documented.sh](docs/scripts/you_are_not_documented.sh.md) | A script that finds scripts without inline documentation |

<!-- table_end -->
