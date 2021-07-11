#!/bin/bash

mkdir -p $HOME/Git/

cd $HOME/Git/

git clone https://github.com/sumneko/lua-language-server
cd lua-language-server
git submodule update --init --recursive
cd 3rd/luamake
compile/install.sh
cd ../..
./3rd/luamake/luamake rebuild

ghcup install hls

yarn global add yaml-language-server 
yarn global add vscode-langservers-extracted

yay -S --noconfirm --needed clojure-lsp-bin

coursier bootstrap \
  --java-opt -Xss4m \
  --java-opt -Xms100m \
  --java-opt -Dmetals.client=vim-lsc \
  org.scalameta:metals_2.12:0.10.4 \
  -r bintray:scalacenter/releases \
  -r sonatype:snapshots \
  -o /usr/local/bin/metals-vim -f

