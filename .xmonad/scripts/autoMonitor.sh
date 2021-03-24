#!/bin/bash

# default monitor is eDP 
MONITOR=eDP

# functions to switch from eDP to HDMI-A-0 and vice versa
function ActivateHDMI {
    echo "Switching HDMI-A-0 up"
    xrandr --output HDMI-A-0 --auto --primary --left-of eDP 
    MONITOR=HDMI-A-0
}

function DeactivateHDMI {
    echo "Switching to eDP"
    xrandr --output HDMI-A-0 --off --output eDP --auto
    MONITOR=eDP
}

# functions to check if HDMI-A-0 is connected and in use
function HDMIActive {
    [ $MONITOR = "HDMI-A-0" ]
}
function HDMIConnected {
    ! xrandr | grep "^HDMI-A-0" | grep disconnected
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
