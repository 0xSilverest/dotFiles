#!/bin/bash

print_usage() {
    echo "Usage: $0 [--steam] [--wine] [--nvidia]"
    echo "  --creative-suite : Install Creative Suite (GIMP, Inkscape, etc.)"
    echo "  --nvidia         : Install NVIDIA drivers"
    echo "  --gaming         : Install Gaming dependencies (Steam, Wine, etc.)"
}

install_steam=false
install_wine=false
install_nvidia=false

while [[ "$#" -gt 0 ]]; do
    case $1 in
        --creative-suite) install_creative_suite=true ;;
        --nvidia) install_nvidia=true ;;
        --gaming) install_gaming=true ;;
        -h|--help) print_usage; exit 0 ;;
        *) echo "Unknown parameter passed: $1"; print_usage; exit 1 ;;
    esac
    shift
done

echo "Installing personal software..."

wm_de=(
    xmonad polybar picom nitrogen rofi
    thunar dunst lxappearance arandr
)

terminal_utils=(
    kitty fish bat exa gksu ncdu ripgrep
    ripgrep-bash-completion ripgrep-fish-completion
    bottom fzf fd neovim
)

system_utils=(
    unclutter xrandr x11perf x11-tools
    udiskie NetworkManager tlp powertop
    NetworkManager-applet
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
    bitwarden neovide
)

fonts=(
    symbols-only-nerd-fonts iosevka-fonts
    google-noto-fonts fira-code-fonts
    fontawesome-fonts fontawesome-fonts-web
    google-noto-sans-cjk-fonts google-noto-coloremoji-fonts
    jetbrains-mono-fonts adobe-sourcesanspro-fonts
    droid-fonts liberation-fonts
)

nvidia=(
    openSUSE-repos-Tumbleweed-NVIDIA nvidia-settings
)

creative_suite=(
    gimp inkscape darktable krita
)

gaming=(
    steam wine wine-gecko wine-mono winetricks
    protonhax vulkan-tools vulkan-devel
    vulkan-headers Mesa vkd3d-devel
    gamemode mangohud lutris
)

softs=(
    "${wm_de[@]}"
    "${terminal_utils[@]}"
    "${system_utils[@]}"
    "${viewers[@]}"
    "${tools[@]}"
    "${dev_tools[@]}"
    "${fonts[@]}")

for soft in "${softs[@]}"; do
    install_package "$soft"
done

if [ "$install_creative_suite" = true ]; then
    packages_to_install+=("${creative_suite[@]}")
fi

if [ "$install_nvidia" = true ]; then
    packages_to_install+=("${nvidia[@]}")
fi

if [ "$install_gaming" = true ]; then
    packages_to_install+=("${gaming[@]}")
fi

unique_packages=($(echo "${packages_to_install[@]}" | tr ' ' '\n' | sort -u | tr '\n' ' '))

echo "Installing software..."
sudo zypper in --no-confirm "${unique_packages[@]}"

echo "Running additional setup steps..."

opi codecs -n
opi vivaldi -n

fc-cache -f -v

echo "Setup complete!"
