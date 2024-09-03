# Scripts

## Description

<!-- llm_generated_output_start -->

The script repository contains a diverse collection of utility scripts designed primarily for enhancing productivity and streamlining tasks in an Arch Linux environment, specifically tailored for use with the Qtile window manager. The scripts cover various applications ranging from music playback and PDF management to system monitoring and script management, allowing users to perform repetitively manual tasks more efficiently.

Key features of the scripts include:

- **Music Management**: With scripts such as [fzf_albumlauncher.xsh](docs/scripts/fzf_albumlauncher.xsh.md) and [playlist_player.xsh](docs/scripts/playlist_player.xsh.md), users can interactively select and play albums through popular music players like `cmus`. This enhances the user experience and provides a straightforward method to enjoy music collections without navigating through cumbersome interfaces.

- **File and Document Handling**: Scripts like [pdfopener.sh](docs/scripts/pdfopener.sh.md) and [create_cover_art.sh](docs/scripts/create_cover_art.sh.md) simplify interactions with documents and images. They allow users to select PDF files and generate cover art from audio files' spectrograms, respectively. This automated handling is particularly beneficial for users who frequently manage various types of media files.

- **System Utilities**: Several scripts, such as [list_process.sh](docs/scripts/list_process.sh.md) and [toggle_picom.sh](docs/scripts/toggle_picom.sh.md), provide quick access to system services and graphical compositor functionality. These enable users to monitor their system's performance or adjust visual settings without manual commands.

- **Script Creation and Management**: The presence of utility scripts like [new_script_creator.sh](docs/scripts/new_script_creator.sh.md) facilitate the effortless creation of new scripts with templates, while [utils_update_symlinks.sh](docs/scripts/utils_update_symlinks.sh.md) helps maintain and manage symbolic links for easy script accessibility.

- **Documentation Generation**: Tools such as [chatgpt-all-scripts-describer.py](docs/scripts/chatgpt-all-scripts-describer.py.md) employ language models to generate markdown documentation for user scripts automatically. This ensures that proper descriptions are maintained alongside scripts, enhancing usability and knowledge sharing.

- **Interactive Features**: Many scripts utilize `fzf` or `dmenu` to provide a dynamic and user-friendly interface for choosing options or executing commands. This interactivity fosters a more engaging user experience and allows for quick navigation through complex tasks.

### Conclusion
This repository serves as a comprehensive resource for anyone looking to enhance their workflow in an Arch Linux environment with Qtile. The scripts provided not only cover a wide array of functionalities—from music playback to document management—but also emphasize ease of use and customization, making them suitable for users at various skill levels. Users can extend or modify these scripts to better fit their individual workflows while benefiting from the structured approach to managing tasks in a flexible environment.

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
| [edit_chezmoi_cfg_files.sh](docs/scripts/edit_chezmoi_cfg_files.sh.md) | A script to select and edit Chezmoi-managed configuration files with fzf. |
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
| [improved-fzfmenu.sh](docs/scripts/improved-fzfmenu.sh.md) | Launches FZF in Alacritty with options for piping the output |
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
| [qtile_dice_group.py](docs/scripts/qtile_dice_group.py.md) | Switches to a complementary group in Qtile. |
| [quick-pass.sh](docs/scripts/quick-pass.sh.md) | Quickly select a password from your password store using fzf. |
| [qutebrowser-modify-source-bookmarks.sh](docs/scripts/qutebrowser-modify-source-bookmarks.sh.md) | Script to synchronize Qutebrowser bookmarks with Chezmoi-managed config. |
| [random_album.xsh](docs/scripts/random_album.xsh.md) | Select random album and play it with cmus |
| [random_wallpapers.xsh](docs/scripts/random_wallpapers.xsh.md) | Pick a random wallpaper from a specified folder. |
| [read_the_fucking_manual.sh](docs/scripts/read_the_fucking_manual.sh.md) | A script to display the most researched manual entries based on history. |
| [sandisk_music_transfert.py](docs/scripts/sandisk_music_transfert.py.md) | Python script to transfer music to a Sandisk media player from a local library. |
| [script_launcher.sh](docs/scripts/script_launcher.sh.md) | Launch scripts with fzf and provides documentation previews. |
| [select_script](docs/scripts/select_script.md) | A C script for selecting and executing a script from a cached list. |
| [setting-up-syncs.sh](docs/scripts/setting-up-syncs.sh.md) | Automates syncing of user directories to a backup location. |
| [shell_history_info.sh](docs/scripts/shell_history_info.sh.md) | Retrieve and analyze frequent entries from shell history files. |
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
