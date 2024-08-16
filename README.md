# Scripts

## Description

<!-- llm_generated_output_start -->

This repository contains a collection of versatile scripts designed to enhance productivity and manage various tasks efficiently in an Arch Linux environment, particularly for users who utilize the Qtile window manager. These scripts cater to a wide range of needs—from music management to documentation automation and workflow enhancements. 

The scripts can be broadly categorized as follows:

- **Markdown and Documentation Management**: Scripts such as [fix-markdown-links.sh](docs/scripts/fix-markdown-links.sh) help maintain and update document file links, while [llm-script-describer.py](docs/scripts/llm-script-describer.py) and [chatgpt-all-scripts-describer.py](docs/scripts/chatgpt-all-scripts-describer.py) automate the generation of comprehensive Markdown documentation for user scripts, leveraging AI models for content creation.

- **Music and Media Management**: The repository includes various music handling scripts such as [m3u_creator.sh](docs/scripts/m3u_creator.sh) for playlist generation, [albumplayer.xsh](docs/scripts/albumplayer.xsh) for album selection via dmenu, and [random_album.xsh](docs/scripts/random_album.xsh) for random album playback in the cmus player. Collectively, these scripts streamline the process of managing and enjoying media files efficiently.

- **File and Directory Utilities**: A series of scripts such as [nvim_in_new_terminal.sh](docs/scripts/nvim_in_new_terminal.sh) and [midi2arch.xsh](docs/scripts/midi2arch.xsh) enhance file accessibility and productivity. These scripts allow users to quickly execute commands and manage files directly from their desktop environment with minimal fuss.

- **System Interaction**: Some scripts focus on system tasks like managing symlinks with [utils_update_symlinks.sh](docs/scripts/utils_update_symlinks.sh), manipulating processes with [list_process.sh](docs/scripts/list_process.sh), and launching applications in terminal sessions (e.g., [megacmd_launch_tmux.sh](docs/scripts/megacmd_launch_tmux.sh)).

- **Customization and Configuration**: Scripts such as [chezmoi_on_a_new_system.sh](docs/scripts/chezmoi_on_a_new_system.sh) and [install_dependencies.sh](docs/scripts/install_dependencies.sh) provide a systematic approach to setting up environment configurations and managing dotfiles, making it easier for users to tailor their systems to their preferences.

Each script typically features comprehensive documentation outlining its purpose, usage instructions, dependencies, and tips for improving robustness and functionality. The use of common tools and programmatic conventions within these scripts allows for a streamlined experience that aligns with the Arch user ethos of customization and efficiency.

Overall, this repository serves as a powerful toolkit for enhancing daily operations in a Qtile and Arch Linux environment, encapsulating a wealth of functionality in easily deployable scripts.

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
| [fzfmenu.sh](docs/scripts/fzfmenu.sh.md) | Launches fzf in an xterm window using provided arguments. |
| [fzfmenu_run.sh](docs/scripts/fzfmenu_run.sh.md) | A script to replace Dmenu with fzf for enhanced run functionality. |
| [get_repos_present_on_host.sh](docs/scripts/get_repos_present_on_host.sh.md) | Script to list git repositories on the local host and save to files. |
| [git_clone_by_author-repo.sh](docs/scripts/git_clone_by_author-repo.sh.md) | A script to clone git repositories based on developer/package name using various options. |
| [grub-tune-to-audio-python.py](docs/scripts/grub-tune-to-audio-python.py.md) | Converts GRUB_INIT_TUNE strings into audio files. |
| [improved-fzfmenu.sh](docs/scripts/improved-fzfmenu.sh.md) | FZF menu integration with Alacritty, supporting output piping. |
| [install_dependencies.sh](docs/scripts/install_dependencies.sh.md) | Installs essential development and productivity tools on Arch Linux |
| [jupyter_new_notebook.xsh](docs/scripts/jupyter_new_notebook.xsh.md) | A script to create and open a new Jupyter notebook in Chromium |
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
