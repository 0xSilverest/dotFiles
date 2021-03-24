#!/bin/bash

function run {
  if ! pgrep $1 ;
  then
    $@&
  fi
}

taffybar &

xsetroot -cursor_name left_ptr &

run variety &
run nm-applet &
run pamac-tray &
run xfce4-power-manager &
/usr/lib/xfce4/notifyd/xfce4-notifyd &
numlockx on &
blueberry-tray &
picom --config $HOME/.xmonad/scripts/picom.conf &
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
nitrogen --restore &
