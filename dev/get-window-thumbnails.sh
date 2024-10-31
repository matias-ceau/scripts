#!/bin/bash

output_dir="$HOME/window_screenshots"
mkdir -p "$output_dir"

window_ids=$(wmctrl -l | awk '{print $1}')

for win_id in $window_ids; do
    win_name=$(xwininfo -id "$win_id" | grep 'xwininfo: Window id:' | sed 's/^.*"//' | sed 's/".*$//' | tr -cd '[:alnum:]._-')

    # Unmap the window (i.e., make it visible)
    xdotool windowmap "$win_id"

    # Give it a slight delay to ensure the window is rendered
    sleep 0.2

    # Take a screenshot of the window
    import -window "$win_id" "$output_dir/${win_name}_${win_id}.png"

    # Remap the window (i.e., hide it again)
    xdotool windowunmap "$win_id"

    # Resize the screenshot to create a miniature
    mogrify -resize 200x200 "$output_dir/${win_name}_${win_id}.png"
done
