#!/bin/bash

tmux list-sessions -F '#S' | xargs -I {} tmux list-windows -t "{}" -F '#S:#W'
