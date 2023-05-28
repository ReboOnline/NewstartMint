#!/bin/bash

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