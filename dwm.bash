#!/bin/bash

### Initialisation ###

dwm_version=6.5
dmenu_version=5.3
slstatus_version=1.0

# OS Flavour
if [ -f /etc/os-release ]; then
    source /etc/os-release
fi

# Function to install dependencies for Debian-based distributions
install_debian() {
    sudo apt-get update
    sudo apt-get -qq -y install alacritty feh firefox numlockx
    sudo apt-get -qq -y install build-essential libx11-dev libxft-dev libxinerama-dev 
}

# Function to install dependencies for Arch-based distributions
install_arch() {
    echo "TODO"
    exit 0
}

# Archlinux
if [ "$ID" == "arch" ]; then
    echo "Detected Arch-based distribution"
    echo "Installing packages using pacman"
    install_arch

# Debian
elif [ "$ID" == "debian" ]; then
    echo "Detected Debian-based distribution"
    echo "Installing Dependencies using apt"
    install_debian

else
    echo "Distribution not found / Unsupported distribution"
    exit 1
fi

# Build & Install dwm
echo "Building dwm $dwm_version"
cd dwm/
make
echo "Installing dwm (sudo password needed)"
sudo make install

# Build & install dmenu
echo "Building dmenu $dmenu_version"
cd ../dmenu/
make
echo "Installing dmenu (sudo password needed)"
sudo make install

# Build & install slstatus
echo "Building slstatus $slstatus_version"
cd ../slstatus/
make
echo "Installing slstatus (sudo password needed)"
sudo make install

# Desktop file
sudo mkdir -pv /usr/share/xsessions/
sudo install -v -Dm644 dwm.desktop /usr/share/xsessions/
