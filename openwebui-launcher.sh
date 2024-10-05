#!/usr/bin/bash

export WEBUI_AUTH=0

HOST='0.0.0.0'
PORT=8080
QBDATA="$HOME/data/qutebrowser_data/open-webui"

while [[ $# -gt 0 ]]; do
    case "$1" in
        -D|--database) QBDATA="$2"; shift 2 ;;
        -H|--host) HOST="$2"; shift 2 ;;
        -p|--port) HOST="$2"; shift 2 ;;
        *) echo "Unknown argument $1" ; shift ;;
    esac
done

# TODO:
# + check if openwebui is already serving and maybe split the 2 scripts

tmux new-session -d -s OPENWEBUI -n openwebui "open-webui serve --host $HOST --port $PORT"
notify-send "Open WebUI" "Opening..."

start_time="$(date +%s)"
while true; do
    curl -I http://localhost:8080 && break
    [ $(( $(date +%s) - $start_time )) -gt 30 ] && notify-send "Open WebUI" "Timeout, exiting!" && exit 1
    sleep 2
done

notify-send "Open WebUI" "Serving at localhost:8080..."
qutebrowser -C "$XDG_CONFIG_HOME/qutebrowser/openwebui.py" -B "$QBDATA"  "http://${HOST}:${PORT}"
# --qt-arg name "OpenWebui"
