#!/bin/bash
 
# Check to make sure script has root/sudo permissions
    if [ "$(id -u)" -ne 0 ]; then
        echo "Please run this script with sudo:"
        echo "sudo $0"
        exit 1
    fi

# Clear's output, Welcomes and ask the user if like to install OpenFlexOS
    clear
    echo "Welcome to OpenFlexOS Installation script"
    read -p "Would you like to start installing OpenFlexOS? (y/n) " yn

# Displays a invalid input message to the user if y or n is not selected
    while [[ ! $yn =~ ^(y|n)$ ]]; do
        clear
        echo "Invalid Input. You Entered $yn"
        read -p "Would you like to start installing OpenFlexOS? (y/n) " yn
    done

# Function: List of packages to be install
    install_packages () {
        pacman --noconfirm --needed -S sddm # Display Manager(login manager)
        pacman --noconfirm --needed -S mpv # For login,logout,lock,reboot and shutdown sounds
        pacman --noconfirm --needed -S xscreensaver # Screensaver
        pacman --noconfirm --needed -S feh # To set wallpapers
        pacman --noconfirm --needed -S rofi # For Application and power Laucher
        pacman --noconfirm --needed -S arandr # To set Screen Resolution
        pacman --noconfirm --needed -S ttf-nerd-fonts-symbols # For icons
        pacman --noconfirm --needed -S xdg-user-dirs # Create user directories upon user creation
        pacman --noconfirm --needed -S alacritty # Terminal Appliction
        pacman --noconfirm --needed -S conky # System infomation overlay on desktop
        pacman --noconfirm --needed -S lsd # coloured ls output
        pacman --noconfirm --needed -S bat # replacement for cat with coloured output
        pacman --noconfirm --needed -S pavucontrol-qt # Audio Control GUI
        pacman --noconfirm --needed -S pipewire-pulse # Audio Control
        pacman --noconfirm --needed -S git # to download git packages
        pacman --noconfirm --needed -S qt5-graphicaleffects qt5-quickcontrols2 qt5-svg # for sddm theme
        pacman --noconfirm --needed -S zsh # zsh Shell
        pacman --noconfirm --needed -S zsh-history-substring-search # for zsh shell allows to search throught typed commands
        pacman --noconfirm --needed -S zsh-syntax-highlighting # for the zsh shell will show vaild commands in green and invaild commands in red
        pacman --noconfirm --needed -S zsh-autosuggestions # for the zsh shell wil show suggested typed commands
        pacman --noconfirm --needed -S wget # To Download zsh-sudo plugin for zsh
        pacman --noconfirm --needed -S firefox # Default Web Browser
        pacman --noconfirm --needed -S flameshot # For screenshots
        pacman --noconfirm --needed -S htop # Terminal System Monitor
        pacman --noconfirm --needed -S caja # A file Manager
        pacman --noconfirm --needed -S xarchiver # Archiver to work with file manager pcmanfm
        pacman --noconfirm --needed -S p7zip
        pacman --noconfirm --needed -S unzip # Add zip support to xarchiver
        pacman --noconfirm --needed -S polkit-gnome # Polkit authentication
        pacman --noconfirm --needed -S sxiv # To Apply Wallpapers with a script
        pacman --noconfirm --needed -S qt5ct # GUI apply theme for qt5
        pacman --noconfirm --needed -S qt6ct # GUI apply theme for qt6
        pacman --noconfirm --needed -S kvantum-qt5 # GUI apply theme for qt
        pacman --noconfirm --needed -S lxappearance-gtk3 # GUI apply theme for GTK
        pacman --noconfirm --needed -S materia-gtk-theme # A GTK theme
        pacman --noconfirm --needed -S dunst # Notification System
        pacman --noconfirm --needed -S picom # Compositor for effect
        pacman --noconfirm --needed -S wmctrl # To change sxiv window title, used in wallpaper_changer.sh
        pacman --noconfirm --needed -S galculator
        pacman --noconfirm --needed -S python-psutil
        pacman --noconfirm --needed -S pacman-contrib
        pacman --noconfirm --needed -S pkgfile

    }

# Function: Get zsh path, checks to see if any users already exists if not it ask the user to create a user and allows user to copy config files to already existing users and added users
users_function() {
    get_zsh_path() {
        if [[ -x /bin/zsh ]]; then
            echo "/bin/zsh"
        elif [[ -x /usr/bin/zsh ]]; then
            echo "/usr/bin/zsh"
        else
            echo "zsh not found" >&2
            exit 1
        fi
    }

    zsh_path=$(get_zsh_path)

    user_list=($(grep "/home/" /etc/passwd | awk -F : '{print $1}'))
    if ([[ ${#user_list[@]} -eq 0 ]]); then
        read -p "No users are detected with home directories, would you like to create one? (y/n): " yn
        if [[ $yn == "y" ]]; then
            while true; do
                read -p "Please enter a username: " username
                if [[ ! -z $username ]]; then
                    break
                else
                    echo "Username cannot be empty. Please enter a valid username."
                fi
            done

            while true; do
                read -p "Would you like to make this user a sudo user? (y/n): " yn_sudo
                if [[ $yn_sudo == "y" || $yn_sudo == "n" ]]; then
                    break
                else
                    echo "Invalid input. Please enter 'y' or 'n'."
                fi
            done

            useradd -m $username
            passwd $username
            echo "/home/$username/.config/wallpapers/default/6xVGpvY-arch-linux-wallpaper.png" > /home/$username/.config/$lower_main/.selected_wallpaper
            chown $username:$username /home/$username/.config/$lower_main/.selected_wallpaper

            if [[ $yn_sudo == "y" ]]; then
                sudo usermod -aG wheel $username
            fi
            user_list+=("$username")  # Add the new user to the list
        fi
    fi






    if [[ ${#user_list[@]} -gt 0 ]]; then
        while true; do
            echo "Existing users with home directories:"
            for ((i = 0; i < ${#user_list[@]}; i++)); do
                echo "$(($i + 1)). ${user_list[i]}"
            done

            read -p "Select a user to copy files to (or type 'add' to add another user, or 'skip' to skip to the next part): " selection

            if [[ "$selection" == "add" ]]; then
                while true; do
                    read -p "Please enter a username: " username
                    if [[ ! -z $username ]]; then
                        break
                    else
                        echo "Username cannot be empty. Please enter a valid username."
                    fi
                done

                while true; do
                    read -p "Would you like to make this user a sudo user? (y/n): " yn_sudo
                    if [[ $yn_sudo == "y" || $yn_sudo == "n" ]]; then
                        break
                    else
                        echo "Invalid input. Please enter 'y' or 'n'."
                    fi
                done

                useradd -m $username
                passwd $username
                echo "/home/$username/.config/wallpapers/default/6xVGpvY-arch-linux-wallpaper.png" > /home/$username/.config/$lower_main/.selected_wallpaper
                chown $username:$username /home/$username/.config/$lower_main/.selected_wallpaper

                if [[ $yn_sudo == "y" ]]; then
                    sudo usermod -aG wheel $username
                fi
                user_list+=("$username")  # Add the new user to the list
                echo "User $username added."
            elif [[ "$selection" == "skip" ]]; then
                break
            elif [[ $selection =~ ^[0-9]+$ && $selection -ge 1 && $selection -le ${#user_list[@]} ]]; then
                selected_user="${user_list[$(($selection - 1))]}"
                if [[ ! -d "/home/$selected_user/.config/" ]]; then
                    echo "Creating .config directory and copying files..."
                    mkdir "/home/$selected_user/.config"
                    cp -r assets/config/$lower_main "/home/$selected_user/.config/$lower_main"

                    if [[ ! -d "/home/$selected_user/.config/wallpapers/" ]]; then
                        cp -r assets/config/wallpapers/ "/home/$selected_user/.config/wallpapers/"
                    else
                        echo "Wallpapers directory already exists. Skipping copy."
                    fi

                    chsh -s "$zsh_path" $selected_user
                    cp assets/dot.bashrc "/home/$selected_user/.bashrc"
                    cp assets/dot.p10k.zsh "/home/$selected_user/.p10k.zsh"
                    cp assets/dot.xscreensaver "/home/$selected_user/.xscreensaver"
                    cp assets/dot.zshrc "/home/$selected_user/.zshrc"
                    cp assets/dot.gtkrc-2.0 "/home/$selected_user/.gtkrc-2.0"
                    git clone https://github.com/romkatv/powerlevel10k.git "/home/$selected_user/.config/powerlevel10k"
                    chown -R $selected_user:$selected_user "/home/$selected_user/.config/"
                    chmod -R +x "/home/$selected_user/.config/$lower_main/scripts/" 

                    cp -r assets/config/Kvantum "/home/$selected_user/.config/"
                    cp -r assets/config/qt5ct "/home/$selected_user/.config/"
                    cp -r assets/config/qt6ct "/home/$selected_user/.config/"
                    cp -r assets/config/picom "/home/$selected_user/.config/"
                    cp -r assets/config/sxiv "/home/$selected_user/.config/"

                    echo "/home/$selected_user/.config/wallpapers/default/6xVGpvY-arch-linux-wallpaper.png" > /home/$selected_user/.config/$lower_main/.selected_wallpaper
                    chown $selected_user:$selected_user /home/$selected_user/.config/$lower_main/.selected_wallpaper
                else
                    echo "Copying files..."
                    cp -r assets/config/$lower_main "/home/$selected_user/.config/$lower_main"
                
                    if [[ ! -d "/home/$selected_user/.config/wallpapers/" ]]; then
                        cp -r assets/config/wallpapers/ "/home/$selected_user/.config/wallpapers/"
                    else
                        echo "Wallpapers directory already exists. Skipping copy."
                    fi

                    chsh -s "$zsh_path" $selected_user
                    cp assets/dot.bashrc "/home/$selected_user/.bashrc"
                    cp assets/dot.p10k.zsh "/home/$selected_user/.p10k.zsh"
                    cp assets/dot.xscreensaver "/home/$selected_user/.xscreensaver"
                    cp assets/dot.zshrc "/home/$selected_user/.zshrc"
                    cp assets/dot.gtkrc-2.0 "/home/$selected_user/.gtkrc-2.0"
                    git clone https://github.com/romkatv/powerlevel10k.git "/home/$selected_user/.config/powerlevel10k"
                    chown -R $selected_user:$selected_user "/home/$selected_user/.config/"
                    chmod -R +x "/home/$selected_user/.config/$lower_main/scripts/"

                    cp -r assets/config/Kvantum "/home/$selected_user/.config/"
                    cp -r assets/config/qt5ct "/home/$selected_user/.config/"
                    cp -r assets/config/qt6ct "/home/$selected_user/.config/"
                    cp -r assets/config/picom "/home/$selected_user/.config/"
                    cp -r assets/config/sxiv "/home/$selected_user/.config/"

                    echo "/home/$selected_user/.config/wallpapers/default/6xVGpvY-arch-linux-wallpaper.png" > /home/$selected_user/.config/$lower_main/.selected_wallpaper
                    chown $selected_user:$selected_user /home/$selected_user/.config/$lower_main/.selected_wallpaper
                fi
            else
                clear
                echo "Invalid selection. Please try again."
            fi
        done
    fi
}

# Function: Set environment variables for qt and gtk theme
    set_env_variables() {
        echo "QT_QPA_PLATFORMTHEME=qt5ct" >> /etc/environment
        echo "QT_AUTO_SCREEN_SCALE_FACTOR=0" >> /etc/environment
        echo "QT_SCALE_FACTOR=1" >> /etc/environment
        echo "QT_FONT_DPI=96" >> /etc/environment
    }

# Function: Enables sddm and copy config files
    enable_copytheme_ssdm () {
        systemctl enable sddm
        cp -r assets/corners /usr/share/sddm/themes/
        cp /usr/lib/sddm/sddm.conf.d/default.conf /etc/sddm.conf
        sed -i s/Current=/Current=corners/ /etc/sddm.conf
    }

# Function: Copy config files to /etc/skel for newly created users
    copy_config_skel () {
        if [[ ! -d /etc/skel/.config ]]; then
            mkdir /etc/skel/.config
            if [[ ! -d /etc/skel/.config/wallpapers ]]; then
                cp -r assets/config/wallpapers/ /etc/skel/.config/wallpapers/
            else
                echo "Wallpapers directory already exists. Skipping copy."
            fi
            cp -r assets/config/$lower_main /etc/skel/.config/$lower_main
            cp -r assets/config/gtk-3.0 /etc/skel/.config/gtk-3.0
            cp -r assets/config/Kvantum/ /etc/skel/.config/Kvantum
            cp -r assets/config/qt5ct/ /etc/skel/.config/qt5ct
            cp -r assets/config/qt6ct/ /etc/skel/.config/qt6ct
            cp -r assets/config/picom /etc/skel/.config/picom
            cp -r assets/config/sxiv /etc/skel/.config/sxiv
            cp assets/dot.gtkrc-2.0 /etc/skel/.gtkrc-2.0
            cp assets/dot.xscreensaver /etc/skel/.xscreensaver
            cp assets/dot.zshrc /etc/skel/.zshrc
            cp assets/dot.bashrc /etc/skel/.bashrc
            cp assets/dot.p10k.zsh /etc/skel/.p10k.zsh
            chmod -R +x /etc/skel/.config/$lower_main/scripts/
            git clone https://github.com/romkatv/powerlevel10k.git /etc/skel/.config/powerlevel10k/
        elif [[  -d /etc/skel/.config ]]; then
            if [[ ! -d /etc/skel/.config/wallpapers ]]; then
                cp -r assets/config/wallpapers/ /etc/skel/.config/wallpapers/
            else
                echo "Wallpapers directory already exists. Skipping copy."
            fi
            cp -r assets/config/$lower_main /etc/skel/.config/$lower_main
            cp -r assets/config/gtk-3.0 /etc/skel/.config/gtk-3.0
            cp -r assets/config/Kvantum/ /etc/skel/.config/Kvantum
            cp -r assets/config/qt5ct/ /etc/skel/.config/qt5ct
            cp -r assets/config/qt6ct/ /etc/skel/.config/qt6ct
            cp -r assets/config/picom /etc/skel/.config/picom
            cp -r assets/config/sxiv /etc/skel/.config/sxiv
            cp assets/dot.gtkrc-2.0 /etc/skel/.gtkrc-2.0
            cp assets/dot.xscreensaver /etc/skel/.xscreensaver
            cp assets/dot.zshrc /etc/skel/.zshrc
            cp assets/dot.bashrc /etc/skel/.bashrc
            cp assets/dot.p10k.zsh /etc/skel/.p10k.zsh
            chmod -R +x /etc/skel/.config/$lower_main/scripts/
            git clone https://github.com/romkatv/powerlevel10k.git /etc/skel/.config/powerlevel10k/     
        fi
    }

# Function: Miscellaneous configurations 
    miscellaneous_configs () {
         cp assets/wallpaper_changer.sh /usr/local/bin/wallpaper_changer.sh
        chmod +x /usr/local/bin/wallpaper_changer.sh
        cp assets/wallpaper.desktop /usr/share/applications/wallpaper.desktop

        cp -r assets/Midnight-Red /usr/share/themes/Midnight-Red
        cp -r assets/Midnight-Green /usr/share/themes/Midnight-Green
        cp -r assets/Arc-Darkest /usr/share/themes/Arc-Darkest
        cp -r assets/Vivid-Dark-Icons /usr/share/icons/Vivid-Dark-Icons
                            
        mkdir /usr/share/zsh/plugins/zsh-sudo
        wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/plugins/sudo/sudo.plugin.zsh -P /usr/share/zsh/plugins/zsh-sudo
        pkgfile -u
                            
        clear
        sed -i 's/# %wheel ALL=(ALL:ALL) ALL/%wheel ALL=(ALL:ALL) ALL/' /etc/sudoers
        sed -i  's|SHELL=/usr/bin/bash|SHELL=/usr/bin/zsh|' /etc/default/useradd
        sed -i 's/#Color/Color/' /etc/pacman.conf
        sed -i 's/#VerbosePkgLists/VerbosePkgLists/' /etc/pacman.conf
        sed -i '/^#ParallelDownloads = 5/a ILoveCandy' /etc/pacman.conf
        
        # Setup hibination
        SWAP_INFO=$(swapon --show --noheadings)
        SWAP_DEVICE=$(echo "$SWAP_INFO" | awk '{print $1}')
        sed -i 's/HOOKS=(base udev autodetect modconf block filesystems keyboard fsck)/HOOKS=(base udev autodetect modconf block filesystems keyboard resume fsck)/' /etc/mkinitcpio.conf
        mkinitcpio -P
        sed -i "s|GRUB_CMDLINE_LINUX=\"\"|GRUB_CMDLINE_LINUX=\"resume=$SWAP_DEVICE\"|" /etc/default/grub
        grub-mkconfig -o /boot/grub/grub.cfg
        clear
    }

# If the User selects y the installation will start
    if [[ $yn = y ]]; then
    read -p "Would you like to update? (y/n) " yn

    # Gives a invaild input message if y or n is not entered
    while [[ ! $yn = y ]] && [[ ! $yn = n ]]; do
        clear
        echo "Invaild Input! You Entered $yn"
        read -p "Would you like to update? (y/n) " yn
    done

    # Runs system updates if y is selected
    if [[ $yn = y ]]; then
        echo "Updating..."
        sleep 5
        pacman --noconfirm -Syu
    fi
    clear

    # Set's a array, asks the user which window manager to install and sets a promt to tell the user to use a number
    options=("Qtile" "Openbox" "Exit Installation Script" "Reboot" "PowerOff")
    echo "Please Choose a Window Manager to install"
    PS3="Please Choose a Number: "

    select main in "${options[@]}"
        do
        case $main in
            # Installs everything needed to run Qtile
                "Qtile" )
                    lower_main=$(echo "$main" | tr '[:upper:]' '[:lower:]')

                    clear
                    echo "Installing required packages for Qtile-OpenFlexOS..."
                    sleep 5
                    pacman --noconfirm --needed -S qtile
                    install_packages
                    
                    enable_copytheme_ssdm

                    copy_config_skel

                    set_env_variables

                    miscellaneous_configs

                    mv /usr/share/wayland-sessions/qtile-wayland.desktop /usr/share/wayland-sessions/qtile-wayland.desktop.bak

                    users_function
                ;;
                "Openbox" )
                    lower_main=$(echo "$main" | tr '[:upper:]' '[:lower:]')

                    echo "Installing required packages for Openbox-OpenFlexOS..."
                    sleep 5
                    pacman --noconfirm --needed -S openbox # Window Manager
                    pacman --noconfirm --needed -S tint2 # status bar Window Manager
                    pacman --noconfirm --needed -S obconf # Set Openbox Theme
                    install_packages
                    
                    enable_copytheme_ssdm

                    copy_config_skel

                    set_env_variables

                    miscellaneous_configs

                    cp -r assets/Vedanta-dark-openbox /usr/share/themes/Vedanta-dark-openbox

                    users_function
                ;;
                "Exit Installation Script" )
                    echo "Exiting Installation Script..."
                    sleep 3
                    exit 0
                ;;
                "Reboot" )
                    reboot
                ;;
                "PowerOff" )
                    poweroff
                ;;
        esac
    clear
    echo "Please Choose a Window Manager to install"
    REPLY=
    done
    fi

# If the user enters n then the install it exit
    if [[ $yn = n ]]; then
        echo "Exiting OpenFlexOS Installation..."
        sleep 5
        exit 0
    fi
