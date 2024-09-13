# Scripts

## Description

<!-- llm_generated_output_start -->

This repository contains a collection of versatile shell scripts and utilities tailored for an Arch Linux environment using the Qtile window manager. The scripts are designed to enhance productivity, streamline workflows, and effectively manage tasks, especially for users who frequently work with command-line applications and tools.

Here’s a diverse overview of what you’ll find within this script repository:

- **File Management**: Scripts like `[fzf-file-manager.sh](docs/scripts/fzf-file-manager.sh.md)` provide an interactive way to navigate and manage files using `fzf`, while `[m3u_creator.sh](docs/scripts/m3u_creator.sh.md)` generates playlists from files in a directory, perfect for audio management.

- **Documentation and Help Utilities**: The repository includes tools for generating markdown documentation from scripts, like `[llm-script-describer.py](docs/scripts/llm-script-describer.py.md)`, which utilizes OpenAI’s language model to summarize and provide documentation for scripts automatically. Additionally, utility scripts like `[read_the_fucking_manual.sh](docs/scripts/read_the_fucking_manual.sh.md)` assist users by retrieving frequently referenced manual entries, improving accessibility to command usage.

- **Interactive Launchers**: Scripts such as `[dmenu_run_scripts.py](docs/scripts/dmenu_run_scripts.py.md)` and `[select_script](docs/scripts/select_script.md)` facilitate the quick execution of scripts from a predefined selection using `rofi` or `dmenu`, promoting efficiency.

- **Music Playback Management**: For music enthusiasts, scripts like `[fzf_albumlauncher.xsh](docs/scripts/fzf_albumlauncher.xsh.md)` and `[playlist_player.xsh](docs/scripts/playlist_player.xsh.md)` allow users to easily select and play music albums or playlists using the `cmus` player with the aid of fuzzy searching.

- **Environment Setup**: There are scripts such as `[chezmoi_on_a_new_system.sh](docs/scripts/chezmoi_on_a_new_system.sh.md)` for automating the setup of `chezmoi`, enabling easy management of dotfiles and personal configurations on new systems.

- **Compositor and Wallpaper Management**: Scripts like `[toggle_picom.sh](docs/scripts/toggle_picom.sh.md)` manage the `picom` compositor’s state while `[wallpaper.sh](docs/scripts/wallpaper.sh.md)` helps users to randomly select or set wallpapers, augmenting the desktop experience.

- **General Utilities**: Various other scripts provide functionality for tasks such as updating environment variables, sync processes with `Mega.nz`, and creating graphical outputs from data.

The design of these scripts emphasizes interaction through intuitive command-line interfaces, promoting a productive environment for those using the Qtile window manager on Arch Linux. Each script is documented with usage examples and tips for best practices, ensuring users can quickly adapt these tools into their daily workflows. 

This repository aims to provide powerful, user-friendly command-line utilities that align seamlessly with a streamlined Arch Linux environment, enhancing efficiency and usability for its users.

<!-- llm_generated_output_end -->

*Note: This section was entirely generated with gpt-4o-mini*

## [Index](docs/index.md)

<!-- table_start -->

| File | Description |
| --- | --- |
| [albumplayer.xsh](docs/scripts/albumplayer.xsh.md) | Play an album using cmus with random selection of other albums |
| [ardour-open.sh](docs/scripts/ardour-open.sh.md) | Opens an Ardour session by searching for `.ardour` files |
| [chatgpt-all-scripts-describer.py](docs/scripts/chatgpt-all-scripts-describer.py.md) | Generates GitHub markdown documentation for scripts using GPT-4o. |
| [chezmoi_on_a_new_system.sh](docs/scripts/chezmoi_on_a_new_system.sh.md) | Automates the setup of Chezmoi on a new Arch Linux system. |
| [citeboard.sh](docs/scripts/citeboard.sh.md) | A script to find and manage paper citations from your bibliography. |
| [colormap_from_text.sh](docs/scripts/colormap_from_text.sh.md) | Simple script that extracts color palettes from config files |
| [command_prompt.sh](docs/scripts/command_prompt.sh.md) | Launch a command with history suggestions using fzf |
| [count_tokens_with_tiktoken.py](docs/scripts/count_tokens_with_tiktoken.py.md) | A Python script to count the number of tokens in a text file using the `tiktoken` library. |
| [create_cover_art.sh](docs/scripts/create_cover_art.sh.md) | Create a cover art based on file spectrogram. |
| [display_markdown.py](docs/scripts/display_markdown.py.md) | A script to render Markdown files in the terminal using the Rich library. |
| [dmenu_run_scripts.py](docs/scripts/dmenu_run_scripts.py.md) | A script to execute selected scripts using rofi with options from xonsh. |
| [edit_chezmoi_cfg_files.sh](docs/scripts/edit_chezmoi_cfg_files.sh.md) | A script to efficiently edit and manage Chezmoi config files. |
| [editor.sh](docs/scripts/editor.sh.md) | Edit files from the shell using fzf with customizable search options. |
| [fix-markdown-links.sh](docs/scripts/fix-markdown-links.sh.md) | A script to fix relative links in Markdown files. |
| [flexoki_show.sh](docs/scripts/flexoki_show.sh.md) | Generate a color palette with hex, RGB values, and names for quick reference. |
| [fzf-file-manager.sh](docs/scripts/fzf-file-manager.sh.md) | A shell script to manage files interactively using fzf and eza. |
| [fzf_albumlauncher.xsh](docs/scripts/fzf_albumlauncher.xsh.md) | Launches and plays selected albums using fzf and cmus. |
| [fzf_songlauncher.sh](docs/scripts/fzf_songlauncher.sh.md) | Play a song with cmus, choosing it with fzf |
| [fzfmenu.sh](docs/scripts/fzfmenu.sh.md) | A helper script to create a fuzzy finder menu using `fzf` within `xterm`. |
| [fzfmenu_run.sh](docs/scripts/fzfmenu_run.sh.md) | A lightweight dmenu replacement using fzf within a floating xterm terminal. |
| [get-window-thumbnails.sh](docs/scripts/get-window-thumbnails.sh.md) | Capture window thumbnails from currently open windows and save them. |
| [get_repos_present_on_host.sh](docs/scripts/get_repos_present_on_host.sh.md) | A script to list Git repositories present on the current host. |
| [git_clone_by_author-repo.sh](docs/scripts/git_clone_by_author-repo.sh.md) | A script for cloning Git repositories by specifying developer and package. |
| [grub-tune-to-audio-python.py](docs/scripts/grub-tune-to-audio-python.py.md) | Converts GRUB_INIT_TUNE strings into audio files. |
| [help-pastel.sh](docs/scripts/help-pastel.sh.md) | A script to display Pastel subcommands with live help. |
| [improved-fzfmenu.sh](docs/scripts/improved-fzfmenu.sh.md) | A versatile FZF menu launcher that uses Alacritty terminal. |
| [install_dependencies.sh](docs/scripts/install_dependencies.sh.md) | Automatically installs a set of required packages on Arch Linux. |
| [jupyter_new_notebook.xsh](docs/scripts/jupyter_new_notebook.xsh.md) | Create a new Jupyter notebook and open it in Chromium. |
| [keyboard-help.sh](docs/scripts/keyboard-help.sh.md) | Launches a terminal to display current keyboard layout using `bat`. |
| [launch_tmux_with_music_player.sh](docs/scripts/launch_tmux_with_music_player.sh.md) | Script to create a new tmux session called music and open cmus. |
| [list_process.sh](docs/scripts/list_process.sh.md) | A simple script to list all running services sorted by their status. |
| [llama-all-scripts-describer.py](docs/scripts/llama-all-scripts-describer.py.md) | Automatically generates GitHub documentation for scripts using Llama 3.1. |
| [llm-script-describer.py](docs/scripts/llm-script-describer.py.md) | Generate GitHub markdown documentation from user scripts. |
| [m3u_creator.sh](docs/scripts/m3u_creator.sh.md) | Create an m3u file from files in the current directory |
| [mechen_music_transfert.py](docs/scripts/mechen_music_transfert.py.md) | Custom script to copy music to Mechen |
| [megacmd_launch_tmux.sh](docs/scripts/megacmd_launch_tmux.sh.md) | Launches the MEGA command line interface in a new tmux session. |
| [megaignore_editor.sh](docs/scripts/megaignore_editor.sh.md) | A bash script for editing and managing .megaignore files interactively |
| [midi2arch.xsh](docs/scripts/midi2arch.xsh.md) | Transform a MIDI controller into a keyboard/script launcher. |
| [new_script_creator.sh](docs/scripts/new_script_creator.sh.md) | A simple script to create new scripts with directory linking |
| [next_album.xsh](docs/scripts/next_album.xsh.md) | Skip to the next album in CMUS music player. |
| [nvim_in_new_terminal.sh](docs/scripts/nvim_in_new_terminal.sh.md) | Opens a floating terminal to edit a file with NVim. |
| [obsidian-vault-selector.sh](docs/scripts/obsidian-vault-selector.sh.md) | A script to easily select and open any Obsidian vault from your filesystem. |
| [obsidian.xsh](docs/scripts/obsidian.xsh.md) | Open any Obsidian vault from your PKM directory |
| [pacman-fuzzy-search.sh](docs/scripts/pacman-fuzzy-search.sh.md) | A script to perform fuzzy searches for Arch Linux packages using fzf |
| [pdfopener.sh](docs/scripts/pdfopener.sh.md) | A script to select and open any PDF file from the home folder using Evince. |
| [playlist_player.xsh](docs/scripts/playlist_player.xsh.md) | A simple script to pick and play a music playlist using cmus |
| [playlist_randomizer.xsh](docs/scripts/playlist_randomizer.xsh.md) | Randomly selects and plays a playlist of albums in cmus. |
| [ppm-color-reducer](docs/scripts/ppm-color-reducer.md) | A command-line tool to reduce the color depth of PPM images using a custom palette. |
| [qtile_dice_group.py](docs/scripts/qtile_dice_group.py.md) | A script to switch between Qtile groups using a complementary number. |
| [qtile_window_to_group_and_switch.py](docs/scripts/qtile_window_to_group_and_switch.py.md) | Switches the active window to a new group in Qtile. |
| [quick-pass.sh](docs/scripts/quick-pass.sh.md) | Quickly select a password from your password store using fzf. |
| [qutebrowser-modify-source-bookmarks.sh](docs/scripts/qutebrowser-modify-source-bookmarks.sh.md) | Sync local Qutebrowser bookmarks with ChezMoi. |
| [random_album.xsh](docs/scripts/random_album.xsh.md) | Selects a random album and plays it with cmus. |
| [random_wallpapers.xsh](docs/scripts/random_wallpapers.xsh.md) | Pick random wallpaper from a specified wallpaper list |
| [read_the_fucking_manual.sh](docs/scripts/read_the_fucking_manual.sh.md) | A script to retrieve the top researched manual entries |
| [rgfzf.sh](docs/scripts/rgfzf.sh.md) | Combines Ripgrep and FZF to search files and open in Vim interactively. |
| [sandisk_music_transfert.py](docs/scripts/sandisk_music_transfert.py.md) | A script to transfer unlistened music albums to a Sandisk media player. |
| [script_launcher.sh](docs/scripts/script_launcher.sh.md) | Run scripts with fzf |
| [select_script](docs/scripts/select_script.md) | A C script that selects a chosen script using cached data from a CSV file. |
| [setting-up-syncs.sh](docs/scripts/setting-up-syncs.sh.md) | Automates syncing of user directories to a backup location. |
| [shell_history_info.sh](docs/scripts/shell_history_info.sh.md) | Obtains the most frequent lines, words, or characters in shell history files. |
| [show_keyboard_layout.py](docs/scripts/show_keyboard_layout.py.md) | Displays a visual representation of the keyboard layout in terminal. |
| [songlauncher.sh](docs/scripts/songlauncher.sh.md) | Play a song with cmus using dmenu |
| [sync-repo.sh](docs/scripts/sync-repo.sh.md) | A script for syncing a Git repository, including fetching, pulling, and handling conflicts. |
| [terminal_with_command.sh](docs/scripts/terminal_with_command.sh.md) | Opens a floating terminal to run a specified command. |
| [tmux-help.py](docs/scripts/tmux-help.py.md) | Interactive script to assist with tmux commands and manage usage information. |
| [toggle_picom.sh](docs/scripts/toggle_picom.sh.md) | Script to toggle the picom compositor on or off. |
| [transform_symlink.sh](docs/scripts/transform_symlink.sh.md) | A utility to transform symlinks into copies of their targets. |
| [update_env.xsh](docs/scripts/update_env.xsh.md) | Update the .env file with API keys from the current environment |
| [utils_update_symlinks.sh](docs/scripts/utils_update_symlinks.sh.md) | Script to create and manage symlinks in ~/.local/bin, cleaning old ones. |
| [vimwiki.sh](docs/scripts/vimwiki.sh.md) | Open a note in vim with fzf |
| [vox.py](docs/scripts/vox.py.md) | Lists VOX amplifier options and their details. |
| [wallpaper.sh](docs/scripts/wallpaper.sh.md) | A script to pick random wallpapers from a specified list. |
| [you_are_not_documented.sh](docs/scripts/you_are_not_documented.sh.md) | A script that finds scripts without inline documentation. |

<!-- table_end -->
