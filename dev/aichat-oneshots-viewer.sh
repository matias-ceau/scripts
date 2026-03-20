block_server() {
    local file="$XDG_DATA_HOME/aichat/messages.md"
    local re='^# CHAT: .* \[[0-9T:+-]{25}\]'
    local headers
    mapfile -t headers < <(cat "$file" | rg --line-number "$re"  | cut -d: -f1)
    headers+=( $(wc -l < "$file") ) # append EOF marker

    # main server loop: read start_line from stdin, print block
    while read -r start; do
        local end
        for h in "${headers[@]}"; do
            if (( h > start )); then
                end=$((h-1))
                break
            fi
        done
        bat -l md -pp --line-range "$start:$end" "$file"
    done
}


block_server | nc -l 9999 &
fzf --listen 9999 \
  --preview 'echo {1} | nc localhost 9999'
