# Scripts

## Description

<!-- llm_generated_output_start -->

The repository features a comprehensive suite of scripts designed to enhance productivity and streamline interactions with various tools and environments on Arch Linux, particularly for users operating the Qtile window manager. This compelling collection encompasses scripts that automate tasks ranging from version control, file management, multimedia handling, and personalization of the user interface.

## Overview of Script Categories:

- **Git Management**: Scripts like [sync-repo.py](docs/scripts/sync-repo.py.md) and [sync-repo-simple.py](docs/scripts/sync-repo-simple.py.md) automate the synchronization of local repositories with remote counterparts. They handle merging, conflict resolutions, and provide essential summaries of their actions, catering to developers who require seamless collaboration with version control systems.

- **Audio & Music Management**: The repository includes a variety of scripts to manage and manipulate music, such as [albumplayer.xsh](docs/scripts/albumplayer.xsh.md), which facilitates playing selected albums using `cmus`, and [mechen_music_transfert.py](docs/scripts/mechen_music_transfert.py.md) for transferring music files to a different storage device. These tools enhance media playback experience and ensure efficient file organization.

- **File Handling & Editing**: Scripts like [fzf-file-manager.sh](docs/scripts/fzf-file-manager.sh.md) and [vimwiki.sh](docs/scripts/vimwiki.sh.md) allow users to interactively manage files, edit notes, and search through directories using fuzzy finding capabilities, lending efficiency to file navigation and editing tasks.

- **User Interface Personalization**: Several scripts in the repository are designed to improve the user experience through aesthetic customization, including the [toggle_picom.sh](docs/scripts/toggle_picom.sh.md) that toggles the compositor, and [random_wallpapers.xsh](docs/scripts/random_wallpapers.xsh.md) which selects random wallpapers, enriching the visual workspace.

- **Utility Scripts**: There are various scripts handling simpler tasks such as the [generate_commit_message.sh](docs/scripts/generate_commit_message.sh.md), [get_window_thumbnails.sh](docs/scripts/get-window-thumbnails.sh.md) to capture window snapshots, and helpful utilities like [list_process.sh](docs/scripts/list_process.sh.md) for interactive system management.

- **Dmenu/Fzf Enhancements**:1
 A number of scripts such as [dmenu_run_scripts.py](docs/scripts/dmenu_run_scripts.py.md) and [fzfmenu_run.sh](docs/scripts/fzfmenu_run.sh.md) utilize `fzf` or `dmenu` to provide a sophisticated interface for executing commands or selecting files, significantly enhancing terminal-based workflows.

## Highlights:
- The integration of **fuzzy finding** tools like `fzf` and **interactive scripts** provides a dynamic experience for users.
- **Error handling** and user feedback are emphasized in many scripts to ensure smoother operations and troubleshooting.
- The scripts encourage **modularity** and **interaction**, allowing for easy integration into the user’s daily workflow and bespoke setups.

## Conclusion:
This repository stands as a robust toolbox for Arch Linux users seeking to automate mundane tasks, streamline their environments, and customize their experiences. By leveraging the power of Qtile, the potential of the underlying shell scripts can be fully realized, inviting further enhancements and adaptations tailored to individual user preferences.

<!-- llm_generated_output_end -->

*Note: This section was entirely generated with gpt-4o-mini*

## [Index](docs/index.md)

<!-- table_start -->

| File | Description |
| --- | --- |
| [albumplayer.xsh](docs/scripts/albumplayer.xsh.md) | Play an album using cmus and dmenu integration |
| [ansi-cheatsheet.sh](docs/scripts/ansi-cheatsheet.sh.md) | Generates a cheatsheet for ANSI escape codes |
| [ansi8bit2rgb_hex.py](docs/scripts/ansi8bit2rgb_hex.py.md) | Converts ANSI 8-bit color codes to RGB or Hexadecimal format with options for colorized output. |
| [ardour-open.sh](docs/scripts/ardour-open.sh.md) | Opens the most recently modified Ardour session with a preview option through `fzf`. |
| [chatgpt-all-scripts-describer.py](docs/scripts/chatgpt-all-scripts-describer.py.md) | A Python script to generate documentation for other scripts using OpenAI's GPT API. |
| [chezmoi_on_a_new_system.sh](docs/scripts/chezmoi_on_a_new_system.sh.md) | A script to initialize and apply Chezmoi configurations for a new system |
| [citeboard.sh](docs/scripts/citeboard.sh.md) | Script to find a paper and either open it or copy its citation. |
| [closest_colors.py](docs/scripts/closest_colors.py.md) | A script to find and display the closest ANSI color matches to a list of provided hex colors |
| [colormap_from_text.sh](docs/scripts/colormap_from_text.sh.md) | Extracts hex or RGB color codes from configuration files |
| [command_prompt.sh](docs/scripts/command_prompt.sh.md) | Script to launch a command with history suggestions using `fzf` |
| [count_tokens_with_tiktoken.py](docs/scripts/count_tokens_with_tiktoken.py.md) | Script to count tokens in text using the TikToken library for specific NLP models. |
| [create_cover_art.sh](docs/scripts/create_cover_art.sh.md) | Generates a cover art from .wav file spectrogram with resizing. |
| [desk_fzf.sh](docs/scripts/desk_fzf.sh.md) | Script to find and launch `.desktop` files using `fzf`. |
| [display_markdown.py](docs/scripts/display_markdown.py.md) | Script to display markdown files in the terminal with styling |
| [dmenu_run_scripts.py](docs/scripts/dmenu_run_scripts.py.md) | Launch scripts using `rofi` for selection, filtered by `xonsh` |
| [edit_chezmoi_cfg_files.sh](docs/scripts/edit_chezmoi_cfg_files.sh.md) | A script to select and edit Chezmoi-managed configuration files using fzf |
| [editor.sh](docs/scripts/editor.sh.md) | Quickly edit files by searching with `fzf`. |
| [fix-markdown-links.sh](docs/scripts/fix-markdown-links.sh.md) | Adjust relative paths in markdown links to start from a base directory |
| [flexoki_show.sh](docs/scripts/flexoki_show.sh.md) | Display script for a custom color scheme in terminal using Bash. |
| [fzf-file-manager.sh](docs/scripts/fzf-file-manager.sh.md) | Interactive file manager using fzf with advanced features. |
| [fzf_albumlauncher.xsh](docs/scripts/fzf_albumlauncher.xsh.md) | Choose an album with `fzf` and play it with `cmus`. |
| [fzf_songlauncher.sh](docs/scripts/fzf_songlauncher.sh.md) | A simple script to play a song using `cmus`, filtered through `fzf` |
| [fzfmenu.sh](docs/scripts/fzfmenu.sh.md) | A helper script to replicate `dmenu` functionality using `fzf` and `xterm`. |
| [fzfmenu_run.sh](docs/scripts/fzfmenu_run.sh.md) | A script to replace `dmenu_run` with `fzf` and a floating `xterm` terminal |
| [generate_commit_message.sh](docs/scripts/generate_commit_message.sh.md) | Script to generate commit messages using OpenAI's GPT-4o-mini |
| [get-window-thumbnails.sh](docs/scripts/get-window-thumbnails.sh.md) | Creates thumbnails of currently open windows on your qtile environment. |
| [get_hyperlinks_in_folder.py](docs/scripts/get_hyperlinks_in_folder.py.md) | Extract and visualize internal hyperlinks from Markdown files in a folder |
| [get_repos_present_on_host.sh](docs/scripts/get_repos_present_on_host.sh.md) | Script to list Git repositories present on the current host. |
| [get_scripts_relations.py](docs/scripts/get_scripts_relations.py.md) | Visualizes dependencies among scripts in a directory |
| [git_cd.sh](docs/scripts/git_cd.sh.md) | Script to quickly change directories to a Git repository. |
| [git_clone_by_author-repo.sh](docs/scripts/git_clone_by_author-repo.sh.md) | Clone a Git repository by specifying the developer/package format. |
| [git_update_all_other_repos.sh](docs/scripts/git_update_all_other_repos.sh.md) | Automatically updates all git repositories found under a specified directory using HTTPS. |
| [grub-tune-to-audio-python.py](docs/scripts/grub-tune-to-audio-python.py.md) | Converts GRUB tune strings into audio files. |
| [help-pastel.sh](docs/scripts/help-pastel.sh.md) | Enhanced help command for `pastel` with preview features using `fzf`. |
| [improved-fzfmenu.sh](docs/scripts/improved-fzfmenu.sh.md) | Enhanced fzf integration with Alacritty, supports piping output |
| [install_dependencies.sh](docs/scripts/install_dependencies.sh.md) | Installs a list of necessary packages using `paru` |
| [interactive_git_sync.sh](docs/scripts/interactive_git_sync.sh.md) | Script to synchronize multiple repositories interactively using `fzf`. |
| [json_to_markdown.py](docs/scripts/json_to_markdown.py.md) | Convert JSON content to a formatted markdown file. |
| [jupyter_new_notebook.xsh](docs/scripts/jupyter_new_notebook.xsh.md) | Script to create and open a Jupyter notebook in Chromium |
| [keyboard-help.sh](docs/scripts/keyboard-help.sh.md) | Displays keyboard layout using a Python script in a floating terminal |
| [launch_tmux_with_music_player.sh](docs/scripts/launch_tmux_with_music_player.sh.md) | Script to create a tmux session for running the music player cmus |
| [list_process.sh](docs/scripts/list_process.sh.md) | Lists all running service units using `systemctl` |
| [llama-all-scripts-describer.py](docs/scripts/llama-all-scripts-describer.py.md) | Automate the generation of Markdown documentation for scripts using Llama 3.1. |
| [llm-script-describer.py](docs/scripts/llm-script-describer.py.md) | Automates documentation generation for scripts, creating markdown files |
| [m3u_creator.sh](docs/scripts/m3u_creator.sh.md) | Creates an M3U playlist file from all files in the current directory. |
| [mechen_music_transfert.py](docs/scripts/mechen_music_transfert.py.md) | Custom script to copy music to Mechen |
| [megacmd_launch_tmux.sh](docs/scripts/megacmd_launch_tmux.sh.md) | Launches MEGA CMD within a detached tmux session. |
| [megaignore_editor.sh](docs/scripts/megaignore_editor.sh.md) | Interactive editor for .megaignore files using `fzf` and `nvim`. |
| [midi2arch.xsh](docs/scripts/midi2arch.xsh.md) | Transform a MIDI controller into a keyboard or script launcher for Arch Linux |
| [minimal-browser.py](docs/scripts/minimal-browser.py.md) | A simple Python-based browser for rendering local HTML files |
| [new_script_creator.sh](docs/scripts/new_script_creator.sh.md) | Automates script creation with templating based on file extension |
| [next_album.xsh](docs/scripts/next_album.xsh.md) | Skip to the next album in the CMUS music player |
| [nvim_in_new_terminal.sh](docs/scripts/nvim_in_new_terminal.sh.md) | Opens a floating terminal to edit a file with Neovim |
| [obsidian-vault-selector.sh](docs/scripts/obsidian-vault-selector.sh.md) | Opens and previews Obsidian vaults using improved FZF menu |
| [obsidian.xsh](docs/scripts/obsidian.xsh.md) | Quickly open an Obsidian vault using a menu-driven interface. |
| [open_url_in_instance.sh](docs/scripts/open_url_in_instance.sh.md) | Opens a URL in an existing Qutebrowser instance or starts a new one. |
| [openwebui-launcher.sh](docs/scripts/openwebui-launcher.sh.md) | Script to launch and manage the Open WebUI with `qutebrowser`. |
| [ousse-update.sh](docs/scripts/ousse-update.sh.md) | Centralized update script for multiple database paths on a Linux system |
| [pacman-fuzzy-search.sh](docs/scripts/pacman-fuzzy-search.sh.md) | A script for enhanced fuzzy searching of Arch Linux packages using `paru` and `fzf`. |
| [pdfopener.sh](docs/scripts/pdfopener.sh.md) | Open a PDF file from the home directory using `evince` with `dmenu` for selection |
| [playlist_player.xsh](docs/scripts/playlist_player.xsh.md) | Select and play a playlist using `cmus` and `dmenu` on Xonsh shell |
| [playlist_randomizer.xsh](docs/scripts/playlist_randomizer.xsh.md) | Pick a playlist of albums and play in random order using cmus |
| [ppm-color-reducer](docs/scripts/ppm-color-reducer.md) | A script to reduce the color palette of a PPM image using a custom palette file. |
| [pyman.sh](docs/scripts/pyman.sh.md) | A script to browse Python documentation topics, keywords, built-in functions, and site-packages using `fzf`. |
| [qtile_dice_group.py](docs/scripts/qtile_dice_group.py.md) | Swiftly switches between complementary screen groups in Qtile. |
| [qtile_window_to_group_and_switch.py](docs/scripts/qtile_window_to_group_and_switch.py.md) | Move the current window to the next or previous group and switch to it. |
| [quick-pass.sh](docs/scripts/quick-pass.sh.md) | Interactive script to quickly search and manage passwords with `pass` |
| [qutebrowser-modify-source-bookmarks.sh](docs/scripts/qutebrowser-modify-source-bookmarks.sh.md) | Script to sync Qutebrowser bookmarks and sessions with Chezmoi |
| [random_album.xsh](docs/scripts/random_album.xsh.md) | Selects a random album from your music library and plays it with `cmus` |
| [random_wallpapers.xsh](docs/scripts/random_wallpapers.xsh.md) | Selects a random wallpaper from a specified directory of images |
| [read_the_fucking_manual.sh](docs/scripts/read_the_fucking_manual.sh.md) | Lists and analyzes the most searched manual entries. |
| [rgfzf.sh](docs/scripts/rgfzf.sh.md) | A script combining ripgrep and fzf to search files and open results in Vim. |
| [sandisk_music_transfert.py](docs/scripts/sandisk_music_transfert.py.md) | Script to transfer and manage music files on a Sandisk media player |
| [script_launcher.sh](docs/scripts/script_launcher.sh.md) | Interactive script launcher using `fzf` for elegant script execution. |
| [select_script](docs/scripts/select_script.md) | A tool to select and execute scripts from a cached list using `rofi`. |
| [setting-up-syncs.sh](docs/scripts/setting-up-syncs.sh.md) | Automate the setup of folder syncs with Mega based on hostname |
| [shell_history_info.sh](docs/scripts/shell_history_info.sh.md) | Analyze and extract the most frequent lines, words, or characters from shell history files. |
| [show-all-qutebrowser-scripts.sh](docs/scripts/show-all-qutebrowser-scripts.sh.md) | List and display scripts bundled with qutebrowser |
| [show_keyboard_layout.py](docs/scripts/show_keyboard_layout.py.md) | Simple script to display a custom keyboard layout design |
| [songlauncher.sh](docs/scripts/songlauncher.sh.md) | Play a song using `cmus` and `dmenu` for interactive selection |
| [speach-to-text.py](docs/scripts/speach-to-text.py.md) | Record audio and transcribe it using OpenAI's Whisper model |
| [sync-repo-simple.py](docs/scripts/sync-repo-simple.py.md) | A script to automate synchronization of a local git repository with its remote counterpart |
| [sync-repo-simple.sh](docs/scripts/sync-repo-simple.sh.md) | Automates syncing a git repository, handling conflicts, and providing sync summaries. |
| [sync-repo.py](docs/scripts/sync-repo.py.md) | A script to automate syncing of a local git repository with its remote counterpart, handling stashing, fetching, merging, and conflict resolution. |
| [sync-repo.sh](docs/scripts/sync-repo.sh.md) | Automates synchronization of a Git repository with support for conflict handling. |
| [terminal_with_command.sh](docs/scripts/terminal_with_command.sh.md) | Opens a floating terminal window to execute a specified command. |
| [tmux-help.py](docs/scripts/tmux-help.py.md) | A script to provide useful assistance and search functionalities for tmux commands and sections. |
| [toggle_picom.sh](docs/scripts/toggle_picom.sh.md) | Toggles the `picom` compositor on or off. |
| [transform_symlink.sh](docs/scripts/transform_symlink.sh.md) | Convert symbolic links to copies of their targets. |
| [try_the_bat_suit.sh](docs/scripts/try_the_bat_suit.sh.md) | Dynamic file previewer using `bat` and `fzf` for code files with syntax highlighting. |
| [tui-gpt.py](docs/scripts/tui-gpt.py.md) | A terminal-based GPT chat interface resembling 'Mother' from the Aliens movies. |
| [update_env.xsh](docs/scripts/update_env.xsh.md) | Updates the environment file to store API keys automatically |
| [utils_update_symlinks.sh](docs/scripts/utils_update_symlinks.sh.md) | Automates symlink updates, logs activity, manages potential conflicts. |
| [vimwiki.sh](docs/scripts/vimwiki.sh.md) | Open a note in vim with fzf for easy selection |
| [vox.py](docs/scripts/vox.py.md) | A script to list and describe Vox amplifier settings and modes. |
| [wallpaper.sh](docs/scripts/wallpaper.sh.md) | Sets a random, previously selected, or GUI-chosen wallpaper from your collection |
| [you_are_not_documented.sh](docs/scripts/you_are_not_documented.sh.md) | A script that finds scripts without inline docs in a specified directory |

<!-- table_end -->
