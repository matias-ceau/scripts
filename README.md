# Scripts

## Description

<!-- llm_generated_output_start -->

The repository contains a diverse collection of shell and Python scripts, tailored for enhancing workflows on an Arch Linux system with the Qtile window manager. These scripts serve various purposes, from managing audio files and Git repositories to document generation and providing user-friendly interfaces for executing commands efficiently.

### Key Features of the Scripts

- **File and Audio Management**: Several scripts, such as [playlist_player.xsh](docs/scripts/playlist_player.xsh.md) and [fzf_albumlauncher.xsh](docs/scripts/fzf_albumlauncher.xsh.md), allow users to select and play music playlists using `cmus`, leveraging `fzf` for quick selection and user interaction. Moreover, scripts like [m3u_creator.sh](docs/scripts/m3u_creator.sh.md) help create playlist files effortlessly.

- **Documentation Automation**: The repository includes tools like [llm-script-describer.py](docs/scripts/llm-script-describer.py.md) and [chatgpt-all-scripts-describer.py](docs/scripts/chatgpt-all-scripts-describer.py.md) that leverage AI models to generate markdown documentation for scripts. This assists maintainers in keeping documentation current and informative without manual overhead.

- **Markdown and Text Manipulation**: There are utility scripts like [fix-markdown-links.sh](docs/scripts/fix-markdown-links.sh.md) designed to standardize markdown links across files and [json_to_markdown.py](docs/scripts/json_to_markdown.py.md) for converting JSON files into a markdown format, simplifying the management of documentation formats.

- **Interactive Selection and Execution**: Scripts like [fzfmenu_run.sh](docs/scripts/fzfmenu_run.sh.md) and [select_script](docs/scripts/select_script.md) provide an interactive interface for selecting and executing scripts or commands, enhancing the user experience by streamlining access and execution through intuitive menus.

- **System Utilities**: Other scripts facilitate system tasks, including [get_repos_present_on_host.sh](docs/scripts/get_repos_present_on_host.sh.md) which scans for Git repositories and [toggle_picom.sh](docs/scripts/toggle_picom.sh.md) that toggles the picom compositor on and off, offering users control over their desktop environment.

- **Visual Aids**: For users needing visual context, scripts like [get_hyperlinks_in_folder.py](docs/scripts/get_hyperlinks_in_folder.py.md) generate graphs of hyperlinks in markdown files, and [rand_wallpapers.xsh](docs/scripts/rand_wallpapers.xsh.md) selects a random wallpaper, enhancing the aesthetic of the user’s environment.

### Usage Integration

The scripts are designed to be run directly from the command line with necessary command-line arguments as specified in individual documentation. They can also be integrated into the Qtile window manager via custom keybindings for quick access, significantly boosting productivity through streamlined workflows. The flexibility of running these scripts makes them suitable for both interactive sessions and automated scripts through cron jobs or other scheduling mechanisms.

### Conclusion

Through this comprehensive suite of scripts, an Arch Linux user, particularly one using Qtile, can efficiently manage files, automate documentation, handle multimedia playback, and control system settings seamlessly. The collection encourages an organized and productive environment, allowing more focus on task execution rather than on managing the execution process itself.

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
| [count_tokens_with_tiktoken.py](docs/scripts/count_tokens_with_tiktoken.py.md) | This script counts the number of tokens in a file using the `tiktoken` library. |
| [create_cover_art.sh](docs/scripts/create_cover_art.sh.md) | Generates cover art from audio file spectrograms. |
| [display_markdown.py](docs/scripts/display_markdown.py.md) | Script to display markdown files using the Rich library with customizable styles and width. |
| [dmenu_run_scripts.py](docs/scripts/dmenu_run_scripts.py.md) | A Python script to display executable scripts and run selected ones. |
| [edit_chezmoi_cfg_files.sh](docs/scripts/edit_chezmoi_cfg_files.sh.md) | A script to browse and edit Chezmoi-managed files with optional synchronization |
| [editor.sh](docs/scripts/editor.sh.md) | Script to rapidly edit files using `fzf` for search and `nvim` for editing, suitable for various directory contexts. |
| [fix-markdown-links.sh](docs/scripts/fix-markdown-links.sh.md) | A script to ensure that markdown links have consistent leading slashes for relative paths. |
| [flexoki_show.sh](docs/scripts/flexoki_show.sh.md) | Displays a table of colors with HEX, RGB, and descriptions |
| [fzf-file-manager.sh](docs/scripts/fzf-file-manager.sh.md) | A script to enhance file browsing with fzf and color-enhanced listings |
| [fzf_albumlauncher.xsh](docs/scripts/fzf_albumlauncher.xsh.md) | Choose an album with fzf and play it with cmus |
| [fzf_songlauncher.sh](docs/scripts/fzf_songlauncher.sh.md) | Select and play a song using `cmus`, with `fzf` for interactive selection. |
| [fzfmenu.sh](docs/scripts/fzfmenu.sh.md) | A lightweight alternative to dmenu using `fzf` within an `xterm` terminal. |
| [fzfmenu_run.sh](docs/scripts/fzfmenu_run.sh.md) | Dmenu run replacement using `fzf` within a floating xterm terminal |
| [get-window-thumbnails.sh](docs/scripts/get-window-thumbnails.sh.md) | Captures and resizes screenshots of open windows on your desktop. |
| [get_hyperlinks_in_folder.py](docs/scripts/get_hyperlinks_in_folder.py.md) | A script to create a directed graph of hyperlinks within Markdown notes. |
| [get_repos_present_on_host.sh](docs/scripts/get_repos_present_on_host.sh.md) | Script to list and document Git repositories present on the host machine. |
| [get_scripts_relations.py](docs/scripts/get_scripts_relations.py.md) | Visualizes relationships between scripts in a directory using a graph. |
| [git_cd.sh](docs/scripts/git_cd.sh.md) | Quick navigation to Git directories using `locate`, `eza`, and `fzf` |
| [git_clone_by_author-repo.sh](docs/scripts/git_clone_by_author-repo.sh.md) | Clone a GitHub repository by specifying the developer and package name with an option for SSH or a local path. |
| [git_update_all_other_repos.sh](docs/scripts/git_update_all_other_repos.sh.md) | Update multiple Git repositories excluding personal ones |
| [grub-tune-to-audio-python.py](docs/scripts/grub-tune-to-audio-python.py.md) | Script to convert GRUB_INIT_TUNE string to an audio file (MP3 format) |
| [help-pastel.sh](docs/scripts/help-pastel.sh.md) | Enhances `pastel` command help with syntax highlighting and interactive selection. |
| [improved-fzfmenu.sh](docs/scripts/improved-fzfmenu.sh.md) | A customizable FZF menu utilizing Alacritty which can output piped data |
| [install_dependencies.sh](docs/scripts/install_dependencies.sh.md) | Automated script to install a list of necessary packages using `paru`. |
| [json_to_markdown.py](docs/scripts/json_to_markdown.py.md) | Convert JSON files to formatted Markdown documents |
| [jupyter_new_notebook.xsh](docs/scripts/jupyter_new_notebook.xsh.md) | Script to create a new Jupyter notebook and open it in Chromium on Arch Linux with qtile. |
| [keyboard-help.sh](docs/scripts/keyboard-help.sh.md) | Launches a floating terminal displaying keyboard layout information |
| [launch_tmux_with_music_player.sh](docs/scripts/launch_tmux_with_music_player.sh.md) | Script to create a new tmux session called music and open cmus inside |
| [list_process.sh](docs/scripts/list_process.sh.md) | This script lists all running system services in a sorted order. |
| [llama-all-scripts-describer.py](docs/scripts/llama-all-scripts-describer.py.md) | Script to document user scripts and manage their associations with symlink data. |
| [llm-script-describer.py](docs/scripts/llm-script-describer.py.md) | Automates the generation and maintenance of markdown documentation for scripts. |
| [m3u_creator.sh](docs/scripts/m3u_creator.sh.md) | Script to create an M3U playlist file from files in the current directory |
| [mechen_music_transfert.py](docs/scripts/mechen_music_transfert.py.md) | Automates syncing of unlistened music albums to a music player device. |
| [megacmd_launch_tmux.sh](docs/scripts/megacmd_launch_tmux.sh.md) | Script to run MEGAcmd in a detached Tmux session |
| [megaignore_editor.sh](docs/scripts/megaignore_editor.sh.md) | Interactive script to find and edit `.megaignore` files |
| [midi2arch.xsh](docs/scripts/midi2arch.xsh.md) | A script to transform a MIDI controller into a keyboard or script launcher. |
| [new_script_creator.sh](docs/scripts/new_script_creator.sh.md) | A script for creating and modifying user scripts with optional templating |
| [next_album.xsh](docs/scripts/next_album.xsh.md) | A script to skip to the next album in `cmus` |
| [nvim_in_new_terminal.sh](docs/scripts/nvim_in_new_terminal.sh.md) | Script to open a file with `nvim` in a floating terminal window. |
| [obsidian-vault-selector.sh](docs/scripts/obsidian-vault-selector.sh.md) | Bash script for selecting and opening an Obsidian vault efficiently |
| [obsidian.xsh](docs/scripts/obsidian.xsh.md) | Open any Obsidian vault interactively using `fzf` |
| [pacman-fuzzy-search.sh](docs/scripts/pacman-fuzzy-search.sh.md) | A script to perform a fuzzy search on packages using `paru` with a preview feature. |
| [pdfopener.sh](docs/scripts/pdfopener.sh.md) | Select and open a PDF file in your home directory with `evince` |
| [playlist_player.xsh](docs/scripts/playlist_player.xsh.md) | Script to pick and play a playlist using `cmus`. |
| [playlist_randomizer.xsh](docs/scripts/playlist_randomizer.xsh.md) | Script to shuffle and play a playlist of albums in cmus. |
| [ppm-color-reducer](docs/scripts/ppm-color-reducer.md) | Reduce the number of colors in a PPM image using a specified palette. |
| [pyman.sh](docs/scripts/pyman.sh.md) | Navigate and explore Python documentation and site-packages interactively. |
| [qtile_dice_group.py](docs/scripts/qtile_dice_group.py.md) | Switches to the complementary group in Qtile, based on a dice concept |
| [qtile_window_to_group_and_switch.py](docs/scripts/qtile_window_to_group_and_switch.py.md) | Script to move and switch the current window to the next or previous group in Qtile. |
| [quick-pass.sh](docs/scripts/quick-pass.sh.md) | Quickly select a password from your password store using `fzf`. |
| [qutebrowser-modify-source-bookmarks.sh](docs/scripts/qutebrowser-modify-source-bookmarks.sh.md) | Script to synchronize qutebrowser bookmarks and sessions with chezmoi. |
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
| [sync-repo.sh](docs/scripts/sync-repo.sh.md) | Script to synchronize a local git directory with its remote counterpart, utilizing color-coded output and optional formatting with external tools. |
| [terminal_with_command.sh](docs/scripts/terminal_with_command.sh.md) | Opens a floating terminal to run a specified command and view its output |
| [tmux-help.py](docs/scripts/tmux-help.py.md) | A script to search and display helpful information from the tmux manpage. |
| [toggle_picom.sh](docs/scripts/toggle_picom.sh.md) | Toggles the picom compositor on and off. |
| [transform_symlink.sh](docs/scripts/transform_symlink.sh.md) | A Bash script utility to convert symbolic links into actual copies of their target files or directories. It operates both interactively and non-interactively using arguments. |
| [try_the_bat_suit.sh](docs/scripts/try_the_bat_suit.sh.md) | A script leveraging `bat` and `fzf` for file preview and selection |
| [update_env.xsh](docs/scripts/update_env.xsh.md) | Extracts and updates environment variables related to API keys into a `.env` file |
| [utils_update_symlinks.sh](docs/scripts/utils_update_symlinks.sh.md) | Automate the creation and management of symlinks in your local bin directory, ensuring old links are removed. |
| [vimwiki.sh](docs/scripts/vimwiki.sh.md) | Opens a note from the `~/notes` directory in Vim using `fzf` for selection. |
| [vox.py](docs/scripts/vox.py.md) | Python script to list and filter Vox amplifier options. |
| [wallpaper.sh](docs/scripts/wallpaper.sh.md) | Script to set and manage desktop wallpapers randomly or manually on Arch Linux with qtile WM. |
| [you_are_not_documented.sh](docs/scripts/you_are_not_documented.sh.md) | A utility script to find scripts without inline documentation within a specified directory. |

<!-- table_end -->
