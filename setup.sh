#!/bin/bash
set -e  # Stop bij elke fout
trap 'echo "❌ Er is een fout opgetreden. Het script wordt gestopt." && exit 1' ERR

# Logging instellen
LOGFILE="/var/log/custom_install_script.log"
exec > >(tee -a "$LOGFILE") 2>&1

# Functies voor eenvoudiger gebruik
copy_file() {
    local file=$1
    echo "🔄 Making '$file' executable and copying to /usr/local/bin"
    chmod +x "$file"
    sudo cp "$file" /usr/local/bin/
    echo "✅ '$file' successfully copied."
}

install_package() {
    local package=$1
    echo "📦 Installing $package..."
    sudo apt install -yy "$package"
}

update_snap_packages() {
    echo "🔄 Updating Snap packages..."
    sudo snap refresh
}

# Automatische bevestiging voor Microsoft-codecs
auto_install_codecs() {
    echo "🔊 Installing Microsoft Media Codecs without prompts..."
    echo ubuntu-restricted-extras ubuntu-restricted-addons multiverse true | sudo debconf-set-selections
    sudo apt install -yy ubuntu-restricted-extras
}

# 🔄 Bestanden kopiëren en uitvoerbaar maken
copy_file "update_ucaresystem-core"
copy_file "upgrade_ucaresystem-core"
copy_file "uit"

# 🔧 Swappiness-waarde aanpassen
echo "⚙️ Setting swappiness to 5..."
sudo sysctl vm.swappiness=5
echo "vm.swappiness=5" | sudo tee -a /etc/sysctl.conf > /dev/null
sudo sysctl -p

# 🔄 Updates uitvoeren
echo "🔄 Updating system..."
sudo apt update && sudo apt upgrade -yy
update_snap_packages

# 🛠️ Essentiële software installeren
install_package "gimp"
install_package "plank"
install_package "nemo"
install_package "caffeine"
install_package "variety"
install_package "gparted"
install_package "preload"
install_package "dconf-editor"
install_package "git"
install_package "neofetch"
install_package "dmenu"
install_package "flameshot"
install_package "sublime-text"
install_package "simplescreenrecorder"
install_package "gdebi"
install_package "htop"

# 🔌 Speciale installatie van apps
echo "📥 Installing Visual Studio Code..."
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
sudo install -o root -g root -m 644 microsoft.gpg /etc/apt/trusted.gpg.d/
echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" | sudo tee /etc/apt/sources.list.d/vscode.list
sudo apt update
install_package "code"
rm microsoft.gpg

echo "📥 Installing Discord..."
wget -O ~/discord.deb "https://discord.com/api/download?platform=linux&format=deb"
sudo dpkg -i ~/discord.deb || sudo apt --fix-broken install -yy

echo "📥 Installing GitHub Desktop..."
wget -O github-desktop.deb https://github.com/shiftkey/desktop/releases/download/release-2.8.3-linux1/GitHubDesktop-linux-2.8.3-linux1.deb
sudo dpkg -i github-desktop.deb || sudo apt --fix-broken install -yy

# 🎶 Automatische installatie van codecs
auto_install_codecs

# 🛡️ Firewall activeren
echo "🛡️ Enabling firewall..."
sudo ufw enable

# 🔄 Systeem opnieuw opstarten
echo "✅ Alle installaties en updates zijn voltooid. Het systeem moet opnieuw opgestart worden."
echo ""
echo "type reboot wanneer je er klaar voor bent"

