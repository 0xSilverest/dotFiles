#!/bin/bash

xrandr --output HDMI-1 --left-of DP-2
xrandr --output DP-2 --mode 2560x1440 --rate 144.00 --primary
xrandr --output HDMI-1 --mode 1920x1080 --rate 75.00

nvidia-settings -l &

xsetroot -cursor_name left_ptr &

dunst &

numlockx on &

unclutter -idle 1 -root &
