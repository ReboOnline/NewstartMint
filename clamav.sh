#!/bin/bash

# Update package lists
sudo apt update

# Installeer ClamAV
sudo apt install clamav clamav-daemon -y

# Download de meest recente virusdefinities
sudo freshclam

echo "ClamAV is geïnstalleerd en bijgewerkt."
