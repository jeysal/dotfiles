#!/bin/bash

echo -n "Installing home dir files..."
cp -rpT home/ ~/
mkdir -p ~/.vim/backups ~/.vim/swaps ~/.vim/undo
echo "Done"

echo -n "Installing base16-shell..."
mkdir -p ~/.config/base16-shell
cp -rpT base16-shell/ ~/.config/base16-shell/
echo "Done"

echo -n "Installing vim-pathogen..."
mkdir -p ~/.vim/autoload ~/.vim/bundle
cp -p vim-pathogen/autoload/pathogen.vim ~/.vim/autoload
echo "Done"

echo -n "Installing vim-plug..."
cp -p vim-plug/plug.vim ~/.vim/autoload
echo "Done"

if [ "$1" != "-a" ]; then
  exit
fi

echo -n "Installing systemd files..."
sudo cp -rpT systemd/ /etc/systemd/
echo "Done"

echo -n "Installing xorg.conf.d files..."
sudo cp -rpT xorg.conf.d/ /etc/X11/xorg.conf.d/
echo "Done"
