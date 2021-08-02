#!/bin/bash

cp -r .config/* ~/.config

curl --proto '=https' --tlsv1.2 -sSf https://get-ghcup.haskell.org | sh

curl -s "https://get.sdkman.io" | bash

curl -L https://get.oh-my.fish | fish

ghcup install ghc
ghcup install cabal
ghcup install stack

################################
#   JVM THINGS BRRRRRRRRRRRRR  #
################################

sdkList=(
    scala
    scala 2.13.8
    java 
    java 11.0.12-open
    gradle
    maven 
)

for name in "${sdkList[@]}"
do
    tput setaf 3; echo "Installing: " $name; tput sgr0;
    sdk install $name
done

curl -fL https://github.com/coursier/launchers/raw/master/cs-x86_64-pc-linux.gz | gzip -d > cs
chmod +x cs
./cs setup
rm cs

zypperList=(
    cargo
    go
)

for name in "${zypperList}"
do
    tput setaf 3; echo "Installing: " $name; tput sgr0;
    zypper in --no-confirm $name
done
