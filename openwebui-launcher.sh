#!/usr/bin/bash

export WEBUI_AUTH=0

tmux new-session -d -s OPENWEBUI -n openwebui "open-webui serve"
notify-send "Open WebUI" "Opening..."

start_time="$(date +%s)"
while true; do
    curl -I http://localhost:8080 && break
    [ $(( $(date +%s) - $start_time )) -gt 30 ] && notify-send "Open WebUI" "Timeout, exiting!" && exit 1
    sleep 3
done

notify-send "Open WebUI" "Serving at localhost:8080..."
qutebrowser -C "$XDG_CONFIG_HOME/qutebrowser/openwebui.py" -T http://0.0.0.0:8080
