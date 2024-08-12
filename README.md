# Scripts

## Description

<!-- llm_generated_output_start -->

This repository contains a diverse set of Bash and Python scripts tailored for enhancing productivity, managing multimedia, and automating various tasks in an Arch Linux environment using a Qtile window manager. Each script is designed with simplicity and utility in mind, making them suitable for both seasoned users and those new to scripting.

Many scripts focus on **media management** and playback, such as [songlauncher.sh](docs/scripts/songlauncher.sh.md) and [albumplayer.xsh](docs/scripts/albumplayer.xsh.md), integrating with the console-based music player cmus. They leverage tools like `dmenu` or `fzf` to provide an interactive experience for selecting songs and albums from the user's library, enhancing ease of use. For users who enjoy aesthetic customization, scripts like [random_wallpapers.xsh](docs/scripts/random_wallpapers.xsh.md) and [wallpaper.sh](docs/scripts/wallpaper.sh.md) allow for the automatic setting of wallpapers from a predefined directory with easy selection options.

To streamline **workflow management**, scripts such as [update_env.xsh](docs/scripts/update_env.xsh.md) and [install_dependencies.sh](docs/scripts/install_dependencies.sh.md) simplify the tasks of managing environment variables and installing necessary packages respectively. These scripts are particularly useful for establishing a consistent development environment.

For **documentation generation**, tools like [llm-script-describer.py](docs/scripts/llm-script-describer.py.md) and [chatgpt-all-scripts-describer.py](docs/scripts/chatgpt-all-scripts-describer.py.md) utilize AI models to automate the tedious process of generating Markdown documentation for scripts. This is especially valuable in a development setup where keeping track of scripts and their functionalities is crucial.

The repository also includes various utility scripts like [fix-markdown-links.sh](docs/scripts/fix-markdown-links.sh.md) which corrects link formatting in Markdown files, and [get_repos_present_on_host.sh](docs/scripts/get_repos_present_on_host.sh.md) that assists in managing local Git repositories. 

### Key Features:
- **Interactive Interfaces**: Many scripts utilize `dmenu` and `fzf` for interactive selection, enhancing user experience.
- **Task Automation**: Several scripts automate repetitive tasks like wallpaper management, music playback, and environment setup.
- **Multimedia Handling**: Scripts are tailored for media management, allowing users to play songs, manage playlists, and adjust audio settings seamlessly.
- **Documentation**: Tools are provided for generating and maintaining documentation for scripts, ensuring clarity and ease of use.
- **Customization**: Users can easily bind scripts to key combinations within Qtile for quick access and greater efficiency in their workflows.

Overall, this repository is a valuable asset for anyone looking to enhance their productivity and streamline their interaction with an Arch Linux setup using scripts that are easy to customize and integrate into their day-to-day tasks.

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
| [flexoki_show.sh](docs/scripts/flexoki_show.sh.md) | Generate a color palette with hex, RGB values, and names for quick reference. |
| [fzf_albumlauncher.xsh](docs/scripts/fzf_albumlauncher.xsh.md) | Choose and play an album using fzf and cmus |
| [fzf_songlauncher.sh](docs/scripts/fzf_songlauncher.sh.md) | Play a song with cmus using fzf to choose the file. |
| [fzfmenu.sh](docs/scripts/fzfmenu.sh.md) | A wrapper script to launch fzf in a terminal for menu selection. |
| [fzfmenu_run.sh](docs/scripts/fzfmenu_run.sh.md) | A script to replace dmenu with fzf for running commands in a floating terminal. |
| [get_repos_present_on_host.sh](docs/scripts/get_repos_present_on_host.sh.md) | Script to list git repositories on the local host and save to files. |
| [git_clone_by_author-repo.sh](docs/scripts/git_clone_by_author-repo.sh.md) | A script to clone git repositories based on developer/package name using various options. |
| [grub-tune-to-audio-python.py](docs/scripts/grub-tune-to-audio-python.py.md) | Converts GRUB_INIT_TUNE strings into audio files. |
| [improved-fzfmenu.sh](docs/scripts/improved-fzfmenu.sh.md) | A script to launch FZF in Alacritty with command-line arguments. |
| [install_dependencies.sh](docs/scripts/install_dependencies.sh.md) | Installs essential development and productivity tools on Arch Linux |
| [jupyter_new_notebook.xsh](docs/scripts/jupyter_new_notebook.xsh.md) | A script to create and open a new Jupyter notebook in Chromium |
| [launch_tmux_with_music_player.sh](docs/scripts/launch_tmux_with_music_player.sh.md) | Script to create a tmux session for running cmus |
| [list_process.sh](docs/scripts/list_process.sh.md) | Script to list all running services on the system in sorted order. |
| [llama-all-scripts-describer.py](docs/scripts/llama-all-scripts-describer.py.md) | Automates script documentation generation using Llama 3.1 |
| [llm-script-describer.py](docs/scripts/llm-script-describer.py.md) | Generates markdown documentation for user scripts using GPT-4. |
| [m3u_creator.sh](docs/scripts/m3u_creator.sh.md) | Generate an M3U playlist file from the current directory files. |
| [mechen_music_transfert.py](docs/scripts/mechen_music_transfert.py.md) | Custom script to copy music to Mechen |
| [megaignore_editor.sh](docs/scripts/megaignore_editor.sh.md) | A bash script for editing and managing .megaignore files interactively |
| [midi2arch.xsh](docs/scripts/midi2arch.xsh.md) | A script to transform a MIDI controller into a keyboard/script launcher |
| [new_script_creator.sh](docs/scripts/new_script_creator.sh.md) | A simple script to create new scripts with directory linking |
| [next_album.xsh](docs/scripts/next_album.xsh.md) | Skip to the next album in CMUS audio player |
| [obsidian.xsh](docs/scripts/obsidian.xsh.md) | Open any Obsidian vault from a user-defined directory |
| [pdfopener.sh](docs/scripts/pdfopener.sh.md) | A script to pick and open a PDF file using Evince |
| [playlist_player.xsh](docs/scripts/playlist_player.xsh.md) | A script for selecting and playing playlists in cmus with dmenu. |
| [playlist_randomizer.xsh](docs/scripts/playlist_randomizer.xsh.md) | Randomly selects and plays a playlist of albums in cmus. |
| [ppm-color-reducer](docs/scripts/ppm-color-reducer.md) | A tool to reduce color depth in PPM images based on a given palette. |
| [quick-pass.sh](docs/scripts/quick-pass.sh.md) | Quickly select a password from your password store using fzf. |
| [random_album.xsh](docs/scripts/random_album.xsh.md) | Select random album and play it with cmus |
| [random_wallpapers.xsh](docs/scripts/random_wallpapers.xsh.md) | Pick a random wallpaper from a specified directory |
| [sandisk_music_transfert.py](docs/scripts/sandisk_music_transfert.py.md) | Python script to transfer music to a Sandisk media player from a local library. |
| [script_launcher.sh](docs/scripts/script_launcher.sh.md) | A utility to run scripts with fzf and preview documentation. |
| [select_script](docs/scripts/select_script.md) | A C script for selecting and executing a script from a cached list. |
| [setting-up-syncs.sh](docs/scripts/setting-up-syncs.sh.md) | Automates syncing of user directories to a backup location. |
| [songlauncher.sh](docs/scripts/songlauncher.sh.md) | Play a song with cmus using dmenu |
| [sync-repo.sh](docs/scripts/sync-repo.sh.md) | A script to sync a local git repository with its remote counterpart. |
| [tmux-help.py](docs/scripts/tmux-help.py.md) | tmux-help.py - A script providing helpful utilities and search capabilities for tmux commands. |
| [toggle_picom.sh](docs/scripts/toggle_picom.sh.md) | A script to toggle the picom compositor on and off. |
| [transform_symlink.sh](docs/scripts/transform_symlink.sh.md) | Convert symlinks to copies of their target files or directories. |
| [update_env.xsh](docs/scripts/update_env.xsh.md) | update_env.xsh - Update .env file with API keys from xonsh environment |
| [utils_update_symlinks.sh](docs/scripts/utils_update_symlinks.sh.md) | Automates the creation and management of symlinks in ~/.local/bin |
| [vimwiki.sh](docs/scripts/vimwiki.sh.md) | Open a note in vim using fzf for quick selection. |
| [vox.py](docs/scripts/vox.py.md) | A Python script to list and describe Vox amp options in a formatted manner. |
| [wallpaper.sh](docs/scripts/wallpaper.sh.md) | Automatically change wallpapers from a specified collection. |
| [you_are_not_documented.sh](docs/scripts/you_are_not_documented.sh.md) | A script that finds scripts without inline documentation |

<!-- table_end -->
