# What is OpenFlexOS?

OpenFlexOS combines the principles of openness and flexibility, giving users the freedom to configure and modify their system to suit their needs. It’s a Window Manager-centric Operating System designed to offer a variety of window managers, currently featuring Openbox and Qtile.

Initially created for personal use, OpenFlexOS is now something I’d love to share with others. I’ve integrated custom bash scripts to provide unique programs, features, and widgets, enhancing the user experience with added functionality and customization options.

# Installed Packages
- sddm
- mpv
- xscreensaver
- feh
- rofi
- arandr
- ttf-nerd-fonts-symbols
- xdg-user-dirs
- alacritty
- conky
- lsd
- bat
- pavucontrol-qt
- pipewire-pulse
- git
- qt5-graphicaleffects 
- qt5-quickcontrols2 
- qt5-svg
- zsh
- zsh-history-substring-search
- zsh-syntax-highlighting
- zsh-autosuggestions
- wget
- firefox
- flameshot
- htop
- caja
- xarchiver
- p7zip
- unzip
- polkit-gnome
- sxiv
- qt5ct
- qt6ct
- kvantum-qt5
- lxappearance-gtk3
- materia-gtk-theme
- dunst
- picom
- wmctrl
- galculator
- python-psutil
- pacman-contrib
- pkgfile

# Scripts and configurations File Locations 

### OpenBox Scripts and Configurations stored at 
```
.config/openbox
├── autostart
├── environment
├── menu.xml
├── png_icons
│   ├── battery-charging.png
│   ├── battery-discharging.png
│   ├── battery-full.png
│   ├── brightness.png
│   ├── cancel.png
│   ├── computer.png
│   ├── menu.png
│   ├── personal-computer.png
│   ├── power-on.png
│   ├── ssh.png
│   ├── volume.png
│   └── wifi.png
├── rc.xml
├── rofi
│   ├── config.rasi
│   └── mytheme2.rasi
├── scripts
│   ├── battery.sh
│   ├── brightness.sh
│   ├── nmcli.sh
│   ├── power.sh
│   ├── rofi.sh
│   ├── rofi-wifi-menu.sh
│   ├── sh_wallpaper.sh
│   ├── sounds.sh
│   ├── ssh.sh
│   └── volume.sh
├── .selected_wallpaper
├── sounds
│   ├── 8-bit-spaceship-startup-102666.mp3
│   ├── ambient-piano-logo-165357.mp3
│   ├── computer-startup-music-97699.mp3
│   ├── cozy-weaves-soft-logo-176378.mp3
│   ├── cute-level-up-3-189853.mp3
│   ├── game-bonus-144751.mp3
│   ├── introduction-sound-201413.mp3
│   ├── level-up-191997.mp3
│   ├── lovelyboot1-103697.mp3
│   ├── marimba-win-f-2-209688.mp3
│   ├── retro-audio-logo-94648.mp3
│   ├── start-computeraif-14572.mp3
│   ├── startup-87026.mp3
│   ├── startup-sound-fx-1-roland-mt-32-95204.mp3
│   └── system-notification-199277.mp3
└── tint2
    └── tint2rc
```

### Qtile Scripts and Configurations stored at 
```
.config/qtile
├── config.py
├── conky
│   └── conky.conf
├── rofi
│   ├── config.rasi
│   └── mytheme2.rasi
├── scripts
│   ├── autostart.sh
│   ├── brightness.sh
│   ├── nmcli.sh
│   ├── power.sh
│   ├── rofi.sh
│   ├── rofi-wifi-menu.sh
│   ├── sh_wallpaper.sh
│   ├── sound.sh
│   ├── ssh.sh
│   └── volume.sh
├── .selected_wallpaper
├── sounds
│   ├── 8-bit-spaceship-startup-102666.mp3
│   ├── ambient-piano-logo-165357.mp3
│   ├── computer-startup-music-97699.mp3
│   ├── cozy-weaves-soft-logo-176378.mp3
│   ├── cute-level-up-3-189853.mp3
│   ├── game-bonus-144751.mp3
│   ├── introduction-sound-201413.mp3
│   ├── level-up-191997.mp3
│   ├── lovelyboot1-103697.mp3
│   ├── marimba-win-f-2-209688.mp3
│   ├── retro-audio-logo-94648.mp3
│   ├── start-computeraif-14572.mp3
│   ├── startup-87026.mp3
│   ├── startup-sound-fx-1-roland-mt-32-95204.mp3
│   └── system-notification-199277.mp3
└── systemd
    └── feh_wallpaper.service
```

### Wallpaper Changer script is at
```
/usr/local/bin
└── wallpaper_changer.sh
```
### Default Wallpapers stored at
```
.config/wallpapers
└── default
    ├── 6xVGpvY-arch-linux-wallpaper.png
    ├── Hn6ZHwO-arch-linux-wallpaper.jpg
    ├── ic8ubjf-arch-linux-wallpaper.png
    ├── O9yrcEO-arch-linux-wallpaper.jpg
    ├── PKt7K9T-arch-linux-wallpaper.jpg
    ├── R4ct6De-arch-linux-wallpaper.png
    └── zxAAEx2-arch-linux-wallpaper.jpg
```
# Notes

### Suspend and Hibernation: 
Suspend and Hibernation should work as long as you have swap setup and configured with enough space. Some system files will be edited by the script to get Suspend and Hibernation to work, for:

**/etc/mkinitcpio.conf**: resume will be added to HOOKS=  

**/etc/default/grub**: GRUB_CMDLINE_LINUX= will be replaced with GRUB_CMDLINE_LINUX="resume=/dev/sda1" (/dev/sda1 being the swap device name)  

Once these files have been edited the script will update the grub configuration with grub-mkconfig -o /boot/grub/grub.cfg  

### System files being edited

**/etc/default/useradd**: SHELL=/usr/bin/bash will be replaced with SHELL=/usr/bin/zsh  
**/etc/sudoers**: will be edited to enable the wheel group to allow sudo users to run sudo   
**/etc/pacman.conf**: will replace \#Color with Color  
**/etc/pacman.conf**: will replace \#VerbosePkgLists with VerbosePkgLists  
**/etc/pacman.conf**: will be edited to find \#ParallelDownloads and add ILoveCandy  

The following will be added to **/etc/environment**

QT_QPA_PLATFORMTHEME=qt5ct  
QT_AUTO_SCREEN_SCALE_FACTOR=0  
QT_SCALE_FACTOR=1  
QT_FONT_DPI=96  

### Known Issues

If running in a VirtualBox vm picom will casue the mouse not to work correctly and cause things to be really slow or not to respond . To fix this you maybe to enter a tty and comment picom from the autostart file for one or both of openbox and qtile

# How do I Install OpenFlexOS?

PLEASE NOTE: Run at your Own Risk. I would recommend trying out OpenFlexOS in a VM.

To Install OpenFlexOS you will need to have a base Arch Linux Installed. However OpenFlexOS should work on any Arch Linux based Distribution, which have not yet been fully tested.  From a terminal/tty download OpenFlexOS from Github by running

```
git clone https://github.com/chriskevinlee/OpenFlexOS-Arch
```

Once Downloaded change directory

```
cd OpenFlexOS-Arch
```

Now make the install script executable and run it and follow the onscreen instructions 

```
chmod +x Install_OpenFlexOS.sh
sudo ./Install_OpenFlexOS.sh
```

# OpenFlexOS-Goodies

OpenFlexOS-Goodies.sh  is a bash script to install extra packages after installing OpenFlexOS. It contains packages like Brightness control and Bluetooth for laptop and various packages for media playback, editing and downloading other files and more. 

To run this script run 
```
chmod +x OpenFlexOS_Goodies.sh
sudo ./OpenFlexOS_Goodies.
```
