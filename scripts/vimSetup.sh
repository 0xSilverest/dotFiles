#!/bin/sh

cp -r ../.config/nvim $HOME/.config/

echo "export EDITOR='vim'" >> ~/.bashrc
echo "export VISUAL='vim'" >> ~/.bashrc

curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

nvim -c PlugInstall \
    -c PlugUpdate
