#!/bin/bash

sudo dnf clean all
sudo dnf update -y

sudo dnf install -y git i3 i3-gaps libX11-devel libXft-devel libXinerama-devel libXrandr-devel xorg-x11-xinit-session feh

mkdir ~/mantain
cd  ~/mantain

# DMENU
git clone https://git.suckless.org/dmenu
cp ~/mantain/dmenu/config.mk  ~/mantain/dmenu/config.mk.bak

awk '{ gsub("X11R6/include","include/X11",$3); print $0 }' ~/mantain/dmenu/config.mk > ~/mantain/dmenu/config.mk
awk '{ gsub("X11R6/lib","lib64/X11",$3); print $0 }'       ~/mantain/dmenu/config.mk > ~/mantain/dmenu/config.mk

cd ~/mantain/dmenu
make clean
make
sudo make install
make clean

# ZSH + Oh-my-zsh
cd ~/mantain
sudo dnf install -y zsh
wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh
sh install.sh


wget https://raw.githubusercontent.com/filvi/dotfiles/master/.oh-my-zsh/themes/filvi-ys-spin.zsh-theme
mv ~/mantain/zsh/filvi-ys-spin.zsh-theme ~/mantain/.oh-my-zsh/themes/filvi-ys-spin.zsh-theme

wget https://raw.githubusercontent.com/filvi/dotfiles/master/.zshrc
awk -v var="$USER" '{ gsub("filvi","var",$3); print $0 }' ~/maintain/.zshrc > ~/maintain/.zshrc
mv  ~/maintain/.zshrc ~/.zshrc