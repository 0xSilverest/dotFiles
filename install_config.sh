#!/bin/bash

DOT_FILES_DIR="$HOME/dotFiles"
CONFIG_DIR="$HOME/.config"
BIN_DIR="$HOME/bin"
SCRIPTS_DIR="$DOT_FILES_DIR/scripts"

create_symlink() {
    local source="$1"
    local target="$2"
    if [ -e "$target" ]; then
        echo "Backing up existing $target"
        mv "$target" "${target}.bak"
    fi
    ln -s "$source" "$target"
    echo "Created symlink: $target -> $source"
}

copy_config_files() {
    echo "Copying config files..."

    if [ -d "$DOT_FILES_DIR/.config" ]; then
        for config in "$DOT_FILES_DIR/.config"/*; do
            if [ -e "$config" ]; then
                config_name=$(basename "$config")
                create_symlink "$config" "$CONFIG_DIR/$config_name"
            fi
        done
        echo "Copied all configurations from $DOT_FILES_DIR/.config to $CONFIG_DIR"
    else
        echo "Warning: .config directory not found in $DOT_FILES_DIR"
    fi

    if [ -d "$DOT_FILES_DIR/bin" ]; then
        mkdir -p "$BIN_DIR"
        for script in "$DOT_FILES_DIR"/bin/*; do
            if [ -f "$script" ]; then
                create_symlink "$script" "$BIN_DIR/$(basename "$script")"
            fi
        done
        echo "Copied all scripts from $DOT_FILES_DIR/bin to $BIN_DIR"
    else
        echo "Warning: bin directory not found in $DOT_FILES_DIR"
    fi

    echo "Config file copying complete!"
}

run_setup_scripts() {
    echo "Running additional setup scripts..."

    if [ -f "$SCRIPTS_DIR/install_soft.sh" ]; then
        echo "Running install_soft.sh..."
        bash "$SCRIPTS_DIR/install_soft.sh"
    else
        echo "Warning: install_soft.sh not found in $SCRIPTS_DIR"
    fi

    if [ -f "$SCRIPTS_DIR/setup_dev_environment.sh" ]; then
        echo "Running setup_dev_environment.sh..."
        bash "$SCRIPTS_DIR/setup_dev_environment.sh"
    else
        echo "Warning: setup_dev_environment.sh not found in $SCRIPTS_DIR"
    fi
}

echo "Starting comprehensive setup process..."

run_setup_scripts

copy_config_files

echo "Setting up additional configurations..."

if [ -x "$(command -v fish)" ]; then
    echo "Setting fish as default shell..."
    echo /usr/bin/fish | sudo tee -a /etc/shells
    chsh -s /usr/bin/fish
else
    echo "Fish shell not found. Skipping default shell change."
fi

echo "Setting up Neovim environment variables..."
fish -c "set -U EDITOR nvim"
fish -c "set -U VISUAL nvim"

if [ -x "$(command -v xdg-mime)" ]; then
    echo "Setting defaults..."
    xdg-mime default org.kde.okular.desktop application/pdf

    xdg-mime default thunar.desktop inode/directory

    xdg-mime default firefox.desktop x-scheme-handler/http
    xdg-mime default firefox.desktop x-scheme-handler/https
    xdg-mime default firefox.desktop text/html

    xdg-mime default qview.desktop image/jpeg
    xdg-mime default qview.desktop image/png
    xdg-mime default qview.desktop image/gif
    xdg-mime default qview.desktop image/bmp
    xdg-mime default qview.desktop image/tiff

    xdg-mime default mpv.desktop video/mp4
    xdg-mime default mpv.desktop video/x-matroska
    xdg-mime default mpv.desktop video/x-msvideo

    xdg-mime default neovide.desktop text/plain
    xdg-mime default neovide.desktop text/x-python
    xdg-mime default neovide.desktop text/x-c++src
    xdg-mime default neovide.desktop text/x-c
    xdg-mime default neovide.desktop text/x-java
    xdg-mime default neovide.desktop text/x-haskell
    xdg-mime default neovide.desktop text/x-clojure
    xdg-mime default neovide.desktop text/x-literate-haskell
    xdg-mime default neovide.desktop text/x-shellscript
    xdg-mime default neovide.desktop text/x-makefile
    xdg-mime default neovide.desktop text/x-markdown
    xdg-mime default neovide.desktop application/x-yaml
    xdg-mime default neovide.desktop application/xml

    xdg-mime default kitty.desktop application/x-terminal-emulator

    xdg-mime default org.kde.ark.desktop application/x-compress
    xdg-mime default org.kde.ark.desktop application/x-compressed-tar
    xdg-mime default org.kde.ark.desktop application/x-bzip-compressed-tar
    xdg-mime default org.kde.ark.desktop application/x-tar
    xdg-mime default org.kde.ark.desktop application/x-bzip
    xdg-mime default org.kde.ark.desktop application/x-gzip
    xdg-mime default org.kde.ark.desktop application/zip
    xdg-mime default org.kde.ark.desktop application/x-7z-compressed
    xdg-mime default org.kde.ark.desktop application/x-rar
    xdg-mime default org.kde.ark.desktop application/x-xz-compressed-tar

    xdg-mime default org.strawberrymusicplayer.strawberry.desktop audio/mpeg
    xdg-mime default org.strawberrymusicplayer.strawberry.desktop audio/flac
    xdg-mime default org.strawberrymusicplayer.strawberry.desktop audio/x-wav
    xdg-mime default org.strawberrymusicplayer.strawberry.desktop audio/aac
    xdg-mime default org.strawberrymusicplayer.strawberry.desktop audio/x-m4a
    xdg-mime default org.strawberrymusicplayer.strawberry.desktop audio/ogg
else
    echo "xdg-mime not found. Skipping default PDF viewer setup."
fi

echo "Setup complete please restart your pc."
