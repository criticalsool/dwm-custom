#!/bin/bash

### Initialisation ###

# OS Flavour
if [ -f /etc/os-release ]; then
    source /etc/os-release
fi

# Function to install dependencies for Debian-based distributions
install_debian() {
    $CMD apt-get update
    echo "Installation of xorg and greetd"
    $CMD apt-get -qq -y install xorg greetd || exit 1
    echo "Installation of custom softwares"
    $CMD apt-get -qq -y --ignore-missing install alacritty alsa-utils feh firefox-esr numlockx picom || exit 1
}

# Function to install dependencies for Alpine
# https://wiki.alpinelinux.org/wiki/Alpine_configuration_management_scripts#setup-xorg-base
install_alpine() {
    $CMD apk update
    echo "Installation of xorg base"
    $CMD setup-xorg-base || exit 1
    echo "Installation of greetd"
    $CMD apk add greetd || exit 1
    echo "Installation of custom softwares"
    $CMD apk add alacritty alsa-utils feh firefox-esr picom || exit 1
}

# Function to install dependencies for Arch-based distributions
install_arch() {
    $CMD pacman -Sy
    echo "Installation of xorg and greetd"
    $CMD pacman --noconfirm --noprogressbar --needed -S xorg-server xorg-xinit greetd || exit 1
    echo "Installation of custom softwares"
    $CMD pacman --noconfirm --noprogressbar --needed -S alacritty alsa-utils feh firefox numlockx picom || exit 1
}

# Archlinux
if [ "$ID" == "arch" ]; then
    echo "Detected Arch-based distribution"
    CMD="sudo "
    echo "Installing packages using pacman"
    install_arch

# Debian
elif [ "$ID" == "debian" ]; then
    echo "Detected Debian-based distribution"
    CMD="sudo "
    echo "Installing Dependencies using apt"
    install_debian

# Alpine
elif [ "$ID" == "alpine" ]; then
    echo "Detected Alpine distribution"
    CMD="doas "
    echo "Installing Dependencies using apk"
    install_alpine

else
    echo "Distribution not found / Unsupported distribution"
    exit 1
fi

# Install dwm
bash dwm.bash || exit 1

# Keyboard layout
echo "Changing keyboard layout to french (sudo password needed)"
$CMD localectl set-x11-keymap fr pc105 latin9

# Execute dwm on startx
echo "Execute dwm on startx (~/.xinitrc)"
echo "exec dwm" > ~/.xinitrc

# Configure greetd to start x with autologin and log redirection
echo "Configure greetd to start x with autologin and log redirection (/etc/greetd/config.toml) (sudo password needed)"
echo "
[initial_session]
command = '/usr/bin/startx -- -keeptty >~/.xorg.log 2>&1'
user = '$USER'" | $CMD tee -a /etc/greetd/config.toml > /dev/null

# Enable greetd service
if [ "$ID" == "alpine" ]; then
    $CMD rc-update add greetd
    $CMD rc-service greetd start
else
    $CMD systemctl enable greetd.service
fi

# Last print
echo "Execution success, please reboot for changes to take effect"
echo "For the wallpapers, just download anyone to ~/Images/wallpaper.png"