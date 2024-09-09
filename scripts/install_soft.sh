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

# Personal software installation
echo "Installing personal software..."

wm_de=(
    xmonad polybar picom nitrogen rofi
    thunar dunst lxappearance arandr
)

terminal_utils=(
    kitty fish bat exa gksu ncdu ripgrep
    ripgrep-bash-completion ripgrep-fish-completion
    bottom fzf fd
)

system_utils=(
    unclutter xrandr x11perf x11-tools
    udiskie NetworkManager tlp powertop
)

viewers=(
    qview zathura zathura-bash-completion
    zathura-fish-completion zathura-lang
    zathura-plugin-djvu zathura-plugin-pdf-poppler
    okular
)

tools=(
    mpv playerctl vlc ffmpeg firefox qbittorrent
    audacity obs-studio flameshot unrar
    bitwarden
)

creative_suite=(
    gimp inkscape darktable krita
)

nvidia=(
    openSUSE-repos-Tumbleweed-NVIDIA nvidia-settings
)

gaming=(
    steam wine wine-gecko wine-mono winetricks
    protonhax vulkan-tools vulkan-devel
    vulkan-headers Mesa vkd3d-devel
    gamemode mangohud lutris
)

fonts=(
    symbols-only-nerd-fonts iosevka-fonts
    google-noto-fonts fira-code-fonts
    fontawesome-fonts fontawesome-fonts-web
    google-noto-sans-cjk-fonts google-noto-coloremoji-fonts
    jetbrains-mono-fonts adobe-sourcesanspro-fonts
    droid-fonts liberation-fonts
)

softs=(
    "${wm_de[@]}"
    "${terminal_utils[@]}"
    "${system_utils[@]}"
    "${viewers[@]}"
    "${tools[@]}"
    "${creative_suite[@]}"
    "${nvidia[@]}"
    "${gaming[@]}"
    "${dev_tools[@]}"
    "${fonts[@]}")

for soft in "${softs[@]}"; do
    install_package "$soft"
done

opi codecs -n
opi vivaldi -n

mkdir -p "$HOME/.config/xmonad"
cp -r "$HOME/dotFiles/.config/xmonad" "$HOME/.config/"

fc-cache -f -v

xdg-mime default org.kde.okular.desktop application/pdf

echo "Setup complete!"

