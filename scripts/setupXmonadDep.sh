#!/bin/sh

func_install() {
	if zypper search -i $1 &> /dev/null; then
		tput setaf 2
        echo "dependency $1 existing"
        echo
		tput sgr0
	else
    	tput setaf 3
        echo "dependency $1 missing"
    	tput sgr0
    	sudo zypper in --no-confirm $1 
    fi
}

list=(
    libX11-devel
    libXinerama-devel
    libXrandr-devel
    libXss-devel
    xrandr
    x11perf
    x11-tools
    zlib-devel
    gmp-devel
    gcc
    make
    polybar
)


for name in "${list[@]}" ; do
	count=$[count+1]
	tput setaf 3;echo "Installing package nr.  "$count " " $name;tput sgr0;
	func_install $name
done

tput tput setaf 11;
echo "################################################################"
echo "Dependencies installed"
echo "################################################################"
echo;tput sgr0

tput setaf 11;
echo "################################################################"
echo "Installing xmonad"
echo "################################################################"
echo;tput sgr0

cabal install xmonad
cabal install --lib xmonad-contrib --flags="-use xft"
#cabal install xmonad-extras
cabal install --lib dbus

cp -r "$HOME/dotFiles/.xmonad" "$HOME/.xmonad"
