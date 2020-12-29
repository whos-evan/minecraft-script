#!/bin/bash

# sets the swears
swear1="f##king"
swear2="motherf##king"
swear3="s##t"

# sets worlds_total to 0
worlds_total=0

echo "this is the most simple f##king minecraft mangager in the world."
clean
echo "choose from the list"
echo "what do you want to do:
   1. delete a world (rm)
   2. backup something (using zip (world/config/whole server))
   3. install a minecraft server
   4. create a start.sh file (for easy as f##k usage)
   5. startup a server (requires start.sh)
   6. run a server in screen (work in progress)"

read -p "input the number you want to do here: " choice

# deletes a world (option 1)

if  [ "$choice" == "1" ]
then
echo "is the $swear2 script placed in your minecraft server folder?"
read -p "type "y" or "n": " script_in_folder
if [ "$script_in_folder" == "y" ]
then
echo "please wait as I do totally $swear1 awesome math."

# sit tight if you are reading the code this part is hard to watch...

# checking if the overworld folder aka "world" is there
if [ -d "world" ] 
then
# this found the folder "world"
worlds=""world""
worlds_total=$(expr "$worlds_total" + 1)
else
sleep 1
# nothing was found, so nothing is going to happen here
fi

# checking if the nether folder aka "world_nether" is there
if [ -d "world_nether" ]
then
# this found the folder "world_nether"
worlds="$worlds, world_nether"
worlds_total=$(expr "$worlds_total" + 1)
else
sleep 1
# nothing was found, so nothing is going to happen here
fi

# checking if the end folder aka "world_the_end" is there
if [ -d "world_the_end" ]
then
# this found the folder "world_the_end"
worlds="$worlds, and world_the_end"
worlds_total=$(expr "$worlds_total" + 1)
else
sleep 1
# nothing was found, so nothing is going to happen here
fi

echo "okay cool $swear3. which world do you want to remove I have detected $worlds_total world(s) named..."
echo "world name(s): $worlds"

else
echo "place this $swear1 script in the minecraft server folder."
exit
fi
else
echo "something"
# nothing will happen because of $script_in_folder.
fi
