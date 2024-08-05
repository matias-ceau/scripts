# Scripts

## Description

<!-- llm_generated_output_start -->

This repository encompasses a variety of scripts designed to enhance the workflow of users operating within an Arch Linux environment, particularly those utilizing the Qtile window manager. Each script aims to streamline tasks, provide automation, and improve usability through interactive interfaces or efficient command-line operations.

**Core Functionalities Include:**
- **Markdown and Documentation Management**: Scripts like [fix-markdown-links.sh](docs/scripts/fix-markdown-links.sh) automate the fixing of links within Markdown files, ensuring they point correctly based on a defined base directory. Additionally, [llm-script-describer.py](docs/scripts/llm-script-describer.py) and [chatgpt-all-scripts-describer.py](docs/scripts/chatgpt-all-scripts-describer.py) leverage AI models to generate comprehensive documentation for various scripts, simplifying maintenance and usability.

- **Music Management**: For audio enthusiasts, scripts such as [m3u_creator.sh](docs/scripts/m3u_creator.sh), [next_album.xsh](docs/scripts/next_album.xsh), and [random_album.xsh](docs/scripts/random_album.xsh) make it easier to create playlists, skip to albums, or play random selections using the CMUS player. [fzf_albumlauncher.xsh](docs/scripts/fzf_albumlauncher.xsh) and [playlist_randomizer.xsh](docs/scripts/playlist_randomizer.xsh) enhance this experience by allowing for intuitive selection and playback of albums.

- **File and Resource Management**: Scripts like [get_repos_present_on_host.sh](docs/scripts/get_repos_present_on_host.sh) help in efficiently managing Git repositories locally, while [update_env.xsh](docs/scripts/update_env.xsh) organizes environment variables into a designated `.env` file from the xonsh shell context. Additionally, specialized scripts like [create_cover_art.sh](docs/scripts/create_cover_art.sh) generate unique cover art for music files based on their audio spectrograms.

- **General Utility Enhancements**: The repository also includes utilities for various common tasks. For example, [editor.sh](docs/scripts/editor.sh) aids in quickly editing files, [toggle_picom.sh](docs/scripts/toggle_picom.sh) allows for turning the Picom compositor on and off, and [fzf_songlauncher.sh](docs/scripts/fzf_songlauncher.sh) provides an interface for quickly playing music files through the terminal.

- **Interactive Selections**: Several scripts leverage interactive tools such as `dmenu` and `fzf` to enhance usability. Scripts such as [pdfopener.sh](docs/scripts/pdfopener.sh) and [citeboard.sh](docs/scripts/citeboard.sh) allow for quick selections and actions directly from the command line.

**Summary**: The scripts in this repository are designed to automate mundane tasks, manage files and music, assist with documentation, and enhance user efficiency through interactive interfaces. Collectively, they provide a rich toolkit suitable for improving productivity in an Arch Linux setup tailored for a Qtile environment. Each script is documented for ease of understanding and proper use, ensuring users can integrate them smoothly into their personal workflows.

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
| [colormap_from_text.sh](docs/scripts/colormap_from_text.sh.md) | Script to extract color palettes from text files |
| [count_tokens_with_tiktoken.py](docs/scripts/count_tokens_with_tiktoken.py.md) | A Python script to count the number of tokens in a text file using tiktoken |
| [create_cover_art.sh](docs/scripts/create_cover_art.sh.md) | A script to generate cover art from WAV file spectrograms |
| [dmenu_run_scripts.py](docs/scripts/dmenu_run_scripts.py.md) | A Python script to dynamically run scripts using rofi as a dmenu alternative. |
| [dmenu_run_scripts.xsh](docs/scripts/dmenu_run_scripts.xsh.md) | A script to run user scripts via dmenu or rofi. |
| [edit_chezmoi_cfg_files.sh](docs/scripts/edit_chezmoi_cfg_files.sh.md) | Launches fzf to edit Chezmoi managed config files with previews. |
| [editor.sh](docs/scripts/editor.sh.md) | A script to edit files in the current folder or its subfolders using fzf. |
| [fix-markdown-links.sh](docs/scripts/fix-markdown-links.sh.md) | A script to fix relative links in Markdown files. |
| [fzf_albumlauncher.xsh](docs/scripts/fzf_albumlauncher.xsh.md) | Choose and play an album using fzf and cmus |
| [fzf_songlauncher.sh](docs/scripts/fzf_songlauncher.sh.md) | Play a song with cmus using fzf to choose the file. |
| [fzfmenu.sh](docs/scripts/fzfmenu.sh.md) | A wrapper script to launch fzf in a terminal for menu selection. |
| [fzfmenu_run.sh](docs/scripts/fzfmenu_run.sh.md) | A script to replace dmenu with fzf for running commands in a floating terminal. |
| [get_repos_present_on_host.sh](docs/scripts/get_repos_present_on_host.sh.md) | Script to list git repositories on the local host and save to files. |
| [git_clone_by_author-repo.sh](docs/scripts/git_clone_by_author-repo.sh.md) | A script to clone git repositories based on developer/package name using various options. |
| [improved-fzfmenu.sh](docs/scripts/improved-fzfmenu.sh.md) | A script to launch FZF in Alacritty with command-line arguments. |
| [jupyter_new_notebook.xsh](docs/scripts/jupyter_new_notebook.xsh.md) | A script to create and open a new Jupyter notebook in Chromium |
| [launch_tmux_with_music_player.sh](docs/scripts/launch_tmux_with_music_player.sh.md) | Script to create a tmux session for running cmus |
| [list_process.sh](docs/scripts/list_process.sh.md) | Script to list all running services on the system in sorted order. |
| [llama-all-scripts-describer.py](docs/scripts/llama-all-scripts-describer.py.md) | Automates script documentation generation using Llama 3.1 |
| [llm-script-describer.py](docs/scripts/llm-script-describer.py.md) | Generates markdown documentation for user scripts using GPT-4. |
| [m3u_creator.sh](docs/scripts/m3u_creator.sh.md) | Generate an M3U playlist file from the current directory files. |
| [mechen_music_transfert.py](docs/scripts/mechen_music_transfert.py.md) | Custom script to copy music to Mechen |
| [midi2arch.xsh](docs/scripts/midi2arch.xsh.md) | A script to transform a MIDI controller into a keyboard/script launcher |
| [new_script_creator.sh](docs/scripts/new_script_creator.sh.md) | A simple script to automate the creation of new executable scripts. |
| [next_album.xsh](docs/scripts/next_album.xsh.md) | Skip to the next album in CMUS audio player |
| [obsidian.xsh](docs/scripts/obsidian.xsh.md) | Open any Obsidian vault from a user-defined directory |
| [pdfopener.sh](docs/scripts/pdfopener.sh.md) | A script to pick and open a PDF file using Evince |
| [playlist_player.xsh](docs/scripts/playlist_player.xsh.md) | A script for selecting and playing playlists in cmus with dmenu. |
| [playlist_randomizer.xsh](docs/scripts/playlist_randomizer.xsh.md) | Randomly selects and plays a playlist of albums in cmus. |
| [ppm-color-reducer](docs/scripts/ppm-color-reducer.md) | A tool to reduce color depth in PPM images based on a given palette. |
| [random_album.xsh](docs/scripts/random_album.xsh.md) | Select random album and play it with cmus |
| [random_wallpapers.xsh](docs/scripts/random_wallpapers.xsh.md) | Pick a random wallpaper from a specified directory |
| [sandisk_music_transfert.py](docs/scripts/sandisk_music_transfert.py.md) | Python script to transfer music to a Sandisk media player from a local library. |
| [script_launcher.sh](docs/scripts/script_launcher.sh.md) | A utility to run scripts with fzf and preview documentation. |
| [select_script](docs/scripts/select_script.md) | A C script for selecting and executing a script from a cached list. |
| [songlauncher.sh](docs/scripts/songlauncher.sh.md) | Play a song with cmus using dmenu |
| [sync-repo.sh](docs/scripts/sync-repo.sh.md) | Bash script for synchronizing a Git repository with practical features |
| [tmux-help.py](docs/scripts/tmux-help.py.md) | tmux-help.py - A script providing helpful utilities and search capabilities for tmux commands. |
| [toggle_picom.sh](docs/scripts/toggle_picom.sh.md) | Script to toggle the Picom compositor on and off. |
| [transform_symlink.sh](docs/scripts/transform_symlink.sh.md) | Convert symlinks to copies of their target files or directories. |
| [update_env.xsh](docs/scripts/update_env.xsh.md) | update_env.xsh - Update .env file with API keys from xonsh environment |
| [utils_update_symlinks.sh](docs/scripts/utils_update_symlinks.sh.md) | Automates the creation and management of symlinks in ~/.local/bin |
| [vimwiki.sh](docs/scripts/vimwiki.sh.md) | Open a note in vim using fzf for quick selection. |
| [vox.py](docs/scripts/vox.py.md) | A Python script to list and describe Vox amp options in a formatted manner. |
| [wallpaper.sh](docs/scripts/wallpaper.sh.md) | Automatically change wallpapers from a specified collection. |
| [you_are_not_documented.sh](docs/scripts/you_are_not_documented.sh.md) | A script that finds scripts without inline documentation |

<!-- table_end -->
