#!/bin/sh

zypper in --no-confirm neovim

rm -r $HOME/.config/nvim/
cp -r $HOME/dotFiles/.config/nvim/ $HOME/.config/nvim/

echo "export EDITOR='vim'" >> ~/.bashrc
echo "export VISUAL='vim'" >> ~/.bashrc

nvim -c PackerSync
nvim -C COQdeps
