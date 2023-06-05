#!/bin/bash

function run {
  if ! pgrep $1 ;
  then
    $@&
  fi
}

xsetroot -cursor_name left_ptr &

xrandr --output HDMI-1 --left-of DP-2
xrandr --output DP-2 --mode 2560x1440 --rate 120.00 --primary
xrandr --output HDMI-1 --mode 1920x1080 --rate 60.00

run variety &
run nm-applet &
run xfce4-power-manager &

xboxdrv --detach-kernel-driver --daemon &

numlockx on &
udiskie &

#picom --config $HOME/.xmonad/scripts/picom.conf &

#nvidia-settings --assign CurrentMetaMode="nvidia-auto-select +0+0 {ForceFullCompositionPipeline=On}"
#nvidia-settings -a 'AllowFlipping=0'

dunst &
nitrogen --restore &
unclutter -idle 1 -root &
