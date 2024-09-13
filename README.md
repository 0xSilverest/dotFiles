# dotFiles

### Preview

![Preview1](./Imgs/preview1.webp)
![Preview2](./Imgs/preview2.webp)
![Preview3](./Imgs/preview3.webp)

Credit:

Georgi Karadenizov : ![Wallpaper](https://www.artstation.com/artwork/LRPJBP)

### Tools

| Tools | Software |
| --- | --- |
| WM | [xmonad](.config/xmonad) |
| Compositor | [picom](.config/xmonad/scripts/picom.conf) |
| StatusBar | [Polybar](.config/polybar) |
| Terminal | [Kitty](.config/kitty) |
| Shell | [fish](.config/fish) |
| Editor | [Neovim](.config/nvim) |
| File Manager | [Thunar](.config/gtk3.0) |
| Notifications | [dunst](.config/dunst) |
| Pdf Reader | [zathura](.config/zathura/) |
| Launcher | [rofi](.config/rofi/) |

### Fixes

GRUB config for Huawei Matebook 14D AMD Ryzen 2500U to random freezes issues

```
GRUB_CMDLINE_LINUX_DEFAULT="quiet idle=nomwait acpi_backlight=video apparmor=1"
```
