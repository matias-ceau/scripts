#!/usr/bin/bash

# export WEBUI_AUTH=0

# BROWSER

HOST='localhost'
PORT=8080
# QBDATA="$HOME/data/qutebrowser_data/open-webui"
# OWCFG="$XDG_CONFIG_HOME/qutebrowser/openwebui.py"
DATA_DIR=$HOME/.local/share/open-webui/
BROWSER=$(which minimal-browser.py)

while [[ $# -gt 0 ]]; do
  case "$1" in
  init)
    DATA_DIR=$HOME/.local/share/open-webui uvx --python 3.12 'open-webui@latest' serve
    shift 2
    ;;
  -H | --host)
    HOST="$2"
    shift 2
    ;;
  -p | --port)
    PORT="$2"
    shift 2
    ;;
  *)
    echo "Unknown argument $1"
    shift
    ;;
  esac
done

URL="http://${HOST}:${PORT}"

if ! ps -ax | rg 'open-webui serve' | rg '8080' -q; then
  tmux new-session -d -s OPENWEBUI -n openwebui "open-webui serve --host $HOST --port $PORT"
  notify-send "Open WebUI" "Opening..."
  start_time="$(date +%s)"
  while true; do
    curl -I "$URL" && break
    [ $(($(date +%s) - start_time)) -gt 30 ] && notify-send "Open WebUI" "Timeout, exiting!" && exit 1
    sleep 2
  done
fi

notify-send "Open WebUI" "Serving at ${URL}..."
eval "$BROWSER $URL"
