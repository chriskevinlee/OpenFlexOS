clear
echo "Please choose a package to install"

package_list=("vlc" "virtualbox" "gparted" "filezilla" "qbittorrent" "isoimagewriter" "obs-studio" "gimp" "audacity" "discord" "virt-manager-and-kvm" "Bluetooth" "Screen Brightness" "base-devel" "Exit Script")

PS3="Please Choose a Number: "
select user_package in "${package_list[@]}"
do
    case $user_package in
        "vlc" )
            clear

            echo "Media Player that Supports most multimedia files and dvd play back"
            read -p "Would you like to install $user_package? " install

            while [[ -z $install || ( $install != "y" && $install != "n" ) ]]; do
             read -p "Would you like to installlll $user_package? " install
            done

            if [[ $install = y ]]; then
                sudo pacman --noconfirm --needed -S vlc
            fi

            ;;
        "virtualbox" )
            clear

            echo "Virtualization platform to run virtual machines (VM's)"
            read -p "Would you like to install $user_package? " install

            while [[ -z $install || ( $install != "y" && $install != "n" ) ]]; do
             read -p "Would you like to installlll $user_package? " install
            done

            if [[ $install = y ]]; then
                sudo pacman --noconfirm --needed -S virtualbox virtualbox-host-modules-arch linux-headers
            fi

            ;;
        "gparted" )
            clear

            echo "A Partition manager"
            read -p "Would you like to install $user_package? " install

            while [[ -z $install || ( $install != "y" && $install != "n" ) ]]; do
             read -p "Would you like to installlll $user_package? " install
            done

            if [[ $install = y ]]; then
                sudo pacman --noconfirm --needed -S gparted
            fi

            ;;
        "filezilla" )
            clear

            echo "A FTP, FTPS and SFTP client to access ftp servers"
            read -p "Would you like to install $user_package? " install

            while [[ -z $install || ( $install != "y" && $install != "n" ) ]]; do
             read -p "Would you like to installlll $user_package? " install
            done

            if [[ $install = y ]]; then
                sudo pacman --noconfirm --needed -S filezilla
            fi

            ;;
        "qbittorrent" )
            clear

            echo "BitTorrent client to download torrent files"
            read -p "Would you like to install $user_package? " install

            while [[ -z $install || ( $install != "y" && $install != "n" ) ]]; do
             read -p "Would you like to installlll $user_package? " install
            done

            if [[ $install = y ]]; then
                sudo pacman --noconfirm --needed -S qbittorrent
            fi

            ;;
        "isoimagewriter" )
            clear

            echo "Flash ISO images to USB"
            read -p "Would you like to install $user_package? " install

            while [[ -z $install || ( $install != "y" && $install != "n" ) ]]; do
             read -p "Would you like to installlll $user_package? " install
            done

            if [[ $install = y ]]; then
                sudo pacman --noconfirm --needed -S isoimagewriter
            fi

            ;;
        "obs-studio" )
            clear

            echo "Recording and live streaming software"
            read -p "Would you like to install $user_package? " install

            while [[ -z $install || ( $install != "y" && $install != "n" ) ]]; do
             read -p "Would you like to installlll $user_package? " install
            done

            if [[ $install = y ]]; then
                sudo pacman --noconfirm --needed -S obs-studio
            fi

            ;;
        "gimp" )
            clear

            echo "Image editing software"
            read -p "Would you like to install $user_package? " install

            while [[ -z $install || ( $install != "y" && $install != "n" ) ]]; do
             read -p "Would you like to installlll $user_package? " install
            done

            if [[ $install = y ]]; then
                sudo pacman --noconfirm --needed -S gimp
            fi

            ;;
        "audacity" )
            clear

            echo "Audio editing software"
            read -p "Would you like to install $user_package? " install

            while [[ -z $install || ( $install != "y" && $install != "n" ) ]]; do
             read -p "Would you like to installlll $user_package? " install
            done

            if [[ $install = y ]]; then
                sudo pacman --noconfirm --needed -S audacity
            fi

            ;;
        "discord" )
            clear

            echo "Voice and Text Chat"
            read -p "Would you like to install $user_package? " install

            while [[ -z $install || ( $install != "y" && $install != "n" ) ]]; do
             read -p "Would you like to installlll $user_package? " install
            done

            if [[ $install = y ]]; then
                sudo pacman --noconfirm --needed -S discord
            fi

            ;;
        "virt-manager-and-kvm" )
            clear

            echo "Virtualization platform to run virtual machines (VM's)"
            read -p "Would you like to install $user_package? " install

            while [[ -z $install || ( $install != "y" && $install != "n" ) ]]; do
             read -p "Would you like to installlll $user_package? " install
            done

            if [[ $install = y ]]; then
                sudo pacman --noconfirm --needed -S qemu virt-manager virt-viewer dnsmasq vde2 bridge-utils openbsd-netcat iptables libguestfs qemu-emulators-full
                sudo usermod -aG libvirt $USER # Assuming $USER is the sudo user
                sudo systemctl enable libvirtd
                sudo systemctl start libvirtd
            fi

            ;;
        "Bluetooth" )
            clear

            echo "Bluetooth control using bluez and blueman"
            read -p "Would you like to install $user_package? " install

            while [[ -z $install || ( $install != "y" && $install != "n" ) ]]; do
             read -p "Would you like to installlll $user_package? " install
            done

            if [[ $install = y ]]; then
                sudo pacman --noconfirm --needed -S bluez #  Bluetooth baemon
                sudo pacman --noconfirm --needed -S bluez-utils
                sudo pacman --noconfirm --needed -S blueman # Bluetooth GUI
                systemctl enable bluetooth
            fi

         ;;
        "Screen Brightness" )
            clear

            echo "Scren brightness control using brightnessctl"
            read -p "Would you like to install $user_package? " install

            while [[ -z $install || ( $install != "y" && $install != "n" ) ]]; do
             read -p "Would you like to installlll $user_package? " install
            done

            if [[ $install = y ]]; then
                sudo pacman --noconfirm --needed -S brightnessctl # Brighness Control
            fi

           ;;
        "base-devel" )
            clear

            echo "Tool to build arch linux packages"
            read -p "Would you like to install $user_package? " install

            while [[ -z $install || ( $install != "y" && $install != "n" ) ]]; do
             read -p "Would you like to installlll $user_package? " install
            done

            if [[ $install = y ]]; then
                sudo pacman --noconfirm --needed -S base-devel # to build arch packages
            fi

         ;;

        "Exit Script" )
       exit
         ;;
         
        *)
            echo "Invalid option. Please try again."
            ;;
    esac
    clear
    echo "Please choose a package to install"
    REPLY=
done




# "TeamViewer(AUR)" "Sublime Text 4(AUR)" "Brave(AUR)" "TimeShift(AUR)"
