#!/bin/bash

function run {
  if ! pgrep $1 ;
  then
    $@&
  fi
}

xsetroot -cursor_name left_ptr &

run variety &
run nm-applet &
run xfce4-power-manager &

numlockx on &
udiskie &

picom --config $HOME/.xmonad/scripts/picom.conf &

#nvidia-settings --assign CurrentMetaMode="nvidia-auto-select +0+0 {ForceFullCompositionPipeline=On}"
#nvidia-settings -a 'AllowFlipping=0'

dunst &
nitrogen --restore &
unclutter -idle 1 -root &
