#!/bin/bash

# Function to install packages using zypper
install_package() {
    if ! zypper search -i "$1" &> /dev/null; then
        echo "Installing $1..."
        sudo zypper in --no-confirm "$1"
    else
        echo "$1 is already installed."
    fi
}

# Main setup
echo "Starting development environment setup..."

# 1. Add Packman repository
echo "Adding Packman repository..."
sudo zypper ar -cfp 90 'https://ftp.gwdg.de/pub/linux/misc/packman/suse/openSUSE_Tumbleweed/' packman
sudo zypper dup --from packman --allow-vendor-change --no-confirm

# 2. Install basic tools and dependencies
tools=(
    git node yarn npm fish neovim ripgrep fzf fd libstdc++-devel
    tree-sitter-devel gcc-c++ libX11-devel libXinerama-devel
    libXrandr-devel libXss-devel zlib-devel gmp-devel gcc make
    zip docker libyaml-devel SDL2-devel SDL2_ttf-devel
)

for tool in "${tools[@]}"; do
    install_package "$tool"
done

# 3. Set up fish shell
echo "Setting up fish shell..."
echo /usr/bin/fish | sudo tee -a /etc/shells
chsh -s /usr/bin/fish

# 4. Install language-specific tools
echo "Installing language-specific tools..."

# Install SDKMAN
if [ ! -d "$HOME/.sdkman" ]; then
    curl -s "https://get.sdkman.io" | bash
fi

# Source and install in fish shell context
fish -c "
    source ~/.sdkman/bin/sdkman-init.fish
    sdk install java 17.0.10-tem
    sdk install java 22.0.2-graalce
    sdk install kotlin
    sdk install gradle
    sdk install maven
    sdk install scala
"

# 5. Set up Neovim
echo "Setting up Neovim..."
rm -rf "$HOME/.config/nvim"
cp -r "$HOME/dotFiles/.config/nvim/" "$HOME/.config/nvim/"

if ! grep -q "EDITOR.*nvim" ~/.config/fish/config.fish 2>/dev/null; then
    echo "set -gx EDITOR nvim" >> ~/.config/fish/config.fish
    echo "set -gx VISUAL nvim" >> ~/.config/fish/config.fish
fi

# Install Lazy for Neovim
LAZY_PATH="${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/lazy/lazy.nvim
if [ ! -d "$LAZY_PATH" ]; then
  echo "Installing Lazy plugin manager for Neovim..."
  git clone --filter=blob:none https://github.com/folke/lazy.nvim.git --branch=stable "$LAZY_PATH"
else
  echo "Lazy plugin manager is already installed."
fi

# Install Neovim plugins using Lazy
echo "Installing Neovim plugins..."
nvim --headless "+Lazy! sync" +qa

echo "Development environment setup complete!"
