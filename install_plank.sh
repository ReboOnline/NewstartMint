#!/bin/bash

# Installeer plank
sudo apt update
sudo apt install -y plank

# Voeg plank toe aan de opstarttoepassingen
echo "[Desktop Entry]
Type=Application
Exec=plank
Hidden=false
NoDisplay=false
X-GNOME-Autostart-enabled=true
Name[en_US]=Plank
Name=Plank
Comment[en_US]=Plank Dock
Comment=Plank Dock" | tee ~/.config/autostart/plank.desktop

# Configureer plank om aan de linkerkant van het scherm te plaatsen
gsettings set net.launchpad.plank.dock.settings:/net/launchpad/plank/docks/dock1/ alignment 'left'
