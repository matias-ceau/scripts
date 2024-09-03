# Scripts

## Description

<!-- llm_generated_output_start -->

The repository contains a diverse collection of Bash and Python scripts tailored for an Arch Linux environment using the Qtile window manager. Each script aims to enhance productivity by automating routine tasks, managing resources, and facilitating user interactions. Below is an overview of the repository's offerings:

- **Markdown and Documentation Utilities**: Scripts like [fix-markdown-links.sh](docs/scripts/fix-markdown-links.sh.md) provide functionalities such as fixing Markdown links and generating documentation for scripts using language models like OpenAI's API. The [llm-script-describer.py](docs/scripts/llm-script-describer.py.md) automates the generation of markdown documentation, making it easier to manage and maintain code references.

- **Music and Media Management**: Several scripts, including [m3u_creator.sh](docs/scripts/m3u_creator.sh.md) and [fzf_albumlauncher.xsh](docs/scripts/fzf_albumlauncher.xsh.md), help manage music collections by creating playlists or launching albums in the CMus music player. These scripts directly utilize features from tools like `fzf` or `cmus` to offer a streamlined user experience.

- **Script Execution and Management**: The repository contains various scripts like [editor.sh](docs/scripts/editor.sh.md) and [script_launcher.sh](docs/scripts/script_launcher.sh.md) that allow for selecting and executing scripts quickly. These scripts leverage `fzf` for fuzzy searching, thus simplifying the process of managing multiple scripts.

- **Wallpaper and Background Management**: Scripts such as [random_wallpapers.xsh](docs/scripts/random_wallpapers.xsh.md) and [wallpaper.sh](docs/scripts/wallpaper.sh.md) make it easy to change the desktop wallpaper from a pre-defined directory. These solutions leverage existing tools like `feh` and allow for both random and interactive selection of wallpapers.

- **File Operations and Management**: Several scripts are designed for managing files, whether it’s through copying, syncing, or creating symlinks. Scripts like [sync-repo.sh](docs/scripts/sync-repo.sh.md) provide functionalities for managing repositories, while [create_cover_art.sh](docs/scripts/create_cover_art.sh.md) focuses on generating visual content related to music files.

- **Customized Utilities**: The repository includes many utility scripts for various specific tasks—from opening PDFs with the [pdfopener.sh](docs/scripts/pdfopener.sh.md) script to managing citations with the [citeboard.sh](docs/scripts/citeboard.sh.md) script. Each of these is crafted to simplify workflows tailored to the user’s needs.

- **Interactive and Command-Line Tools**: The scripts utilize interactive elements with `dmenu` and `fzf`, enhancing user experience through GUI interactions within a terminal. Scripts such as [fzf_menu_run.sh](docs/scripts/fzfmenu_run.sh.md) allow users to launch applications or scripts seamlessly using fuzzy matching.

The repository effectively combines automation with user-friendly features, making it a valuable resource for enhancing daily operations within an Arch Linux and Qtile setup. Through efficient user interface interactions and streamlined processes, users can significantly augment their productivity while managing various aspects of their filesystem and applications.

<!-- llm_generated_output_end -->

*Note: This section was entirely generated with gpt-4o-mini*

## [Index](docs/index.md)

<!-- table_start -->

| File | Description |
| --- | --- |
| [albumplayer.xsh](docs/scripts/albumplayer.xsh.md) | Play an album using cmus with random selection of other albums |
| [ardour-open.sh](docs/scripts/ardour-open.sh.md) | Script to search and open Ardour session files. |
| [chatgpt-all-scripts-describer.py](docs/scripts/chatgpt-all-scripts-describer.py.md) | Generates GitHub markdown documentation for scripts using GPT-4o. |
| [chezmoi_on_a_new_system.sh](docs/scripts/chezmoi_on_a_new_system.sh.md) | Automates the setup of Chezmoi on a new Arch Linux system. |
| [citeboard.sh](docs/scripts/citeboard.sh.md) | A script to find and manage paper citations from your bibliography. |
| [colormap_from_text.sh](docs/scripts/colormap_from_text.sh.md) | Simple script that extracts color palettes from config files |
| [command_prompt.sh](docs/scripts/command_prompt.sh.md) | Launch a command with history suggestions using fzf. |
| [count_tokens_with_tiktoken.py](docs/scripts/count_tokens_with_tiktoken.py.md) | A Python script to count the number of tokens in a text file using the `tiktoken` library. |
| [create_cover_art.sh](docs/scripts/create_cover_art.sh.md) | Create a cover art based on file spectrogram. |
| [dmenu_run_scripts.py](docs/scripts/dmenu_run_scripts.py.md) | A script to execute selected scripts using rofi with options from xonsh. |
| [edit_chezmoi_cfg_files.sh](docs/scripts/edit_chezmoi_cfg_files.sh.md) | A script for editing and managing Chezmoi configuration files. |
| [editor.sh](docs/scripts/editor.sh.md) | Edit files from the shell using fzf with customizable search options. |
| [fix-markdown-links.sh](docs/scripts/fix-markdown-links.sh.md) | A script to convert markdown links to be relative to a specified base directory. |
| [flexoki_show.sh](docs/scripts/flexoki_show.sh.md) | Display a formatted chart of colors with HEX, RGB, and names. |
| [fzf_albumlauncher.xsh](docs/scripts/fzf_albumlauncher.xsh.md) | Launches and plays selected albums using fzf and cmus. |
| [fzf_songlauncher.sh](docs/scripts/fzf_songlauncher.sh.md) | Play a song with cmus, choosing it with fzf |
| [fzfmenu.sh](docs/scripts/fzfmenu.sh.md) | A helper script to create a fuzzy finder menu using `fzf` within `xterm`. |
| [fzfmenu_run.sh](docs/scripts/fzfmenu_run.sh.md) | A lightweight dmenu replacement using fzf within a floating xterm terminal. |
| [get_repos_present_on_host.sh](docs/scripts/get_repos_present_on_host.sh.md) | A script to list Git repositories present on the current host. |
| [git_clone_by_author-repo.sh](docs/scripts/git_clone_by_author-repo.sh.md) | A script for cloning Git repositories by specifying developer and package. |
| [grub-tune-to-audio-python.py](docs/scripts/grub-tune-to-audio-python.py.md) | Convert GRUB_INIT_TUNE strings to audio files. |
| [improved-fzfmenu.sh](docs/scripts/improved-fzfmenu.sh.md) | A script to launch FZF in Alacritty, with optional output piping. |
| [install_dependencies.sh](docs/scripts/install_dependencies.sh.md) | Script to install essential packages on Arch Linux using pacman. |
| [jupyter_new_notebook.xsh](docs/scripts/jupyter_new_notebook.xsh.md) | Create a new Jupyter notebook and open it in Chromium. |
| [keyboard-help.sh](docs/scripts/keyboard-help.sh.md) | Launches an xterm window displaying the current keyboard layout. |
| [launch_tmux_with_music_player.sh](docs/scripts/launch_tmux_with_music_player.sh.md) | Script to create a new tmux session called music and open cmus. |
| [list_process.sh](docs/scripts/list_process.sh.md) | A simple script to list all running services sorted by their status. |
| [llama-all-scripts-describer.py](docs/scripts/llama-all-scripts-describer.py.md) | Automatically generates GitHub documentation for scripts using Llama 3.1. |
| [llm-script-describer.py](docs/scripts/llm-script-describer.py.md) | Generate GitHub markdown documentation from user scripts. |
| [m3u_creator.sh](docs/scripts/m3u_creator.sh.md) | Create an m3u file from files in the current directory |
| [mechen_music_transfert.py](docs/scripts/mechen_music_transfert.py.md) | Custom script to copy music to Mechen |
| [megacmd_launch_tmux.sh](docs/scripts/megacmd_launch_tmux.sh.md) | Launches a new TMUX session for MegaCMD. |
| [megaignore_editor.sh](docs/scripts/megaignore_editor.sh.md) | A script to manage and edit `.megaignore` files using `fzf` and `nvim`. |
| [midi2arch.xsh](docs/scripts/midi2arch.xsh.md) | Transform a MIDI controller into a keyboard/script launcher. |
| [new_script_creator.sh](docs/scripts/new_script_creator.sh.md) | A simple bash script to create new scripts quickly. |
| [next_album.xsh](docs/scripts/next_album.xsh.md) | Skip to the next album in CMUS music player. |
| [nvim_in_new_terminal.sh](docs/scripts/nvim_in_new_terminal.sh.md) | Opens a floating terminal to edit a file with Neovim. |
| [obsidian-vault-selector.sh](docs/scripts/obsidian-vault-selector.sh.md) | Script to easily open any Obsidian vault from the terminal |
| [obsidian.xsh](docs/scripts/obsidian.xsh.md) | Open any Obsidian vault from your PKM directory |
| [pdfopener.sh](docs/scripts/pdfopener.sh.md) | A script to select and open any PDF file from the home folder using Evince. |
| [playlist_player.xsh](docs/scripts/playlist_player.xsh.md) | A simple script to pick and play a music playlist using cmus |
| [playlist_randomizer.xsh](docs/scripts/playlist_randomizer.xsh.md) | Randomly selects and plays a playlist of albums in cmus. |
| [ppm-color-reducer](docs/scripts/ppm-color-reducer.md) | A command-line tool to reduce the color depth of PPM images using a custom palette. |
| [qtile_dice_group.py](docs/scripts/qtile_dice_group.py.md) | A script to switch between Qtile groups using a complementary number. |
| [quick-pass.sh](docs/scripts/quick-pass.sh.md) | Launches a fuzzy finder for passwords stored in a specified directory. |
| [qutebrowser-modify-source-bookmarks.sh](docs/scripts/qutebrowser-modify-source-bookmarks.sh.md) | Sync local Qutebrowser bookmarks with ChezMoi. |
| [random_album.xsh](docs/scripts/random_album.xsh.md) | Selects a random album and plays it with cmus. |
| [random_wallpapers.xsh](docs/scripts/random_wallpapers.xsh.md) | Pick random wallpaper from a specified wallpaper list |
| [read_the_fucking_manual.sh](docs/scripts/read_the_fucking_manual.sh.md) | A tool to view commonly searched manual entries. |
| [sandisk_music_transfert.py](docs/scripts/sandisk_music_transfert.py.md) | A script to transfer unlistened music albums to a Sandisk media player. |
| [script_launcher.sh](docs/scripts/script_launcher.sh.md) | Launch scripts with fzf and provides rich previews |
| [select_script](docs/scripts/select_script.md) | A C script that selects a chosen script using cached data from a CSV file. |
| [setting-up-syncs.sh](docs/scripts/setting-up-syncs.sh.md) | Script to sync user directories to a backup location using Mega.nz |
| [shell_history_info.sh](docs/scripts/shell_history_info.sh.md) | Retrieves frequent lines, words, or characters from shell history files. |
| [show_keyboard_layout.py](docs/scripts/show_keyboard_layout.py.md) | Displays a visual representation of the keyboard layout in terminal. |
| [songlauncher.sh](docs/scripts/songlauncher.sh.md) | Play a song with cmus using dmenu |
| [sync-repo.sh](docs/scripts/sync-repo.sh.md) | A script for syncing a Git repository, including fetching, pulling, and handling conflicts. |
| [terminal_with_command.sh](docs/scripts/terminal_with_command.sh.md) | Opens a floating terminal to run a command and see the output. |
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
