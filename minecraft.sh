#!/bin/bash

# sets the swears
swear1="f##king"
swear2="motherf##king"
swear3="s##t"
swear4="f##k"

# sets the totals to 0
world_total=0

# --------------------

echo "this is the most simple $swear1 minecraft mangager in the world."
sleep 0.5
clear
echo "version: 1.0 alpha"
echo "choose from the list"
echo "what do you want to do:
   1. delete a world (rm)
   2. backup something (using zip (whole server)) | COMING SOON
   3. install a minecraft server | COMING SOON
   4. create a start.sh file (for easy as $swear4 usage) | COMING SOON
   5. startup a server (requires start.sh) | COMING SOON
   6. run a server in screen (work in progress) | COMING SOON"

read -r -p "input the number you want to do here: " choice

# deletes a world (option 1)

if [ "$choice" = 1 ]; then
   echo "is this placed in the root minecraft server folder?"
   read -r -p "type y/N: " minecraft_folder

   # this checks if the script is in the minecraft server folder. it checks and if it isn't the script exits, if it is then it continues outside of the if statement.
   if [ "$minecraft_folder" == y ] || [ "$minecraft_folder" == Y ]; then
      echo "great this should be placed in your minecraft server folder."
   else
      echo "please place this in the root of your minecraft server folder."
      exit
   fi # is in root server folder

   # checking if the server folder has default world folders

   # world are you there?
   if [ -d "world" ]; then
      world_total=$(("$world_total" + 1))
      if [ "$world_total" = 1 ]; then
         world_1="world"
         worlds="1. world"
      fi
   fi

   # world_nether are you there?
   if [ -d "world_nether" ]; then
      world_total=$(("$world_total" + 1))
      if [ "$world_total" = 1 ]; then
         world_1="world_nether"
         worlds="1. world_nether"
      fi
      if [ "$world_total" = 2 ]; then
         world_2="world_nether"
         worlds="$worlds
2. world_nether"
      fi
   fi

   # world_the_end are you there?
   if [ -d "world_the_end" ]; then
      world_total=$(("$world_total" + 1))
      if [ "$world_total" = 1 ]; then
         world_1="world_the_end"
         worlds="1. world_the_end"
      fi
      if [ "$world_total" = 2 ]; then
         world_2="world_the_end"
         worlds="$worlds
2. world_the_end"
      fi
      if [ "$world_total" = 3 ]; then
         world_3="world_the_end"
         worlds="$worlds
3. world_the_end"
      fi
   fi

   if [ "$world_total" == 0 ]; then
      echo "i wasnt able to find any default world files"
      echo "this will run in sudo, you may need to enter a password"
      sleep 1.5
      read -r -p "enter the folder that you want to delete: " folder_delete
      if [ -d "$folder_delete" ]; then
         echo "deleting."
         sudo rm -rf "$folder_delete"
      else
         echo "come-on enter a real $swear1 folder."
      fi
   else
      echo "i found $world_total folders!"
      echo "they are:
$worlds"
      echo "this is going to run in sudo, you may need to enter a password."
      sleep 1.5
      read -r -p "enter the number next to the folder you want to delete: " delete_number
      if [ "$delete_number" -gt "$world_total" ]; then
         echo "pick a real $swear1 number."
         exit
      fi
      echo "looking for the folder so I can delete it!"

      if [ "$delete_number" == 1 ]; then
         echo "found it!"
         sudo rm -rf "$world_1"
         echo "
deleted the folder!"
      fi

      if [ "$delete_number" == 2 ]; then
         echo "found it!"
         sudo rm -rf "$world_2"
         echo "
deleted the folder!"
      fi

      if [ "$delete_number" == 3 ]; then
         echo "found it!"
         sudo rm -rf "$world_3"
         echo "
deleted the folder!"
      fi
   fi
fi # choice = 1

if [ "$choice" = 2 ]; then
   echo "warning if you backuped today it will be overwrited."
   read -r -p "press enter to continue"
   echo "checking prerequisites"
   echo "running in sudo, you may need to enter a password"
   sudo apt-get install zip unzip >/dev/null

   # where the script is
   directory=$(cd $(dirname "$0") && pwd)
   if [ -d backups ]; then
      sleep 0
   else
      mkdir backups >/dev/null
   fi
   sudo zip -r "backups/$(date +'%d-%m-%Y')-mcbackup.zip" "$directory"
   echo "done."
fi
