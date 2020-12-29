#!/bin/bash

# sets the swears
swear1="f##king"
swear2="motherf##king"
swear3="s##t"
swear4="f##k"

# sets worlds_total to 0
worlds_total=0

# sets the worlds that the user can delete to 0
worlds_to_delete=0

echo "this is the most simple $swear1 minecraft mangager in the world."
clear
echo "choose from the list"
echo "what do you want to do:
   1. delete a world (rm)
   2. backup something (using zip (world/config/whole server))
   3. install a minecraft server
   4. create a start.sh file (for easy as $swear4 usage)
   5. startup a server (requires start.sh)
   6. run a server in screen (work in progress)"

read -p "input the number you want to do here: " choice

# deletes a world (option 1)

if [ "$choice" == "1" ]; then
   echo "is the $swear2 script placed in your minecraft server folder?"
   read -p "type "y" or "n": " script_in_folder
   if [ "$script_in_folder" == "y" ]; then
      echo "please wait as I do totally $swear1 awesome math."

      # sit tight if you are reading the code this part is hard to watch...

      # checking if the overworld folder aka "world" is there

      if [ -d "world" ]; then
         # this found the folder "world"

         worlds=""world""

         worlds_total=$(expr "$worlds_total" + 1)

         worlds_or="

$worlds_total. world"

         world_total=world_number

         if [ "$world_number" == 1 ]; then
            world_1=world
         fi
         if [ "$world_number" == 2 ]; then
            world_2=world
         fi
         if [ "$world_number" == 3 ]; then
            world_3=world

            worlds_to_delete=$(expr "$worlds_to_delete" + 1)

         fi

         # nothing was found, so nothing is going to happen here

         # checking if the nether folder aka "world_nether" is there
         if [ -d "world_nether" ]; then

            # this found the folder "world_nether"

            worlds="$worlds, world_nether"

            worlds_total=$(expr "$worlds_total" + 1)

            worlds_or="$worlds_or

$worlds_total. world_nether"

            world_total=world_nether_number

            worlds_to_delete=$(expr "$worlds_to_delete" + 1)

            if [ "$world_number" == 1 ]; then
               world_1=world_nether
            fi
            if [ "$world_number" == 2 ]; then
               world_2=world_nether
            fi
            if [ "$world_number" == 3 ]; then
               world_3=world_nether

            # nothing was found, so nothing is going to happen here
            fi

            # checking if the end folder aka "world_the_end" is there
            if [ -d "world_the_end" ]; then
               # this found the folder "world_the_end"

               worlds="$worlds, and world_the_end"

               worlds_total=$(expr "$worlds_total" + 1)

               world_total=world_the_end_number

               worlds_or="$worlds_or

$worlds_total. world_the_end"

               worlds_to_delete=$(expr "$worlds_to_delete" + 1)

               if [ "$world_number" == 1 ]; then
                  world_1=world_the_end
               fi
               if [ "$world_number" == 2 ]; then
                  world_2=world_the_end
               fi
               if [ "$world_number" == 3 ]; then
                  world_3=world_the_end

               else

                  sleep 1

               # nothing was found, so nothing is going to happen here
               fi

               # --- dectected the worlds message

               # - default folders not detected
               if [ "$worlds_total" == "0" ]; then
                  echo "No default worlds found this script is pointless if you do not have a default world but I can just delete the folder if you want."
                  echo "Do you want me to delete a folder?"
                  read -p "Type y/N: " del_folder

                  if [ "$del_folder" == "y" ] || [ "$del_folder" == "Y" ]; then
                     read -p "Type the folder you want to delete: " del_folder
                     echo "Deleting."
                     echo "This runs in sudo so you may need to enter a password."
                     sudo rm -rf "$del_folder"
                     echo "Deleted."
                  else
                     exit
                  fi

               # - detected folder
               else
                  echo "okay cool $swear3. which world do you want to remove I have detected $worlds_total world(s) named..."
                  echo "world name(s): $worlds
"
                  echo "which one(s) do you want me to delete?"
                  echo "options are:
$worlds_or"
                  read -p "Enter the number next to the folder you want to delete here: " delete
                  if (("$delete" > "$worlds_to_delete")); then
                     echo "Please enter a valid number."
                     echo "Exiting."
                     exit
                  else
                     echo "Deleting folder."
                     # sets the number that the user put to delete
                     if [ "$delete" == "1" ]; then
                        sudo rm -rf "$world_1"
                     fi

                     if [ "$delete" == "2" ]; then
                        sudo rm -rf "$world_2"
                     fi

                     if [ "$delete" == "3" ]; then
                        sudo rm -rf "$world_3"
                     fi

                     echo "Deleted folder."
                     echo "Deleted sucessfully!"
                     exit
                  fi
               fi
            else
               echo "place this $swear1 script in the minecraft server folder."
               exit
            fi
         fi
      fi
   fi
else
   echo "enter a $swear1 valid number jesus it's not that hard"
# enter a number from the list
fi
