#!/bin/bash

# default monitor is DP-2 
MONITOR=DP-2

# functions to switch from DP-2 to HDMI-1 and vice versa
function ActivateHDMI {
    echo "Switching HDMI-1 up"
    xrandr --output HDMI-1 --left-of DP-2
    xrandr --output DP-2 --mode 2560x1440 --rate 144.00 --primary
    xrandr --output HDMI-1 --mode 1920x1080 --rate 75.00
    MONITOR=HDMI-1
}

function DeactivateHDMI {
    echo "Switching to DP-2"
    xrandr --output HDMI-1 --off
    xrandr --output DP-2 --mode 2560x1440 --rate 144.00 --primary
    MONITOR=DP-2
}

# functions to check if HDMI-1 is connected and in use
function HDMIActive {
    [ $MONITOR = "HDMI-1" ]
}
function HDMIConnected {
    ! xrandr | grep "^HDMI-1" | grep disconnected
}

# actual script
while true
do
    if ! HDMIActive && HDMIConnected
    then
        ActivateHDMI
    fi

    if HDMIActive && ! HDMIConnected
    then
        DeactivateHDMI
    fi

    sleep 1s
done
