#!/bin/bash

# Create an array to store command history
declare -a command_history

function create_fzf_interface() {
    local program="${1:-nordvpn}"
    local current_cmd="$2"
    local completion_flag="--generate-bash-completion"
    local help_flag="-h"

    # Add current command to history
    if [[ -n "$current_cmd" ]]; then
        command_history+=("$current_cmd")
    fi

    # Program-specific configurations
    declare -A PROGRAM_CONFIGS=(
        ["nordvpn"]="--generate-bash-completion|-h"
        ["docker"]="--completion|--help"
        ["kubectl"]="completion bash|--help"
        ["git"]="completion bash|--help"
    )

    # Load program configuration if available
    if [[ ${PROGRAM_CONFIGS[$program]} ]]; then
        IFS="|" read -r completion_flag help_flag <<< "${PROGRAM_CONFIGS[$program]}"
    fi

    # Get completions based on current command
    local completions
    if [[ -z "$current_cmd" ]]; then
        completions=$($program $completion_flag 2>/dev/null)
    else
        completions=$($program $current_cmd $completion_flag 2>/dev/null)
    fi

    # If no completions, execute the command
    if [[ -z "$completions" ]]; then
        echo "Executing: $program $current_cmd"
        $program $current_cmd
        return
    fi

    local preview_cmd="echo -e '\033[1;34mCommand:\033[0m $program $current_cmd {}';"
    preview_cmd+="echo -e '\033[1;33m----------------------------------------\033[0m';"
    preview_cmd+="$program $current_cmd {} $help_flag 2>/dev/null | bat -pplhelp --color=always --terminal-width=\$FZF_PREVIEW_COLUMNS ; "
    preview_cmd+="echo -e '\033[1;33m----------------------------------------\033[0m';"
    preview_cmd+="echo -e '\033[1;34mSub-commands:\033[0m';"
    preview_cmd+="$program $current_cmd {} $completion_flag 2>/dev/null | sed 's/^/  /';"

    # Add back option at the top if we're in a subcommand
    local options="$completions"
    if [[ -n "$current_cmd" ]]; then
        options=$(echo -e ".. (back)\n$completions")
    fi

    local selection=$(echo "$options" | fzf \
        --ansi \
        --height="90%" \
        --layout=reverse \
        --border="rounded" \
        --info="inline" \
        --header="$(echo -e "\033[1;36mCurrent:\033[0m $program $current_cmd")" \
        --header-first \
        --preview="$preview_cmd" \
        --preview-window="right:80%:wrap" \
        --bind="ctrl-/:toggle-preview" \
        --bind="ctrl-h:preview-half-page-up" \
        --bind="ctrl-l:preview-half-page-down" \
        --bind="alt-up:preview-up" \
        --bind="alt-down:preview-down" \
        --bind="ctrl-b:backward-word" \
        --bind="ctrl-f:forward-word" \
        --bind="ctrl-space:toggle-preview-wrap" \
        --bind="ctrl-r:reload($program $current_cmd $completion_flag)" \
        --prompt="$(echo -e "\033[1;32mSelect command >\033[0m ") " \
        --color="hl:yellow:bold,fg+:bright-yellow:bold,hl+:yellow:bold:reverse,border:blue" \
        --marker="→" \
        --pointer="▶" \
        --separator="─" \
        --scrollbar="█")

    # Handle selection
    if [[ -n "$selection" ]]; then
        if [[ "$selection" == ".. (back)" ]]; then
            # Remove last command from history
            unset 'command_history[${#command_history[@]}-1]'
            # Get previous command
            local prev_cmd="${command_history[${#command_history[@]}-1]}"
            create_fzf_interface "$program" "$prev_cmd"
        elif [[ -z "$current_cmd" ]]; then
            create_fzf_interface "$program" "$selection"
        else
            create_fzf_interface "$program" "$current_cmd $selection"
        fi
    fi
}

# Check if program exists
if ! command -v "${1:-nordvpn}" &> /dev/null; then
    echo "Error: Program '${1:-nordvpn}' not found"
    exit 1
fi

# Start the interface
create_fzf_interface "$1"
