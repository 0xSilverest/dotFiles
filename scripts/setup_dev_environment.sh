#!/bin/bash

install_package() {
    if ! zypper search -i "$1" &> /dev/null; then
        echo "Installing $1..."
        sudo zypper in --no-confirm "$1"
    else
        echo "$1 is already installed."
    fi
}

echo "Starting development environment setup..."

echo "Adding Packman repository..."
sudo zypper ar -cfp 90 'https://ftp.gwdg.de/pub/linux/misc/packman/suse/openSUSE_Tumbleweed/' packman
sudo zypper dup --from packman --allow-vendor-change --no-confirm

tools=(
    git node yarn npm fish neovim ripgrep fzf fd libstdc++-devel
    tree-sitter-devel gcc-c++ zlib-devel gmp-devel gcc make
    zip docker libyaml-devel SDL2-devel SDL2_ttf-devel
)

for tool in "${tools[@]}"; do
    install_package "$tool"
done

echo "Installing language-specific tools..."

if [ ! -d "$HOME/.sdkman" ]; then
    curl -s "https://get.sdkman.io" | bash
fi

fish -c "
    source ~/.sdkman/bin/sdkman-init.fish
    sdk install java 17.0.10-tem
    sdk install java 22.0.2-graalce
    sdk install kotlin
    sdk install gradle
    sdk install maven
    sdk install scala
"

echo "Setting up Neovim plugins..."

LAZY_PATH="${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/lazy/lazy.nvim
if [ ! -d "$LAZY_PATH" ]; then
  echo "Installing Lazy plugin manager for Neovim..."
  git clone --filter=blob:none https://github.com/folke/lazy.nvim.git --branch=stable "$LAZY_PATH"
else
  echo "Lazy plugin manager is already installed."
fi

nvim --headless "+Lazy! sync" +qa

echo "Development environment setup complete!"
