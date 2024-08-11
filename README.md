# Scripts

## Description

<!-- llm_generated_output_start -->

This script repository is tailored to facilitate a variety of tasks primarily centered around audio processing, file management, and document editing in an Arch Linux environment using the Qtile window manager. Here’s an overview of the types of scripts available:

- **Audio Management**: A collection of tools is provided for managing audio playback and processing. For instance, scripts like [albumplayer.xsh](docs/scripts/albumplayer.xsh.md) and [fzf_albumlauncher.xsh](docs/scripts/fzf_albumlauncher.xsh.md) allow users to play albums directly or select songs interactively using tools like `fzf`, enhancing music navigation. Additionally, scripts such as [create_cover_art.sh](docs/scripts/create_cover_art.sh.md) transform WAV files into spectrogram cover art, integrating utilities like `sox` and `imagemagick` for audio visualization.

- **File and Directory Management**: Scripts such as [launch_tmux_with_music_player.sh](docs/scripts/launch_tmux_with_music_player.sh.md) and [megaignore_editor.sh](docs/scripts/megaignore_editor.sh.md) streamline the management of sessions in terminal multiplexers and the editing of ignore files. Similarly, [list_process.sh](docs/scripts/list_process.sh.md) provides a streamlined way to view services managed by systemd, helping users monitor their system efficiently.

- **Document and Note Handling**: The repository offers tools for managing documents, such as [vimwiki.sh](docs/scripts/vimwiki.sh.md) for quick access to notes via fuzzy finding. This is complemented by [obsidian.xsh](docs/scripts/obsidian.xsh.md), making it easy to open notes within the popular note-taking app.

- **Script Creation and Management**: Users can leverage [new_script_creator.sh](docs/scripts/new_script_creator.sh.md) to quickly generate new scripts, ensuring that they are correctly configured for execution without cluttering local directories. Similarly, tools like [script_launcher.sh](docs/scripts/script_launcher.sh.md) enhance script execution by providing documentation and source previews through fzf and bat.

- **Specialized Utilities**: The collection extends to specialized scripts such as those for managing MIDI controls ([midi2arch.xsh](docs/scripts/midi2arch.xsh.md)), transferring music to devices ([sandisk_music_transfert.py](docs/scripts/sandisk_music_transfert.py.md)), and generating documentation for user scripts using models like OpenAI’s ([chatgpt-all-scripts-describer.py](docs/scripts/chatgpt-all-scripts-describer.py.md)). 

This comprehensive script library provides users a rich toolkit for enhancing their workflow, from music management to automated documentation generation, making it valuable for Arch Linux users who wish to tailor their environments efficiently. Each script typically comes with essential dependencies and detailed usage instructions, ensuring an accessible learning curve regardless of expertise. 

For a complete list of scripts and their specific functions, please refer to the script documentation within the repository's `docs/scripts` directory.

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
| [improved-fzfmenu.sh](docs/scripts/improved-fzfmenu.sh.md) | A script to launch FZF in Alacritty with command-line arguments. |
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
| [sync-repo.sh](docs/scripts/sync-repo.sh.md) | A script to sync a git repository, fetching changes, stashing local modifications, and pushing updates. |
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
