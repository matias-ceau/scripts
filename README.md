# Scripts

## Description

<!-- llm_generated_output_start -->

The repository encompasses a diverse range of scripts designed to enhance productivity and provide utilities tailored for music management, file handling, and system interactions on an Arch Linux environment with the Qtile window manager.

Among the notable scripts, there are tools for generating aesthetically pleasing cover art from audio file spectrograms, managing symlinks efficiently, and launching media players like `cmus` or `Ardour` with intuitive interfaces powered by tools like `dmenu` and `fzf`. The `playlist_randomizer` and `albumplayer` scripts allow users to seamlessly manage and play albums, enhancing the overall music experience through randomization and selection.

In addition to music-related functionalities, the repository includes scripts that facilitate routine tasks such as creating playlists, opening Jupyter notebooks, and toggling the Picom compositor. The `mechen_music_transfert` and `sandisk_music_transfert` scripts address specific needs for transferring music files to external devices by handling file formats and ensuring appropriate caching.

The scripts are characterized by interactive user interfaces, leveraging the likes of `dmenu` and `fzf`, making them efficient and user-friendly. Moreover, tools like `git_clone_by_author-repo` provide straightforward methods for cloning Git repositories with flexible options.

Overall, this repository is a comprehensive toolkit that caters to the various needs of users seeking to streamline their workflows through automation and simplified management of music and files. The scripts can be easily modified or extended, ensuring adaptability to individual user needs. Each script is accompanied by detailed documentation for ease of use and understanding, encapsulating a strong focus on user experience. 

For optimal functionality, it’s important to ensure that all dependencies, such as `sox`, `dmenu`, `imagemagick`, `fzf`, and `cmus`, are installed on your Arch Linux setup.

<!-- llm_generated_output_end -->

*Note: This section was entirely generated with gpt-4o-mini*

## [Index](docs/index.md)

<!-- table_start -->

| File | Description |
| --- | --- |
| [albumplayer.xsh](docs/scripts/albumplayer.xsh.md) | Play an album using cmus, with album selection via dmenu. |
| [ardour-open.sh](docs/scripts/ardour-open.sh.md) | A script to open an Ardour session selected from a list. |
| [chatgpt-all-scripts-describer.py](docs/scripts/chatgpt-all-scripts-describer.py.md) | Generates GitHub markdown documentation for user scripts using OpenAI's API. |
| [chezmoi_on_a_new_system.sh](docs/scripts/chezmoi_on_a_new_system.sh.md) | This script sets up the Chezmoi configuration management tool on a new system. |
| [citeboard.sh](docs/scripts/citeboard.sh.md) | A script to copy citations or open papers from a bibliography. |
| [colormap_from_text.sh](docs/scripts/colormap_from_text.sh.md) | Extracts unique color palettes from text files based on specified output formats. |
| [count_tokens_with_tiktoken.py](docs/scripts/count_tokens_with_tiktoken.py.md) | A script to count the number of tokens in a text file using tiktoken. |
| [create_cover_art.sh](docs/scripts/create_cover_art.sh.md) | Generate cover art from an audio file's spectrogram in PNG format. |
| [dmenu_run_scripts.py](docs/scripts/dmenu_run_scripts.py.md) | A script to select and run scripts using rofi, inspired by dmenu_run. |
| [dmenu_run_scripts.xsh](docs/scripts/dmenu_run_scripts.xsh.md) | Run user scripts in an interactive menu powered by dmenu/rofi. |
| [edit_chezmoi_cfg_files.sh](docs/scripts/edit_chezmoi_cfg_files.sh.md) | Launches an interactive file selector to edit Chezmoi-managed configuration. |
| [editor.sh](docs/scripts/editor.sh.md) | Edit any file in current folder or subfolders (recursively) |
| [fzf_albumlauncher.xsh](docs/scripts/fzf_albumlauncher.xsh.md) | Launches an album from Beet using fzf to interactively select and play it with cmus. |
| [fzf_songlauncher.sh](docs/scripts/fzf_songlauncher.sh.md) | Play a song with cmus (choose it with fzf) |
| [fzfmenu.sh](docs/scripts/fzfmenu.sh.md) | Launches an interactive fzf menu in an xterm window. |
| [fzfmenu_run.sh](docs/scripts/fzfmenu_run.sh.md) | A script to replace dmenu with fzf for launching applications in a floating terminal. |
| [get_repos_present_on_host.sh](docs/scripts/get_repos_present_on_host.sh.md) | This script collects Git repository paths from a specified directory and saves them to a file. |
| [git_clone_by_author-repo.sh](docs/scripts/git_clone_by_author-repo.sh.md) | A script to clone GitHub repositories via SSH or HTTPS based on user preferences. |
| [improved-fzfmenu.sh](docs/scripts/improved-fzfmenu.sh.md) | A script to launch an FZF menu in Alacritty terminal. |
| [jupyter_new_notebook.xsh](docs/scripts/jupyter_new_notebook.xsh.md) | This script creates a new Jupyter notebook and opens it in Chromium. |
| [launch_tmux_with_music_player.sh](docs/scripts/launch_tmux_with_music_player.sh.md) | A script to start a new tmux session for cmus music player. |
| [list_process.sh](docs/scripts/list_process.sh.md) | List and sort running services on a Linux system using systemctl. |
| [llama-all-scripts-describer.py](docs/scripts/llama-all-scripts-describer.py.md) | Generates GitHub documentation for scripts using Llama 3.1 model. |
| [llm-script-describer.py](docs/scripts/llm-script-describer.py.md) | Generate markdown documentation for user scripts with AI assistance. |
| [m3u_creator.sh](docs/scripts/m3u_creator.sh.md) | Create an m3u file from music files in the current directory. |
| [mechen_music_transfert.py](docs/scripts/mechen_music_transfert.py.md) | Custom script to copy music to the Mechen device. |
| [midi2arch.xsh](docs/scripts/midi2arch.xsh.md) | Transform a midi controller to a keyboard/script launcher |
| [next_album.xsh](docs/scripts/next_album.xsh.md) | Skip to the next album in cmus player and handle playlist management. |
| [obsidian.xsh](docs/scripts/obsidian.xsh.md) | Open a selected Obsidian vault using fzfmenu. |
| [pdfopener.sh](docs/scripts/pdfopener.sh.md) | A simple script to find and open PDF files using Evince. |
| [playlist_player.xsh](docs/scripts/playlist_player.xsh.md) | A script to select and play a playlist using cmus. |
| [playlist_randomizer.xsh](docs/scripts/playlist_randomizer.xsh.md) | Randomly selects and plays albums from a specified playlist in cmus. |
| [ppm-color-reducer](docs/scripts/ppm-color-reducer.md) | This script reduces the colors in a PPM image using a specified color palette. |
| [random_album.xsh](docs/scripts/random_album.xsh.md) | Select a random album and play it with cmus. |
| [random_wallpapers.xsh](docs/scripts/random_wallpapers.xsh.md) | Pick random wallpaper from a predefined list using Xonsh. |
| [sandisk_music_transfert.py](docs/scripts/sandisk_music_transfert.py.md) | Transfer music from the local library to a Sandisk media player. |
| [script_launcher.sh](docs/scripts/script_launcher.sh.md) | Run scripts with fzf in a user-friendly interface. |
| [select_script](docs/scripts/select_script.md) | A script that selects a chosen script using cached data and executes it. |
| [songlauncher.sh](docs/scripts/songlauncher.sh.md) | Plays a song with cmus using dmenu for song selection. |
| [sync-repo.sh](docs/scripts/sync-repo.sh.md) | A script to sync a Git repository with fetch, rebase, and handle conflicts. |
| [tmux-help.py](docs/scripts/tmux-help.py.md) | A script to assist with tmux command lookup and management. |
| [toggle_picom.sh](docs/scripts/toggle_picom.sh.md) | A script to toggle the Picom compositor on and off. |
| [transform_symlink.sh](docs/scripts/transform_symlink.sh.md) | Replace a symbolic link with its target file. |
| [update_env.xsh](docs/scripts/update_env.xsh.md) | Updates the `.env` file with API keys stored in the current environment. |
| [utils_update_symlinks.sh](docs/scripts/utils_update_symlinks.sh.md) | Creates and manages symlinks in ~/.local/bin, logging activity. |
| [vimwiki.sh](docs/scripts/vimwiki.sh.md) | Launch Vim with a selected note from the notes directory. |
| [vox.py](docs/scripts/vox.py.md) | List various Vox amp options and their descriptions. |
| [wallpaper.sh](docs/scripts/wallpaper.sh.md) | Pick random wallpaper or select from a list and set it as the desktop wallpaper. |
| [you_are_not_documented.sh](docs/scripts/you_are_not_documented.sh.md) | A script that finds scripts without inline documentation. |

<!-- table_end -->
