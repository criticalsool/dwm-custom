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
    sudo apt-get update || exit 1
    echo "Installation of dwm/dmenu/slstatus dependencies"
    sudo apt-get -qq -y install build-essential libx11-dev libxft-dev libxinerama-dev || exit 1
}

# Archlinux
if [ "$ID" == "arch" ]; then
    echo "Detected Arch-based distribution"
    echo "Installation of dwm/dmenu/slstatus dependencies"
    sudo pacman --noconfirm --noprogressbar --needed -S gcc make || exit 1

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
make || exit 1
echo "Installing dwm (sudo password needed)"
sudo make install || exit 1

# Build & install dmenu
echo "Building dmenu $dmenu_version"
cd ../dmenu/
make || exit 1
echo "Installing dmenu (sudo password needed)"
sudo make install || exit 1

# Build & install slstatus
echo "Building slstatus $slstatus_version"
cd ../slstatus/
make || exit 1
echo "Installing slstatus (sudo password needed)"
sudo make install || exit 1
