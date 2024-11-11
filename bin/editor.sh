#!/bin/bash

#INFO:#@CLI@=2024-07= "Edit file quickly with fzf"

#nvim "$( find 2>/dev/null | fzf )"

usage() {
    bat -plhelp <<EOF
USAGE:
    $(basename "$0") [-s|--scripts] [-c|--cwd] [-C|--config]
                [-d|--dir <dir>] [-S|--sudo] [-h|--help]

DESCRIPTION:
    Edit files from the shell, find them with fzf.
    Search paths and commands depend on the option.
    Non editable files are excluded.
      $(basename "$0") -- searches in sensible directories by default

OPTIONS:
    -s, --scripts     Edit in user \$SCRIPTS directory
    -c, --cwd         Find only in current directory
    -C, --config      Edit config file (chezmoi unmanaged)
    -d, --dir <dir>   Edit files in specified directory
    -S, --sudo        Edit files with sudo permissions
    -h, --help        Show this help message
    <C-H>  -- also search hidden files [fzf]
    <C-S>  -- disable hidden files if enabled [fzf]
EOF
}

excluded="\
 -E .git -E node_modules\
 -E '*.jpg' -E '*.jpeg' -E '*.png' -E '*.gif'\
 -E '*.pdf' -E '*.db' -E '*.sqlite' -E '*.iso'\
 -E '*.wav' -E '*.mp3' -E '*.flac' -E '*.aiff'\
 -E '*.WAV' -E '*.m4a' -E '*.ogg' -E '*.rar'\
 -E '*.npy' -E '*.pyc' -E '*.bin' -E '*.zip'\
 -E '*.whl' -E '*.kdbx' -E '*.tar.gz' -E '*.pickle'\
 -E '*.gpg' -E '*.odt' -E '*.docx' -E '*.ttf'\
 -E '*.aac' -E '*.asn' -E '*.aux' -E '*.bmp'\
 -E '*.bst' -E '*.doc' -E '*.eps' -E '*.ipynb'\
 -E '*.jpeg' -E '*.JPG' -E '*.mov' -E '*.mp4'\
 -E '*.odg' -E '*.odp' -E '*.ods' -E '*.osp'\
 -E '*.out' -E '*.PDF' -E '*.PNG' -E '*.pp3'\
 -E '*.ppt' -E '*.pptx' -E '*.sty' -E '*.swf'\
 -E '*.wmv' -E '*.WMV' -E '*.wps' -E '*.xls'\
 -E '*.xlsx' -E '*.xz'\
 -E '*.asar' -E '*.blend' -E '*.bnk' -E '*.boltdb'\
 -E '*.dat' -E '*.dbf' -E '*.db-journal' -E '*.db-shm'\
 -E '*.db-wal' -E '*.dmp' -E '*.epub' -E '*.fbs'\
 -E '*.ico' -E '*.jar' -E '*.ldb' -E '*.odb'\
 -E '*.pack' -E '*.pak' -E '*.pb' -E '*.pma'\
 -E '*.rdb' -E '*.so' -E '*.store' -E '*.tflite'\
 -E '*.vscdb' -E '*.wasm' -E '*.woff' -E '*.woff2'"

sudo_mode=0
scripts_mode=0
cfg_mode=0
cwd_mode=0
dir_mode=0

case $1 in
    -S | --sudo)
        sudo_mode=1
        label="SUDO"
        ;;
    -c | --cwd)
        cwd_mode=1
        label="CWD ($(pwd))"
        ;;
    -C | --config)
        cfg_mode=1
        label="CFG (unmanaged)"
        ;;
    -d | --dir)
        dir_mode=1
        if [ -z $2 ]; then
            sel="$(fd . -td "$HOME" --color=always | fzf --ansi)"
            label="$(realpath "$sel")"
        else
            label="$(realpath "$2")"
        fi
        ;;
    -s | --scripts)
        scripts_mode=1
        label="SCRIPTS"
        ;;
    -h | --help)
        usage
        exit 0
        ;;
    '') label="DEFAULT" ;;
    *)
        if [ -d "$(realpath "$1")" ]; then
            dir_mode=1
            label="$(realpath "$1")"
        else
            echo "Unknown parameter: $1"
            usage
            exit 1
        fi
        ;;
esac

# Function to generate fd command
get_fd_cmd() {
    local hidden=$1
    local cmd="fd . -tf --color=always"
    [ "$hidden" = "true" ] && cmd+=" --hidden"
    cmd+=" --size '-2g'"
    cmd+="$excluded"
    if [ $sudo_mode -eq 1 ]; then
        cmd+=" --owner root"
        cmd+=" --search-path /var/log"
        cmd+=" --search-path /usr/local/etc"
        cmd+=" --search-path /root"
        cmd+=" --search-path /etc"
    elif [ $cwd_mode -eq 1 ]; then
        cmd+=" --search-path $(pwd)"
    elif [ $cfg_mode -eq 1 ]; then
        cmd="chezmoi unmanaged -p absolute | rg '/\.'"
    elif [ $scripts_mode -eq 1 ]; then
        cmd+=" --search-path $SCRIPTS"
    elif [ $dir_mode -eq 1 ]; then
        cmd+=" --search-path $label"
    else
        cmd+=" -E HDD2 -E Downloads -E DATA -E FAST_DATA"
        cmd+=" -E /etc -E /var/log -E /usr/local/etc"
        cmd+=" --search-path $LOCALDATA"
        cmd+=" --search-path $SCRIPTS"
        cmd+=" --search-path $HOME"
        cmd+=" --search-path $HOME/docs"
    fi

    echo "$cmd"
}

# Initial fd command without hidden files
default_fd_cmd=$(get_fd_cmd false)

# Use fzf with preview and custom bindings
selected=$(eval "$default_fd_cmd" | fzf \
        --ansi \
        --preview 'bat --style=numbers --color=always --line-range :500 {}' \
        --preview-window 'right:60%' \
        --preview-label="$label" \
        --bind "ctrl-h:reload($(get_fd_cmd true))+change-prompt(Hidden> )" \
        --bind "ctrl-s:reload($default_fd_cmd)+change-prompt(> )" \
        --header '<C-H>: hidden files | <C-S>: non-hidden' \
        --header-first \
    --prompt '> ')

# If a file is selected, open it (with sudo if necessary)
if [ -n "$selected" ]; then
    if [ $sudo_mode -eq 1 ]; then
        sudo -E nvim "$selected"
    else
        nvim "$selected"
    fi
fi
