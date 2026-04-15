#! /usr/bin/bash

ENABLE_PERSISTENT_CONFIG=False WEBUI_URL="http://localhost:8765" PORT=8765 DATA_DIR="$XDG_DATA_HOME/open-webui" uvx --python 3.11 open-webui@latest serve
