#!/bin/sh
# Setup new i3 instance on laptop (Arch Linux)
# Johnny Sprada

sudo pacman -Syyu

mkdir -p ~/files/{scripts,projects,git,pics/{backgrounds,screenshots}}

sudo pacman -S git xfce4-terminal scrot rofi lxappearance pavucontrol feh thunar compton thermald dunst 

yaourt i3-gaps-git --noconfirm --force

HOME_DIR=$HOME
CONFIG_DIR=/.config
FILES_DIR=/files
SCRIPTS_DIR=$FILES_DIR/scripts
PROJECTS_DIR=$FILES_DIR/projects
GIT_DIR=$HOME/$FILES_DIR/git
PICS_DIR=$FILES_DIR/pics
BACKGROUNDS_DIR=$PICS_DIR/backgrounds
SCREENSHOTS_DIR=$PICS_DIR/screenshots

cd $GIT_DIR
git clone https://github.com/supermarin/YosemiteSanFranciscoFont
sudo cp $GIT_DIR/YosemiteSanFranciscoFont/*.ttf /usr/share/fonts/TTF/
rm -rf ./YosemiteSanFranciscoFont

cd $GIT_DIR
git clone https://github.com/jsprada/dotfiles

SOURCE_DIR=$GIT_DIR/dotfiles

cp $SOURCE_DIR/$BACKGROUNDS_DIR/* $HOME/$BACKGROUNDS_DIR/
cp $SOURCE_DIR/$SCRIPTS_DIR/* $HOME/$SCRIPTS_DIR/
mv $HOME/$CONFIG_DIR/i3/config $HOME/$CONFIG_DIR/i3/config.backup
cp $SOURCE_DIR/$CONFIG_DIR/i3/config_laptop $HOME/$CONFIG_DIR/i3/config
cp $SOURCE_DIR/$CONFIG_DIR/i3/i3blocks_laptop.conf $HOME/$CONFIG_DIR/i3/i3blocks_laptop.conf
