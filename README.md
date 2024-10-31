# Scripts

## Description

<!-- llm_generated_output_start -->

The script repository contains a broad collection of utility scripts tailored for a variety of tasks on an Arch Linux system, particularly in a Qtile window manager environment. These scripts help streamline workflows, enhance productivity, and manage daily tasks with greater efficiency. The tools cover a wide array of functionalities including:

- **File Management**: Scripts like [fzf-file-manager.sh](docs/scripts/fzf-file-manager.sh.md) and [editor.sh](docs/scripts/editor.sh.md) enable users to navigate directories, find files, and edit them quickly via interactive, user-friendly interfaces powered by `fzf`. This allows for rapid file operations in a visually appealing manner.

- **System Utilities**: Scripts such as [get_repos_present_on_host.sh](docs/scripts/get_repos_present_on_host.sh.md) and [install_dependencies.sh](docs/scripts/install_dependencies.sh.md) assist in managing system applications and repositories. They help automate processes like listing Git repositories or installing essential packages efficiently.

- **Media Management**: Various multimedia scripts like [fzf_albumlauncher.xsh](docs/scripts/fzf_albumlauncher.xsh.md) and [m3u_creator.sh](docs/scripts/m3u_creator.sh.md) cater to audio management through the use of a terminal-based player, allowing users to select playlists or create music files quickly.

- **Scripting and Development**: The repository includes several tools aimed at developers, such as [llm-script-describer.py](docs/scripts/llm-script-describer.py.md) which generates documentation for user scripts using AI models. Additionally, scripts like [git_clone_by_author-repo.sh](docs/scripts/git_clone_by_author-repo.sh.md) simplify cloning repositories from GitHub based on developer input.

- **Customization and Configuration**: For users looking to personalize their setups, scripts like [toggle_picom.sh](docs/scripts/toggle_picom.sh.md) for managing the compositor or [update_env.xsh](docs/scripts/update_env.xsh.md) for managing environment variables can greatly enhance desktop customization.

- **Interactive and Visual Tools**: The variety of TUI (Terminal User Interface) scripts, including [tui-gpt.py](docs/scripts/tui-gpt.py.md), create engaging experiences by providing users with interfaces to interact with AI or browse through their scripts and tools. 

- **Backup and Sync**: Several scripts like [setting-up-syncs.sh](docs/scripts/setting-up-syncs.sh.md) and [sync-repo-simple.py](docs/scripts/sync-repo-simple.py.md) streamline the process of backing up important directories and synchronizing Git repositories, greatly aiding in security and data management.

Through the comprehensive functionality offered by these scripts, they collectively serve as a robust toolkit designed to simplify tasks, enhance system management, and provide a seamless workflow within the Arch Linux ecosystem for users employing the Qtile window manager.

<!-- llm_generated_output_end -->

*Note: This section was entirely generated with gpt-4o-mini*

## [Index](docs/index.md)

<!-- table_start -->

| File | Description |
| --- | --- |
| [albumplayer.xsh](docs/scripts/albumplayer.xsh.md) | Play a random selection of albums using cmus and dmenu |
| [ansi-cheatsheet.sh](docs/scripts/ansi-cheatsheet.sh.md) | Command-line script to display an ANSI escape code cheatsheet in the terminal using `bat` |
| [ansi8bit2rgb_hex.py](docs/scripts/ansi8bit2rgb_hex.py.md) | Converts 8-bit ANSI color codes to RGB or HEX format. |
| [ardour-open.sh](docs/scripts/ardour-open.sh.md) | Script to open the most recent Ardour session |
| [chatgpt-all-scripts-describer.py](docs/scripts/chatgpt-all-scripts-describer.py.md) | A script for generating GitHub documentation for local scripts utilizing the OpenAI API |
| [chezmoi_on_a_new_system.sh](docs/scripts/chezmoi_on_a_new_system.sh.md) | Shell script to initialize and apply dotfiles with `chezmoi` |
| [citeboard.sh](docs/scripts/citeboard.sh.md) | A script to find and handle research papers by opening or copying citations. |
| [closest_colors.py](docs/scripts/closest_colors.py.md) | Find the closest ANSI color to a set of target colors. |
| [colormap_from_text.sh](docs/scripts/colormap_from_text.sh.md) | Simple script that extracts color palettes from text or configuration files in either hex or RGB format. |
| [command_prompt.sh](docs/scripts/command_prompt.sh.md) | Launch a command with history suggestions for easier execution. |
| [count_tokens_with_tiktoken.py](docs/scripts/count_tokens_with_tiktoken.py.md) | Script to count the number of tokens in a text using the Tiktoken library. |
| [create_cover_art.sh](docs/scripts/create_cover_art.sh.md) | Generates cover art from audio file spectrograms. |
| [desk_fzf.sh](docs/scripts/desk_fzf.sh.md) | Find and execute .desktop files with fzf selection. |
| [display_markdown.py](docs/scripts/display_markdown.py.md) | Script to display markdown files using the Rich library with customizable styles and width. |
| [dmenu_run_scripts.py](docs/scripts/dmenu_run_scripts.py.md) | A Python script to display executable scripts and run selected ones. |
| [edit_chezmoi_cfg_files.sh](docs/scripts/edit_chezmoi_cfg_files.sh.md) | A script to browse and edit Chezmoi-managed files with optional synchronization |
| [editor.sh](docs/scripts/editor.sh.md) | Script to rapidly edit files using `fzf` for search and `nvim` for editing, suitable for various directory contexts. |
| [fix-markdown-links.sh](docs/scripts/fix-markdown-links.sh.md) | A script to ensure that markdown links have consistent leading slashes for relative paths. |
| [flexoki_show.sh](docs/scripts/flexoki_show.sh.md) | Displays a table of colors with HEX, RGB, and descriptions |
| [fzf-file-manager.sh](docs/scripts/fzf-file-manager.sh.md) | A file manager script utilizing `fzf` for efficient file navigation. |
| [fzf_albumlauncher.xsh](docs/scripts/fzf_albumlauncher.xsh.md) | Choose an album with fzf and play it with cmus |
| [fzf_songlauncher.sh](docs/scripts/fzf_songlauncher.sh.md) | Select and play a song using `cmus`, with `fzf` for interactive selection. |
| [fzfmenu.sh](docs/scripts/fzfmenu.sh.md) | A lightweight alternative to dmenu using `fzf` within an `xterm` terminal. |
| [fzfmenu_run.sh](docs/scripts/fzfmenu_run.sh.md) | Dmenu run replacement using `fzf` within a floating xterm terminal |
| [generate_commit_message.sh](docs/scripts/generate_commit_message.sh.md) | Script to generate git commit messages using OpenAI's API. |
| [get-window-thumbnails.sh](docs/scripts/get-window-thumbnails.sh.md) | Captures and resizes screenshots of open windows on your desktop. |
| [get_hyperlinks_in_folder.py](docs/scripts/get_hyperlinks_in_folder.py.md) | A script to create a directed graph of hyperlinks within Markdown notes. |
| [get_repos_present_on_host.sh](docs/scripts/get_repos_present_on_host.sh.md) | Script to list Git repositories localized on the current host and update them into a summary. |
| [get_scripts_relations.py](docs/scripts/get_scripts_relations.py.md) | Visualizes relationships between scripts in a directory using a graph. |
| [git_cd.sh](docs/scripts/git_cd.sh.md) | Quick navigation to Git directories using `locate`, `eza`, and `fzf` |
| [git_clone_by_author-repo.sh](docs/scripts/git_clone_by_author-repo.sh.md) | Clone Git repositories by specifying developer and package. |
| [git_update_all_other_repos.sh](docs/scripts/git_update_all_other_repos.sh.md) | Automates pulling from all git repositories in a specified directory. |
| [grub-tune-to-audio-python.py](docs/scripts/grub-tune-to-audio-python.py.md) | Script to convert GRUB_INIT_TUNE string to an audio file (MP3 format) |
| [help-pastel.sh](docs/scripts/help-pastel.sh.md) | Enhances `pastel` command help with syntax highlighting and interactive selection. |
| [improved-fzfmenu.sh](docs/scripts/improved-fzfmenu.sh.md) | A customizable FZF menu utilizing Alacritty which can output piped data |
| [install_dependencies.sh](docs/scripts/install_dependencies.sh.md) | Automated script to install a list of necessary packages using `paru`. |
| [interactive_git_sync.sh](docs/scripts/interactive_git_sync.sh.md) | A script to synchronize multiple Git repositories interactively. |
| [json_to_markdown.py](docs/scripts/json_to_markdown.py.md) | Convert JSON files to formatted Markdown documents |
| [jupyter_new_notebook.xsh](docs/scripts/jupyter_new_notebook.xsh.md) | Script to create a new Jupyter notebook and open it in Chromium on Arch Linux with qtile. |
| [keyboard-help.sh](docs/scripts/keyboard-help.sh.md) | Launches a floating terminal displaying keyboard layout information |
| [launch_tmux_with_music_player.sh](docs/scripts/launch_tmux_with_music_player.sh.md) | Script to create a new tmux session called music and open cmus inside |
| [legacy-sync.repo.sh](docs/scripts/legacy-sync.repo.sh.md) | A script to synchronize a Git repository while providing enhanced output formatting. |
| [list_process.sh](docs/scripts/list_process.sh.md) | This script lists all running system services in a sorted order. |
| [llama-all-scripts-describer.py](docs/scripts/llama-all-scripts-describer.py.md) | Script to document user scripts and manage their associations with symlink data. |
| [llm-script-describer.py](docs/scripts/llm-script-describer.py.md) | Automates the generation and maintenance of markdown documentation for scripts. |
| [m3u_creator.sh](docs/scripts/m3u_creator.sh.md) | Script to create an M3U playlist file from files in the current directory |
| [mechen_music_transfert.py](docs/scripts/mechen_music_transfert.py.md) | Automates syncing of unlistened music albums to a music player device. |
| [megacmd_launch_tmux.sh](docs/scripts/megacmd_launch_tmux.sh.md) | Script to run MEGAcmd in a detached Tmux session |
| [megaignore_editor.sh](docs/scripts/megaignore_editor.sh.md) | Interactive script to find and edit `.megaignore` files |
| [midi2arch.xsh](docs/scripts/midi2arch.xsh.md) | A script to transform a MIDI controller into a keyboard or script launcher. |
| [minimal-browser.py](docs/scripts/minimal-browser.py.md) | A simple browser for viewing local HTML and markdown files. |
| [new_script_creator.sh](docs/scripts/new_script_creator.sh.md) | A script for creating and modifying user scripts with optional templating |
| [next_album.xsh](docs/scripts/next_album.xsh.md) | A script to skip to the next album in `cmus` |
| [nvim_in_new_terminal.sh](docs/scripts/nvim_in_new_terminal.sh.md) | Script to open a file with `nvim` in a floating terminal window. |
| [obsidian-vault-selector.sh](docs/scripts/obsidian-vault-selector.sh.md) | Script to select and open any Obsidian vault. |
| [obsidian.xsh](docs/scripts/obsidian.xsh.md) | Open any Obsidian vault interactively using `fzf` |
| [open_url_in_instance.sh](docs/scripts/open_url_in_instance.sh.md) | Launches a URL in an existing Qutebrowser instance. |
| [openwebui-launcher.sh](docs/scripts/openwebui-launcher.sh.md) | A script to launch the Open WebUI with customizable parameters. |
| [ousse-update.sh](docs/scripts/ousse-update.sh.md) | A script for maintaining and updating various databases of system paths. |
| [pacman-fuzzy-search.sh](docs/scripts/pacman-fuzzy-search.sh.md) | A fuzzy search script for Arch Linux's pacman and AUR packages. |
| [pdfopener.sh](docs/scripts/pdfopener.sh.md) | Select and open a PDF file in your home directory with `evince` |
| [playlist_player.xsh](docs/scripts/playlist_player.xsh.md) | Script to pick and play a playlist using `cmus`. |
| [playlist_randomizer.xsh](docs/scripts/playlist_randomizer.xsh.md) | Script to shuffle and play a playlist of albums in cmus. |
| [ppm-color-reducer](docs/scripts/ppm-color-reducer.md) | Reduce the number of colors in a PPM image using a specified palette. |
| [pyman.sh](docs/scripts/pyman.sh.md) | Navigate and explore Python documentation and site-packages interactively. |
| [qtile_dice_group.py](docs/scripts/qtile_dice_group.py.md) | Switches to the complementary group in Qtile, based on a dice concept |
| [qtile_window_to_group_and_switch.py](docs/scripts/qtile_window_to_group_and_switch.py.md) | Script to move and switch the current window to the next or previous group in Qtile. |
| [quick-pass.sh](docs/scripts/quick-pass.sh.md) | A script to quickly access and copy GPG-encrypted passwords from a password store. |
| [qutebrowser-modify-source-bookmarks.sh](docs/scripts/qutebrowser-modify-source-bookmarks.sh.md) | A script to sync Qutebrowser bookmarks and sessions between local and chezmoi directories. |
| [random_album.xsh](docs/scripts/random_album.xsh.md) | Selects a random album from cmus library and plays it using cmus. |
| [random_wallpapers.xsh](docs/scripts/random_wallpapers.xsh.md) | Selects and sets a random wallpaper from a specified folder for use with `feh`. |
| [read_the_fucking_manual.sh](docs/scripts/read_the_fucking_manual.sh.md) | Script to retrieve the most searched manual entries using `man` or `batman`. |
| [rgfzf.sh](docs/scripts/rgfzf.sh.md) | Integrate `ripgrep` and `fzf` to search text and open files in `vim` |
| [sandisk_music_transfert.py](docs/scripts/sandisk_music_transfert.py.md) | Transfers music files to a Sandisk media player while managing storage capacity and file formats. |
| [script_launcher.sh](docs/scripts/script_launcher.sh.md) | Launch and manage scripts via an interactive fzf interface, with source and documentation preview capabilities. |
| [select_script](docs/scripts/select_script.md) | Utility to select and execute scripts from cached data using `rofi` |
| [setting-up-syncs.sh](docs/scripts/setting-up-syncs.sh.md) | Automates syncing of various directories to a Mega backup location based on the hostname. |
| [shell_history_info.sh](docs/scripts/shell_history_info.sh.md) | Analyzes shell history files to find frequent lines, words, or characters |
| [show-all-qutebrowser-scripts.sh](docs/scripts/show-all-qutebrowser-scripts.sh.md) | Display the scripts associated with Qutebrowser |
| [show_keyboard_layout.py](docs/scripts/show_keyboard_layout.py.md) | A script to display a visual representation of a keyboard layout in the terminal. |
| [songlauncher.sh](docs/scripts/songlauncher.sh.md) | Script to play a song using `cmus` with a `dmenu` interface. |
| [speach-to-text.py](docs/scripts/speach-to-text.py.md) | Records audio through a preferred device and transcribes it using OpenAI's Whisper. |
| [sync-repo-simple.py](docs/scripts/sync-repo-simple.py.md) | Automates syncing a local git repository with its remote counterpart. |
| [sync-repo-simple.sh](docs/scripts/sync-repo-simple.sh.md) | A script to synchronize a local Git repository with remote changes. |
| [sync-repo.py](docs/scripts/sync-repo.py.md) | A script to automate syncing a Git repository with remote branches. |
| [sync-repo.sh](docs/scripts/sync-repo.sh.md) | A script for syncing a Git repository with improved user interaction and error handling. |
| [terminal_with_command.sh](docs/scripts/terminal_with_command.sh.md) | Opens a floating terminal to run a specified command and view its output |
| [tmux-help.py](docs/scripts/tmux-help.py.md) | A script to search and display helpful information from the tmux manpage. |
| [toggle_picom.sh](docs/scripts/toggle_picom.sh.md) | Toggles the picom compositor on and off. |
| [transform_symlink.sh](docs/scripts/transform_symlink.sh.md) | A Bash script utility to convert symbolic links into actual copies of their target files or directories. It operates both interactively and non-interactively using arguments. |
| [try_the_bat_suit.sh](docs/scripts/try_the_bat_suit.sh.md) | A script leveraging `bat` and `fzf` for file preview and selection |
| [tui-gpt.py](docs/scripts/tui-gpt.py.md) | A terminal-based interactive application to query an AI model. |
| [update_env.xsh](docs/scripts/update_env.xsh.md) | Extracts and updates environment variables related to API keys into a `.env` file |
| [utils_update_symlinks.sh](docs/scripts/utils_update_symlinks.sh.md) | Automate the creation and management of symlinks in your local bin directory, ensuring old links are removed. |
| [vimwiki.sh](docs/scripts/vimwiki.sh.md) | Opens a note from the `~/notes` directory in Vim using `fzf` for selection. |
| [vox.py](docs/scripts/vox.py.md) | Python script to list and filter Vox amplifier options. |
| [wallpaper.sh](docs/scripts/wallpaper.sh.md) | Script to set and manage desktop wallpapers randomly or manually on Arch Linux with qtile WM. |
| [you_are_not_documented.sh](docs/scripts/you_are_not_documented.sh.md) | A utility script to find scripts without inline documentation within a specified directory. |

<!-- table_end -->
