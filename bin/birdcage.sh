#!/usr/bin/env bash

set -euo pipefail

# -----------------
# Birdcage sandbox
# -----------------
# Usage: ./birdcage.sh /path/to/cage python3 my_agent.py ...
#
# This creates:
#  - an isolated folder-based sandbox
#  - a mitmproxy whitelist with wildcard support
#  - all agent traffic is filtered/enforced
#
# Requirements:
#  - firejail
#  - mitmproxy

if [ $# -lt 2 ]; then
  echo "Usage: $0 /path/to/cage <command...>"
  exit 1
fi

CAGE=$1
shift

mkdir -p "$CAGE"

WHITELIST_SCRIPT="${CAGE}/whitelist.py"

cat > "$WHITELIST_SCRIPT" <<"EOF"
from mitmproxy import http
import fnmatch

# Starter "safe & useful" domains. Add more below as needed.
SAFE_DOMAINS = [
    # Knowledge sources
    "wikipedia.org",
    "*.wikipedia.org",
    "arxiv.org",
    "*.arxiv.org",

    # Open‑access publishers
    "plos.org",
    "*.plos.org",
    "elifesciences.org",
    "*.elifesciences.org",

    # Developer resources
    "github.com",
    "raw.githubusercontent.com",
    "gitlab.com",

    # Package indexes (safe for installing libs)
    "pypi.org",
    "files.pythonhosted.org",
    "anaconda.org",
    "repo.anaconda.com",

    # Standards docs
    "ietf.org",
    "*.ietf.org",
    "w3.org",
    "*.w3.org",

    # Others: add more as needed
]

def is_allowed(host: str) -> bool:
    # Normalize host
    host = host.lower()
    for pattern in SAFE_DOMAINS:
        if fnmatch.fnmatch(host, pattern):
            return True
    return False

def request(flow: http.HTTPFlow) -> None:
    host = flow.request.host
    if not is_allowed(host):
        flow.response = http.HTTPResponse.make(
            403,
            b"Blocked by Birdcage whitelist",
            {"Content-Type": "text/plain"},
        )
EOF

# Pick a listen port
PORT=8080
echo "[Birdcage] Starting mitmproxy on port $PORT with whitelist $WHITELIST_SCRIPT"
mitmproxy --quiet --listen-port $PORT -s "$WHITELIST_SCRIPT" &
MITM_PID=$!

trap "kill $MITM_PID" EXIT

echo "[Birdcage] Running command in sandbox dir $CAGE"
firejail \
  --private="$CAGE" \
  --env=http_proxy=http://127.0.0.1:$PORT \
  --env=https_proxy=http://127.0.0.1:$PORT \
  "$@"
