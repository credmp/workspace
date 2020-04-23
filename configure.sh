#!/bin/bash

echo "Configuring this system for i3/polybar workspace"

#
# Assumes Ubuntu based system
#

sudo add-apt-repository ppa:kgilmer/speed-ricer
sudo apt-get update

sudo apt install -y i3-gaps i3lock-fancy polybar terminator tmux roboto rxvt-unicode xsel fonts-fantasque-sans arandr help2man

#
# Linking configuration directories
#

ln -s $(pwd)/i3 ~/.config/i3
ln -s $(pwd)/polybar ~/.config/polybar
ln -s $(pwd)/terminator ~/.config/terminator

mkdir -p ~/.local/bin
ln -s $(pwd)/tools/enact ~/.local/bin/enact
chmod +x $(pwd)/tools/enact

git clone --recursive https://github.com/Ventto/mons.git
cd mons
sudo make install

#
# Grabbing extensions
#
pip install requests
mkdir -p ~/.config/terminator/plugins
curl https://github.com/EliverLara/terminator-themes/raw/master/plugin/terminator-themes.py -o ~/.config/terminator/plugins/terminator-themes.py
