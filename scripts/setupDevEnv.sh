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
    scala 3.0.0
    scala 2.13.6
    java 16-open
    java 11.0.10-open
    gradle
    maven 
    kotlin 
    spark 
    leiningen
)

for name in "${list[@]}"
do
    tput setaf 3; echo "Installing: " $name; tput sgr0;
    sdk install $name
done

sudo pacman -S --noconfirm --needed clojure

yay -S --noconfirm --needed coursier

curl -L -o coursier https://git.io/coursier-cli
