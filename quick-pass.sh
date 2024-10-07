#!/bin/bash

fd -tf --absolute-path \
    '\.gpg$' $PASSWORD_STORE_DIR |
eza -la --stdin --no-user --no-filesize --no-permissions \
    --color=always --icons=always --modified --time-style='+%s' |
sed "s#${PASSWORD_STORE_DIR}/##;
    s/\;32m/\;33m/;
    s/\[36m/\[35m/;
s/\[34m/\[90m/;" |
fzf --ansi \
    --bind 'ctrl-e:execute(pass edit {})' \
    --bind 'enter:execute(pass -c {})' \
    > /dev/null

# sed -e "s#${PASSWORD_STORE_DIR}.*/##g" |
