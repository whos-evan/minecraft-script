#!/bin/bash

if [ "$EUID" -ne 0 ]; then
    echo "Please run the script as root."
    exit
fi

clear

echo "We are installing the required packages to run the script."
sudo apt-get -y install zip unzip dialog 2>/dev/null >/dev/null

clear

HEIGHT=15
WIDTH=40
CHOICE_HEIGHT=5
BACKTITLE="Verison: 1.0 Alpha Build"
TITLE="Minecraft Script"
MENU="Choose one of the following options:"

OPTIONS=(1 "Create Minecraft Server"
    2 "Backup Server"
    3 "Create a start.sh File"
    4 "Delete World"
    5 "Startup Server")

CHOICE=$(dialog --clear \
    --backtitle "$BACKTITLE" \
    --title "$TITLE" \
    --menu "$MENU" \
    $HEIGHT $WIDTH $CHOICE_HEIGHT \
    "${OPTIONS[@]}" \
    2>&1 >/dev/tty)

case $CHOICE in
1)
    clear
    echo "WARNING: This installs other script from the repository that you got this from!"
    read -r -p "Do you wish to proceed? (type anything to continue or type control-c to cancel): "
    mkdir minecraft-scripts
    cd minecraft-scripts
    wget https://github.com/Biune/minecraft-script/blob/main/features/create-minecraft-server.sh
    chmod +x create-minecraft-server.sh
    ./create-minecraft-server.sh
    ;;
2)
    clear
    echo "WARNING: This installs other script from the repository that you got this from!"
    read -r -p "Do you wish to proceed? (type anything to continue or type control-c to cancel): "
    ;;
3)
    clear
    echo "WARNING: This installs other script from the repository that you got this from!"
    read -r -p "Do you wish to proceed? (type anything to continue or type control-c to cancel): "
    ;;
4)
    clear
    echo "WARNING: This installs other script from the repository that you got this from!"
    read -r -p "Do you wish to proceed? (type anything to continue or type control-c to cancel): "
    ;;
5)
    clear
    echo "WARNING: This installs other script from the repository that you got this from!"
    read -r -p "Do you wish to proceed? (type anything to continue or type control-c to cancel): "
    ;;
esac
