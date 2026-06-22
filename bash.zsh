# Generic shell helpers

# awk print $
function awkp() {
    awk -v col=$1 '{print $col}'
}

# Watch command with -c
function wwc() {
    echo "$@" | xargs watch -c
}

alias ww="watch "
