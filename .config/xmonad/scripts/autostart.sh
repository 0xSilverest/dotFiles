#!/bin/bash

pkill kglobalacceld

xrandr --output HDMI-1 --left-of DP-2
xrandr --output DP-2 --mode 2560x1440 --rate 144.00 --primary
xrandr --output HDMI-1 --mode 1920x1080 --rate 75.00

nvidia-settings -l &

xset s off -dpms &

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

sleep 1

which-sink &
