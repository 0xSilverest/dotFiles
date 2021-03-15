#!/bin/sh

cp -r .config ~/.config

chmod +x ./vimSetup.sh
./vimSetup

chmod +x ./sdkman.sh
./sdkman
