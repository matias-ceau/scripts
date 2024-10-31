#!/bin/bash

#INFO:#=2024-07=@CLI@ "Create an m3u file from files in current dir"

dir_name=$(basename "$PWD")
playlist_file="${dir_name}.m3u"
ls -1 > "$playlist_file"
