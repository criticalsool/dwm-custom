#!/bin/bash

### Initialisation ###

# OS Flavour
if [ -f /etc/os-release ]; then
    source /etc/os-release
fi

# Function to install dependencies for Debian-based distributions
install_debian() {
    sudo apt-get update
    echo "Installation of xorg and greetd"
    sudo apt-get -qq -y install xorg greetd || exit 1
    echo "Installation of custom softwares"
    sudo apt-get -qq -y --ignore-missing install alacritty alsa-utils feh firefox-esr numlockx || exit 1
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

# Install dwm
bash dwm.bash || exit 1

# Keyboard layout
echo "Changing keyboard layout to french (sudo password needed)"
sudo localectl set-x11-keymap fr pc105 latin9 || exit 1

# Execute dwm on startx
echo "exec dwm" > ~/.xinitrc

# Configure greetd to start x with autologin and log redirection
echo "
[initial_session]
command = '/usr/bin/startx -- -keeptty >~/.xorg.log 2>&1'
user = '$USER'" | sudo tee -a /etc/greetd/config.toml > /dev/null