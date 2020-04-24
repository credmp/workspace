#!/bin/bash

echo "Configuring this system for i3/polybar workspace"

#
# Assumes Ubuntu based system
#

sudo add-apt-repository ppa:kgilmer/speed-ricer
sudo apt-get update

sudo apt install -y i3-gaps i3lock-fancy polybar terminator tmux roboto rxvt-unicode xsel fonts-fantasque-sans arandr help2man fonts-materialdesignicons-webfont brightnessctl

#
# Linking configuration directories
#

ln -s $(pwd)/i3 ~/.config/i3
ln -s $(pwd)/polybar ~/.config/polybar
ln -s $(pwd)/terminator ~/.config/terminator
ln -s $(pwd)/kitty ~/.config/kitty

mkdir -p ~/.local/bin
ln -s $(pwd)/tools/enact ~/.local/bin/enact
chmod +x $(pwd)/tools/enact

git clone --recursive https://github.com/Ventto/mons.git
cd mons
sudo make install

#
# Terminal
#
curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin
ln -s ~/.local/kitty.app/bin/kitty ~/.local/bin/kitty

#
# Grabbing extensions
#
pip install requests
mkdir -p ~/.config/terminator/plugins
curl https://github.com/EliverLara/terminator-themes/raw/master/plugin/terminator-themes.py -o ~/.config/terminator/plugins/terminator-themes.py

#
# Fonts
#
mkdir font &&
    cd font &&
    wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/Hack.zip &&
    unzip Hack.zip &&
    mkdir -p ~/.local/share/fonts &&
    mv *.ttf ~/.local/share/fonts &&
    fc-cache -f ~/.local/share/fonts &&
    cd .. &&
    rm -r font
