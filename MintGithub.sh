#!/bin/bash

# Replace {USERNAME} and {REPOSITORY_NAME} with the appropriate values
url="https://github.com/ReboOnline/NewstartMint.git"
https://github.com/ReboOnline/Arco.git

# Download the zip file
wget -O repository.zip $url

# Check if the download was successful
if [ $? -eq 0 ]; then
    # Unzip the repository
    unzip repository.zip
    rm repository.zip
else
    echo "Failed to download repository"
fi