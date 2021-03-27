#!/bin/sh

cabal install xmonad
cabal install xmonad-contrib --flags="-use xft"
cabal install xmonad-extras
cabal install dbus
cabal install taffybar
