#!/usr/bin/bash

uv run - << EOF
win = $(qtile cmd-obj -o root -f windows)
keylist = ['id', 'group', 'name', 'wm_class']
extract = [[str(v) for k,v in i.items() if k in keylist] for i in win]
li = extract
for l in li:
    print('\t'.join(l))
EOF

