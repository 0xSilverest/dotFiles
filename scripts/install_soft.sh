#!/bin/bash

print_usage() {
    echo "Usage: $0 [--gaming] [--nvidia] [--creative-suite]"
    echo "  --gaming         : Steam, Wine, Vulkan, Lutris, etc."
    echo "  --nvidia         : NVIDIA drivers"
    echo "  --creative-suite : GIMP, Inkscape, Krita, Darktable"
}

install_creative_suite=false
install_nvidia=false
install_gaming=false

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
    hyprland hyprpaper hyprlock hypridle waybar
    hyprland-fish-completion
    rofi thunar dunst
)

terminal_utils=(
    kitty fish bat eza gksu ncdu ripgrep
    ripgrep-bash-completion ripgrep-fish-completion
    bottom fzf fd neovim
)

system_utils=(
    udiskie NetworkManager tlp powertop
    NetworkManager-applet qt6ct
)

viewers=(
    qview okular
)

tools=(
    mpv playerctl vlc ffmpeg-7 qbittorrent
    audacity obs-studio flameshot unrar
    bitwarden neovide easyeffects strawberry
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
    "${fonts[@]}")

packages_to_install=("${softs[@]}")

if [ "$install_creative_suite" = true ]; then
    packages_to_install+=("${creative_suite[@]}")
fi

if [ "$install_nvidia" = true ]; then
    packages_to_install+=("${nvidia[@]}")
fi

if [ "$install_gaming" = true ]; then
    packages_to_install+=("${gaming[@]}")
fi

unique_packages=($(printf '%s\n' "${packages_to_install[@]}" | sort -u))

echo "Installing ${#unique_packages[@]} packages..."
sudo zypper in --no-confirm "${unique_packages[@]}"

echo "Running additional setup steps..."

opi codecs -n
opi vivaldi -n

fc-cache -f -v

echo "Software install complete."
