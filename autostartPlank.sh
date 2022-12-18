#!/bin/bash

# This script copies a file from one location to another

# First, we need to check if the user has provided the correct number of arguments
# The first argument should be the source file, and the second argument should be the destination 
#if [ /media/rebo/500gb/GitHub/Arco/Update and  Bash/Mint/autostartPlank.sh -ne 2 ]; then
 # echo "Usage: $0 /media/rebo/500gb/GitHub/Arco/Update and  Bash/Mint/autotest1"
 # exit 1
#fi

# Next, we check if the source file exists
#if [ ! -f $1 ]; then
#  echo "Error: source file does not exist"
#  exit 1
#fi

# Now we can copy the file using the 'cp' command
cp autostartPlank.sh ~/.config/autostart
echo "Checking if the copy was successful"
sleep 3
# Check if the copy was successful
if [ $? -eq 0 ]; then
  echo "File successfully copied"
else
  echo "Error copying file"
fi