#!/bin/bash
#set -e

func_install() {
	if zypper search -i $1 &> /dev/null; then
		tput setaf 2
  		echo "###############################################################################"
  		echo "################## The package "$1" is already installed"
      	echo "###############################################################################"
      	echo
		tput sgr0
	else
    	tput setaf 3
    	echo "###############################################################################"
    	echo "##################  Installing package "  $1
    	echo "###############################################################################"
    	echo
    	tput sgr0
    	sudo zypper in --no-confirm $1 
    fi
}

echo "My shit sires!"

tput setaf 11;
echo "################################################################"
echo "Adding Packman repo"
echo "################################################################"
echo;tput sgr0

sudo zypper ar -cfp 90 'https://ftp.gwdg.de/pub/linux/misc/packman/suse/openSUSE_Tumbleweed/' packman
sudo zypper dup --from packman --allow-vendor-change --no-confirm


list=(
    opi

    unclutter
    kitty
    nitrogen
    git
    chromium
    sxiv
    docker
    flameshot

    # backends
    node
    yarn
    npm

    #terminal
    fish
    bat
    exa
    gksu
    ncdu

    #zathura
    zathura
    zathura-plugin-djvu
    zathura-plugin-pdf-mupdf

    # nvim plugins req
    neovim
    ripgrep
    fzf
    fd
    libstdc++-devel
    tree-sitter-devel
    gcc-c++

    # tools
    zip
    unrar
)

count=0

for name in "${list[@]}" ; do
	count=$[count+1]
	tput setaf 3;echo "Installing package nr.  "$count " " $name;tput sgr0;
	func_install $name
done

###############################################################################

tput setaf 11;
echo "################################################################"
echo "Softwares has been installed"
echo "################################################################"
echo;tput sgr0

tput setaf 11;
echo "################################################################"
echo "Downloading codecs"
echo "################################################################"
echo;tput sgr0

opi codecs -n
opi vivaldi -n
opi msedge -n

tput setaf 11;
echo "################################################################"
echo "Setting fish to default shell"
echo "################################################################"
echo;tput sgr0

echo /usr/bin/fish | sudo tee -a /etc/shells
chsh -s /usr/local/bin/fish

#tput setaf 11;
#echo "################################################################"
#echo "Installing NeoVim Plugins"
#echo "################################################################"
#echo;tput sgr0

#./vimSetup.sh
