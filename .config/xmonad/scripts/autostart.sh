#!/bin/bash

pkill kglobalacceld

xrandr --output DP-2 --mode 2560x1440 --rate 144.00 --primary --pos 1080x364 \
       --output HDMI-1 --mode 1920x1080 --rate 60.00 --rotate left --pos 0x0

xset s off -dpms &
# xset s 300
# xset dpms 300 300 300

export QT_QPA_PLATFORMTHEME=qt6ct

xsetroot -cursor_name left_ptr &
dunst &
numlockx on &
unclutter -idle 1 -root &
picom &
nitrogen --restore
copyq &
easyeffects --gapplication-service &
nm-applet &
blueman-applet &
nvidia-settings -l &

sleep 1

which-sink &
