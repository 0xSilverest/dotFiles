#!/bin/sh

echo "export EDITOR='vim'" >> ~/.bashrc
echo "export VISUAL='vim'" >> ~/.bashrc

curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

vim -c PlugInstall
vim -c PlugUpdate
vim -c "CocInstall coc-metals"
vim -c "CocInstall coc-texlab"
vim -c "CocInstall coc-pyright"
vim -c "CocInstall coc-rust-analyzer"


