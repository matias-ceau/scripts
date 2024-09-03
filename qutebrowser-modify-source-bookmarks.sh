#!/bin/bash

local_book="$XDG_CONFIG_HOME/qutebrowser/bookmarks/urls"
chezm_book_rel="dot_config/qutebrowser/bookmarks/urls"
chezm_book="$CHEZMOI/$chezm_book_rel"

local_quick="$XDG_CONFIG_HOME/qutebrowser/quickmarks"
chezm_quick_rel="dot_config/qutebrowser/quickmarks"
chezm_quick="$CHEZMOI/$chezm_quick_rel"

# wait in case it's a quickmark and the name needs to be added
sleep 20 && \
cat "$local_book" > "$chezm_book"
cat "$local_quick" > "$chezm_quick"

# chezmoi cd && \
# git add "$chezm_book_rel" && \
# git add "$chezm_quick_rel" && \
# git commit -m "Updated bookmarks ($(date +%Y-%m-%d_%H-%M))" && \
# git push

