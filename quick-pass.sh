#!/bin/bash

fd . -tf $PASSWORD_STORE_DIR | sed -e "s#${PASSWORD_STORE_DIR}/##g" | fzf
