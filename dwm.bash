#!/bin/bash

### Initialisation ###

dwm_version=6.6
dmenu_version=5.4
slstatus_version=1.1

# OS Flavour
if [ -f /etc/os-release ]; then
    source /etc/os-release
fi

# Function to install dependencies for Debian-based distributions
install_debian() {
    $CMD apt-get update || exit 1
    echo "Installation of dwm/dmenu/slstatus dependencies"
    $CMD apt-get -qq -y install build-essential libx11-dev libxft-dev libxinerama-dev || exit 1
}

install_arch() {
    echo "Installation of dwm/dmenu/slstatus dependencies"
    $CMD pacman --noconfirm --noprogressbar --needed -S gcc make || exit 1
}

install_alpine() {
    $CMD apk update || exit 1
    echo "Installation of dwm/dmenu/slstatus dependencies"
    $CMD apk add git make gcc g++ libx11-dev libxft-dev libxinerama-dev ncurses || exit 1
}

# Archlinux
if [ "$ID" == "arch" ]; then
    echo "Detected Arch-based distribution"
    CMD="sudo "
    install_arch

# Debian
elif [ "$ID" == "debian" ]; then
    echo "Detected Debian-based distribution"
    CMD="sudo "
    install_debian

# Alpine
elif [ "$ID" == "alpine" ]; then
    echo "Detected Alpine distribution"
    CMD="doas "
    install_alpine

else
    echo "Distribution not found / Unsupported distribution"
    exit 1
fi

# Build & Install dwm
echo "Building dwm $dwm_version"
cd dwm/
make || exit 1
echo "Installing dwm (sudo password needed)"
$CMD make install || exit 1

# Build & install dmenu
echo "Building dmenu $dmenu_version"
cd ../dmenu/
make || exit 1
echo "Installing dmenu (sudo password needed)"
$CMD make install || exit 1

# Build & install slstatus
echo "Building slstatus $slstatus_version"
cd ../slstatus/
make || exit 1
echo "Installing slstatus (sudo password needed)"
$CMD make install || exit 1
