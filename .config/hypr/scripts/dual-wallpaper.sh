#!/bin/bash

# Function to check and update wallpaper state for a monitor
update_wallpaper_state() {
    local monitor_name="$1"
    local monitor_id="$2"

    monitors=$(hyprctl monitors -j)
    workspace=$(echo "$monitors" | jq -r ".[] | select(.name == \"$monitor_name\") | .activeWorkspace.id")
    windows=$(hyprctl clients -j)

    has_terminal=$(echo "$windows" | jq -r ".[] | select(.monitor == $monitor_id and .workspace.id == $workspace and .class == \"kitty\") | .class" | head -1)
    has_any_window=$(echo "$windows" | jq -r ".[] | select(.monitor == $monitor_id and .workspace.id == $workspace) | .class" | head -1)

    if [ -n "$has_terminal" ] || [ -z "$has_any_window" ]; then
        pkill -CONT -f "mpvpaper.*$monitor_name" 2>/dev/null
    else
        pkill -STOP -f "mpvpaper.*$monitor_name" 2>/dev/null
    fi
}

# Initial state check
update_wallpaper_state "HDMI-A-2" 0
update_wallpaper_state "DP-2" 1

# Listen for events
socat -U - UNIX-CONNECT:$XDG_RUNTIME_DIR/hypr/$HYPRLAND_INSTANCE_SIGNATURE/.socket2.sock | while read -r event; do
    case "$event" in
        workspace*|openwindow*|closewindow*|movewindow*)
            update_wallpaper_state "HDMI-A-2" 0
            update_wallpaper_state "DP-2" 1
            ;;
    esac
done
