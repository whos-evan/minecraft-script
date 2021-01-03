#!/bin/bash

cd ..

clear

echo "This creates a minecraft server from scratch. This is only meant for people that don't have ANY server files."
echo "To continue press ENTER."; read -r

clear

echo "Some things needed before you start.
    1. Download link to the server .jar to start the setup!
    2. At least 1 GB of RAM to use for the Minecraft Server.
    3. Basic Understanding of How to Setup a Minecraft Server"
echo "Do you meet the requirements?"
read -r -p "Type y/N: " requirements

if [ "$requirements" == "Y" ] || [ "$requirements" == "y" ]; then
    sleep 0
else
    echo "Come back when you meet the requirements!"
    sleep 1.5
    $(./minecraft.sh)
fi
clear
mkdir minecraft-server 2>/dev/null >/dev/null
cd minecraft-server
read -r -p "Enter the download link for the server.jar file: " server_jar_web
echo "If this part fails then the download link doesn't work."
sleep 1.5
clear

wget "$server_jar_web"

echo "

"

echo "Did it work?"
read -r -p "Type y/N: " did_it_work
if [ "$did_it_work" == Y ] || [ "$did_it_work" == y ]; then
    sleep 0
else
    echo "That's not good. Try again later."
    exit
fi

echo "Perfect. Finding the .jar server file saved."
server_jar_name=$(find -name *.jar)

echo "Do you want to rename $server_jar_name?"
read -r -p "Type y/N: " rename_question
if [ "$rename_question" == Y ] || [ "$rename_question" == y ]; then
    echo "What do you want to rename the file to?"
    read -r -p "Type here: " rename
    mv "$server_jar_name" "$rename"
    server_jar_name="$rename"
else
    echo "Not renaming."
fi

clear

echo "What is the maximum ammount of ram do you want to be used when running the server?"
read -r -p "Enter the number in gigabytes: " ram_gb

if [ -n "$ram_gb" ] && [ "$ram_gb" -eq "$ram_gb" ] 2>/dev/null; then
    sleep 0
else
    echo "Enter a whole number above 0 or a real number."
    exit
fi

echo "Got it!"
echo "Creating start.sh."

sudo touch start.sh 2>/dev/null >/dev/null
sudo chmod a+x start.sh 2>/dev/null >/dev/null

echo "Writing: "
echo "#!/bin/bash

java -Xms"$ram_gb"G -Xmx"$ram_gb"G -jar "$server_jar_name"" | sudo tee start.sh
sudo chmod a+x start.sh 2>/dev/null >/dev/null
echo "Start.sh created to run the server; go into the server directory by typing, `cd minecraft-server`, then start the server by typing `sudo ./start.sh`
