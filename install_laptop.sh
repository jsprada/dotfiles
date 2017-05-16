#!/bin/sh
# install_laptop.sh
# Setup new i3 instance on laptop (Arch Linux)
# Johnny Sprada

echo "Getting i3 config for laptop"
echo "Updating Arch Linux packages"
sudo pacman -Syyu

echo "Creating directory tree in ~/files/"
mkdir -p ~/files/{scripts,projects,git,pics/{backgrounds,screenshots}}

echo "Installing packages"
sudo pacman -S $(./packages_laptop)

echo "Installing i3wm Gaps version"
echo ""
echo "Press 1 when prompted"
echo ""

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

echo "Getting San Francisco font"
cd $GIT_DIR
git clone https://github.com/supermarin/YosemiteSanFranciscoFont
sudo cp $GIT_DIR/YosemiteSanFranciscoFont/*.ttf /usr/share/fonts/TTF/

echo "Getting i3 config, scripts, background image"
cd $GIT_DIR
git clone https://github.com/jsprada/dotfiles

echo "Installing..."
SOURCE_DIR=$GIT_DIR/dotfiles

cp $SOURCE_DIR/$BACKGROUNDS_DIR/* $HOME/$BACKGROUNDS_DIR/
cp $SOURCE_DIR/$SCRIPTS_DIR/* $HOME/$SCRIPTS_DIR/
mv $HOME/$CONFIG_DIR/i3/config $HOME/$CONFIG_DIR/i3/config.backup
cp $SOURCE_DIR/$CONFIG_DIR/i3/config_laptop $HOME/$CONFIG_DIR/i3/config
cp $SOURCE_DIR/$CONFIG_DIR/i3/i3blocks_laptop.conf $HOME/$CONFIG_DIR/i3/i3blocks_laptop.conf

echo ""
echo "done!"
echo ""
echo "Restart X session or reboot to log into i3"
