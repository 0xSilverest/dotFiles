#!/bin/bash

rm -r $HOME/dotFiles/.config
mkdir $HOME/dotFiles/.config

bkps=(
    nvim
    zathura
    fish
    polybar
    rofi
    nnn
    kitty
    )

for name in "${bkps[@]}"; do
    cp -r $HOME/.config/$name $HOME/dotFiles/.config/
done

cp $HOME/.xmonad/config.hs $HOME/dotFiles/.xmonad
