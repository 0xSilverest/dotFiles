#!/bin/sh

cp -r .config/* ~/.config

curl --proto '=https' --tlsv1.2 -sSf https://get-ghcup.haskell.org | sh

curl -s "https://get.sdkman.io" | bash

curl -L https://get.oh-my.fish | fish

sdk install scala 3.0.0-RC1
sdk install java 16-open
sdk install gradle
sdk install maven 
sdk install kotlin 
sdk install spark 

chmod +x ./vimSetup.sh
./vimSetup.sh

