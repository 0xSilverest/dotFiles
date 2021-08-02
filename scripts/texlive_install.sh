#!/bin/sh

git clone git@github.com:rolfn/texlive-dummy-opensuse.git

cd texlive-dummy-opensuse/

make

zypper in --no-confirm texlive-dummy-*.rpm

wget https://mirror.ctan.org/systems/texlive/tlnet/install-tl-unx.tar.gz

tar -xzvf install-tl-unx.tar.gz

cd install-tl*

perl install-tl
