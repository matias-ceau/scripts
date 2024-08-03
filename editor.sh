#! /bin/bash

#INFO:#@CLI@=2024-07= "Edit any file in current folder or subfolders (recursively)"

#nvim "$( find 2>/dev/null | fzf )"

usage() {
    echo "USAGE:"
    echo "    $(basename $0) [-S|--sudo] [-c|--cwd] [-c|--config] [-h|--help]"
    echo
    echo "By default, searches in relevant locations only, behaviour can be changed with a few options"
    echo
    echo "OPTIONS:"
    echo "    -S, --sudo        Edit files with sudo permissions"
    echo "    -c, --cwd         Find only in current directory"
    echo "    -C, --config      Edit config file"
    echo "    -h, --help        Show this help message"
}

SUDO_MODE=0
CFG_MODE=0
CWD_MODE=0

while [[ "$#" -gt 0 ]]; do
    case $1 in
    -S | --sudo) SUDO_MODE=1 ;;
    -c | --cwd) CWD_MODE=1 ;;
    -C | --config) CFG_MODE=1 ;;
    -h | --help)
        usage | bat -plhelp
        exit 0
        ;;
    *)
        echo "Unknown parameter: $1"
        usage | bat -plhelp
        exit 1
        ;;
    esac
    shift
done

# Function to generate fd command
get_fd_cmd() {
    local hidden=$1
    local cmd="fd '' -tf --color=always"
    [ "$hidden" = "true" ] && cmd+=" --hidden"
    cmd+=" --size '-2g'"
    cmd+=" -E .git -E node_modules"
    cmd+=" -E '*.jpg' -E '*.jpeg' -E '*.png' -E '*.gif'"
    cmd+=" -E '*.pdf' -E '*.db' -E '*.sqlite' -E '*.iso'"
    cmd+=" -E '*.wav' -E '*.mp3' -E '*.flac' -E '*.aiff'"
    cmd+=" -E '*.WAV' -E '*.m4a' -E '*.ogg' -E '*.rar'"
    cmd+=" -E '*.npy' -E '*.pyc' -E '*.bin' -E '*.zip'"
    cmd+=" -E '*.whl' -E '*.kdbx' -E '*.tar.gz' -E '*.pickle'"
    cmd+=" -E '*.gpg' -E '*.odt' -E '*.docx' -E '*.ttf'"
    cmd+=" -E '*.aac' -E '*.asn' -E '*.aux' -E '*.bmp'"
    cmd+=" -E '*.bst' -E '*.doc' -E '*.eps' -E '*.ipynb'"
    cmd+=" -E '*.jpeg' -E '*.JPG' -E '*.mov' -E '*.mp4'"
    cmd+=" -E '*.odg' -E '*.odp' -E '*.ods' -E '*.osp'"
    cmd+=" -E '*.out' -E '*.PDF' -E '*.PNG' -E '*.pp3'"
    cmd+=" -E '*.ppt' -E '*.pptx' -E '*.sty' -E '*.swf'"
    cmd+=" -E '*.wmv' -E '*.WMV' -E '*.wps' -E '*.xls'"
    cmd+=" -E '*.xlsx' -E '*.xz'"
    cmd+=" -E '*.asar' -E '*.blend' -E '*.bnk' -E '*.boltdb'"
    cmd+=" -E '*.dat' -E '*.dbf' -E '*.db-journal' -E '*.db-shm'"
    cmd+=" -E '*.db-wal' -E '*.dmp' -E '*.epub' -E '*.fbs'"
    cmd+=" -E '*.ico' -E '*.jar' -E '*.ldb' -E '*.odb'"
    cmd+=" -E '*.pack' -E '*.pak' -E '*.pb' -E '*.pma'"
    cmd+=" -E '*.rdb' -E '*.so' -E '*.store' -E '*.tflite'"
    cmd+=" -E '*.vscdb' -E '*.wasm' -E '*.woff' -E '*.woff2'"

    if [ $SUDO_MODE -eq 1 ]; then
        cmd+=" --owner root"
        cmd+=" --search-path /var/log"
        cmd+=" --search-path /usr/local/etc"
        cmd+=" --search-path /root"
        cmd+=" --search-path /etc"
    elif [ $CWD_MODE -eq 1 ]; then
        cmd+=" ."
    elif [ $CFG_MODE -eq 1 ]; then
        cmd="chezmoi unmanaged -p absolute | rg '/\.'"
    else
        cmd+=" -E HDD2 -E Downloads -E DATA -E FAST_DATA"
        cmd+=" -E /etc -E /var/log -E /usr/local/etc"
        cmd+=" --search-path $LOCALDATA"
        cmd+=" --search-path $SCRIPTS"
        cmd+=" --search-path $HOME"
        #cmd+=" --search-path $XDG_CONFIG_HOME"
        cmd+=" --search-path $HOME/docs"
    fi

    echo "$cmd"
}

# Initial fd command without hidden files
FD_CMD=$(get_fd_cmd false)

# Use fzf with preview and custom bindings
SELECTED=$(eval "$FD_CMD" | fzf \
    --ansi \
    --preview 'bat --style=numbers --color=always --line-range :500 {}' \
    --preview-window 'right:60%' \
    --bind "ctrl-h:reload($(get_fd_cmd true))+change-prompt(Hidden> )" \
    --bind "ctrl-s:reload($FD_CMD)+change-prompt(> )" \
    --header 'CTRL-H: Show hidden files / CTRL-S: Hide hidden files' \
    --prompt '> ')

# If a file is selected, open it (with sudo if necessary)
if [ -n "$SELECTED" ]; then
    if [ $SUDO_MODE -eq 1 ]; then
        sudo -E nvim "$SELECTED"
    else
        nvim "$SELECTED"
    fi
fi
