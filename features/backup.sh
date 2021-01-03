#!/bin/bash

if [ "$EUID" -ne 0 ]; then
    echo "Please run the script as root."
    exit
fi

cd ..
ls -l
echo "Which folder contains your minecraft server? (do not put / at the end of the folder)"
read -r -p "Enter here: " folder
if [ -d "$folder" ]; then
    echo "Found the folder!"
    cd "$folder"
else
    echo "I was unable to find the folder please try again later."
    exit
fi

clear
echo "Running zip and creating a backup folder outside of the minecraft server."
cd ..
mkdir minecraft-backups
zip_name="minecraft-backups/backup-$(date +%F_%H-%M-%S).zip"
zip -r "$zip_name" "$folder"
sleep 1
clear
echo "Done."
exit

