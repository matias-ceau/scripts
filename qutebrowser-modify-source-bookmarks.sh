#!/bin/bash

local_book="$XDG_CONFIG_HOME/qutebrowser/bookmarks/urls"
chezm_book="$CHEZMOI/dot_config/qutebrowser/bookmarks/urls"

local_quick="$XDG_CONFIG_HOME/qutebrowser/quickmarks"
chezm_quick="$CHEZMOI/dot_config/qutebrowser/quickmarks"

local_sessions="$XDG_DATA_HOME/qutebrowser/sessions"
chezm_sessions="$CHEZMOI/dot_local/share/private_qutebrowser/sessions"
# wait in case it's a quickmark and the name needs to be added
sleep 20 && \
    cat "$local_quick" > "$chezm_quick"
cat "$local_book" > "$chezm_book"

for f in $(fd '.yml$' -tf --format '{/}' "$local_sessions"); do
    if not [ -f "$chezm_sessions/$f" ]; then
        chezmoi add "$local_sessions/$f"
    fi
    cat "$local_sessions/$f" > "$chezm_sessions/$f"
done
# chezmoi cd && \
    # git add "$chezm_book_rel" && \
    # git add "$chezm_quick_rel" && \
    # git commit -m "Updated bookmarks ($(date +%Y-%m-%d_%H-%M))" && \
    # git push

