#!/bin/sh

cp -r .config ~/.config

chmod +x ./vimSetup.sh
./vimSetup

curl -s "https://get.sdkman.io" | bash

curl -L https://get.oh-my.fish | fish
