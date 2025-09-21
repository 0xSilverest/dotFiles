#!/bin/bash
if ! mpc status >/dev/null 2>&1; then
    echo '{"text": "MPD Off", "class": "disconnected"}'
    exit
fi

status=$(mpc status | head -2)
if echo "$status" | grep -q "\[playing\]"; then
    state="playing"
    icon="▶"
elif echo "$status" | grep -q "\[paused\]"; then
    state="paused"
    icon="⏸"
else
    echo '{"text": "Stopped", "class": "stopped"}'
    exit
fi

current=$(mpc current -f '%artist% - %title%' 2>/dev/null)
if [ -z "$current" ]; then
    current="Unknown"
fi

# Truncate if too long
if [ ${#current} -gt 45 ]; then
    current="${current:0:42}..."
fi

echo "{\"text\": \"$current\", \"class\": \"$state\", \"alt\": \"$state\"}"
