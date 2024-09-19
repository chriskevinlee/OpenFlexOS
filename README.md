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

# Show Qtile bar on all Screens

Your default configuration for the Qtile bar will be like...

```
screens = [
    Screen(
        top=bar.Bar(
            [
                widget.TextBox(
                    text=" ",
                    foreground='#00ffff',  # Aqua
                    mouse_callbacks={'Button1': lambda: qtile.cmd_spawn(get_script_path("rofi.sh"))}
                ),
                widget.Spacer(length=10),
                widget.Clock(
                    foreground='#4666ff',  # Neon Blue
                    format="  %a %d-%m-%Y",
                    #format="  %a %d-%B-%Y",
                ),
                widget.Spacer(length=10),
                widget.Clock(
                    foreground='#ffe135',  # Banana Yellow
                    format="  %I:%M:%S %p",
                ),
                widget.Spacer(length=10),
                widget.CPU(
                    format='   {load_percent}%', 
                    foreground='#ff5800',  # Orange (Crayola)
                ),
                widget.Spacer(length=10),
                widget.Memory(
                    foreground='#ccff00',  # Electric Lime
                    format='   {MemPercent}%',
                ),
                widget.Spacer(),
                widget.GroupBox(
                    active='#ffd700',  # Gold1
                ),
                widget.WindowName(
                    foreground='#39ff14',  # Neon Greenf
                    max_chars=70
                ),
                widget.Systray(),
                widget.Spacer(length=20),
                widget.CurrentLayout(
                    foreground='#fc74fd',  # Pink Flamingo
                ),
                widget.Spacer(length=10),
                BrightnessWidget(),
                VolumeWidget(),
                widget.Spacer(length=10),
                widget.CheckUpdates(
                    distro="Arch",
                    colour_have_updates='#f38fa9',
                    colour_no_updates='#f38fa9', 
                    display_format='󰇚 {updates}',
                ),
                widget.Spacer(length=10),
                battery_widget(),
                widget.Spacer(length=10),
                script_widget,  # (Network Widget) A Script runs and displays an icon depending on if connected to wifi, ethernet, or disconnected
                ssh_widget,
                widget.Spacer(length=10),
                current_user_widget,
                widget.TextBox(
                    text="⏻ ",
                    foreground='#00ff7f',  # SpringGreen1
                    mouse_callbacks={'Button1': lambda: qtile.cmd_spawn(get_script_path("power.sh"))},
                ),
                # End of My Config: Added and moved widgets
            ],
            24,
        ),
    ),
]

```

We need to change the way we display the Qtile bar. To display on all screens we need to create a function to store the Qtile bar config in like this. Copy this and paste it towards the top of your config.py

```
def init_bar():
    return bar.Bar(
        [
                widget.TextBox(
                    text=" ",
                    foreground='#00ffff',  # Aqua
                    mouse_callbacks={'Button1': lambda: qtile.cmd_spawn(get_script_path("rofi.sh"))}
                ),
                widget.Spacer(length=10),
                widget.Clock(
                    foreground='#4666ff',  # Neon Blue
                    format="  %a %d-%m-%Y",
                    #format="  %a %d-%B-%Y",
                ),
                widget.Spacer(length=10),
                widget.Clock(
                    foreground='#ffe135',  # Banana Yellow
                    format="  %I:%M:%S %p",
                ),
                widget.Spacer(length=10),
                widget.CPU(
                    format='   {load_percent}%', 
                    foreground='#ff5800',  # Orange (Crayola)
                ),
                widget.Spacer(length=10),
                widget.Memory(
                    foreground='#ccff00',  # Electric Lime
                    format='   {MemPercent}%',
                ),
                widget.Spacer(),
                widget.GroupBox(
                    active='#ffd700',  # Gold1
                ),
                widget.WindowName(
                    foreground='#39ff14',  # Neon Greenf
                    max_chars=70
                ),
                widget.Systray(),
                widget.Spacer(length=20),
                widget.CurrentLayout(
                    foreground='#fc74fd',  # Pink Flamingo
                ),
                widget.Spacer(length=10),
                BrightnessWidget(),
                VolumeWidget(),
                widget.Spacer(length=10),
                widget.CheckUpdates(
                    distro="Arch",
                    colour_have_updates='#f38fa9',
                    colour_no_updates='#f38fa9', 
                    display_format='󰇚 {updates}',
                ),
                widget.Spacer(length=10),
                battery_widget(),
                widget.Spacer(length=10),
                script_widget,  # (Network Widget) A Script runs and displays an icon depending on if connected to wifi, ethernet, or disconnected
                ssh_widget,
                widget.Spacer(length=10),
                current_user_widget,
                widget.TextBox(
                    text="⏻ ",
                    foreground='#00ff7f',  # SpringGreen1
                    mouse_callbacks={'Button1': lambda: qtile.cmd_spawn(get_script_path("power.sh"))},
                ),
                # End of My Config: Added and moved widgets
        ],
        24,  # Bar size (height in pixels)
    )
```


Now replace 

```
screens = [
    Screen(
        top=bar.Bar(
            [
                widget.TextBox(
                    text=" ",
                    foreground='#00ffff',  # Aqua
                    mouse_callbacks={'Button1': lambda: qtile.cmd_spawn(get_script_path("rofi.sh"))}
                ),
                widget.Spacer(length=10),
                widget.Clock(
                    foreground='#4666ff',  # Neon Blue
                    format="  %a %d-%m-%Y",
                    #format="  %a %d-%B-%Y",
                ),
                widget.Spacer(length=10),
                widget.Clock(
                    foreground='#ffe135',  # Banana Yellow
                    format="  %I:%M:%S %p",
                ),
                widget.Spacer(length=10),
                widget.CPU(
                    format='   {load_percent}%', 
                    foreground='#ff5800',  # Orange (Crayola)
                ),
                widget.Spacer(length=10),
                widget.Memory(
                    foreground='#ccff00',  # Electric Lime
                    format='   {MemPercent}%',
                ),
                widget.Spacer(),
                widget.GroupBox(
                    active='#ffd700',  # Gold1
                ),
                widget.WindowName(
                    foreground='#39ff14',  # Neon Greenf
                    max_chars=70
                ),
                widget.Systray(),
                widget.Spacer(length=20),
                widget.CurrentLayout(
                    foreground='#fc74fd',  # Pink Flamingo
                ),
                widget.Spacer(length=10),
                BrightnessWidget(),
                VolumeWidget(),
                widget.Spacer(length=10),
                widget.CheckUpdates(
                    distro="Arch",
                    colour_have_updates='#f38fa9',
                    colour_no_updates='#f38fa9', 
                    display_format='󰇚 {updates}',
                ),
                widget.Spacer(length=10),
                battery_widget(),
                widget.Spacer(length=10),
                script_widget,  # (Network Widget) A Script runs and displays an icon depending on if connected to wifi, ethernet, or disconnected
                ssh_widget,
                widget.Spacer(length=10),
                current_user_widget,
                widget.TextBox(
                    text="⏻ ",
                    foreground='#00ff7f',  # SpringGreen1
                    mouse_callbacks={'Button1': lambda: qtile.cmd_spawn(get_script_path("power.sh"))},
                ),
                # End of My Config: Added and moved widgets
            ],
            24,
        ),
    ),
]
```

with 

```
screens = [
    Screen(top=init_bar()),  # Screen 1
    Screen(top=init_bar()),  # Screen 2
    Screen(top=init_bar()),  # Screen 3
]

```

# Set Keyboard Layout

You may need to set the keyboard layout for the graphical interface by running the following command to display the keyboard layouts you can use 

```
localectl list-x11-keymap-layouts
```
To set the keyboard layout run, i am using gb as a exmaple
```
sudo localectl set-x11-keymap gb
```

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


# Qtile Keybindings

| Key Binding         | Comment                                  |
| -------------------- | ----------------------------------------- |
| Alt d                | Open Rofi App menu                        |
| Alt q                | Open Rofi Power Menu                      |
| Alt f                | Open Firefox                              |
| alt h,j,k,l          | Resize Selected Window                    |
| Super w              | Close Selected Window                     |
| Super Enter          | Open Alacritty Terminal                   |
| Super Shift h,j,k,l  | Move Selected Window                      |
| Super Shift 1-9      | Move Selected Window to another workspace |
| Super f              | Full Screen Selected Window               |
| Super m,i            | Increase,decrease Window size             |
| Super t              | Float Selected Window                     |
| Super left-mouse drag | Move Floating Window                      |
| Alt h,j,k,l          | increase and decrease window size in Floating Window Mode |
| Super 1-9            | Switch to work Space                      |
| Super tab            | Switch Layout                             |
| Super ctrl r         | Reload Qtile Config                       |
| Super h,j,k,l        | Select a Window                           |
| ctrl w x             | Open Wallpaper Changer first and select a wallpaper |
