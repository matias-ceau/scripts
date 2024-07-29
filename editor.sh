#! /bin/bash

#DOC#@CLI@=2024-07= "Edit any file in current folder or subfolders (recursively)"

#nvim "$( find 2>/dev/null | fzf )"

usage() {
    echo "Usage: $0 [-S|--sudo] [-h|--help]"
    echo "  -S, --sudo    Edit files with sudo permissions"
    echo "  -h, --help    Show this help message"
}

SUDO_MODE=0

while [[ "$#" -gt 0 ]]; do
    case $1 in
    -S | --sudo) SUDO_MODE=1 ;;
    -h | --help)
        usage
        exit 0
        ;;
    *)
        echo "Unknown parameter: $1"
        usage
        exit 1
        ;;
    esac
    shift
done

# Function to generate fd command
get_fd_cmd() {
    local hidden=$1
    local cmd="fd '' --type f"
    [ "$hidden" = "true" ] && cmd+=" --hidden"
    cmd+=" --exclude .git --exclude node_modules"
    cmd+=" --exclude '*.jpg' --exclude '*.jpeg' --exclude '*.png' --exclude '*.gif'"
    cmd+=" --exclude '*.pdf' --exclude '*.db' --exclude '*.sqlite' --exclude '*.iso'"
    cmd+=" -E '*.wav' -E '*.mp3' -E '*.flac' -E '*.aiff'"
    cmd+=" -E '*.npy' -E '*.pyc' -E '*.bin' -E '*.zip'"

    if [ $SUDO_MODE -eq 1 ]; then
        cmd+=" . /etc /var/log /usr/local/etc"
    else
        cmd+=" --exclude HDD2 --exclude Downloads --exclude DATA --exclude FAST_DATA"
        cmd+=" --exclude /etc --exclude /var/log --exclude /usr/local/etc"
    fi

    echo "$cmd"
}

# Initial fd command without hidden files
FD_CMD=$(get_fd_cmd false)

# Use fzf with preview and custom bindings
SELECTED=$(eval "$FD_CMD" | fzf \
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
