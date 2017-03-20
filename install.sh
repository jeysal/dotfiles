#!/bin/bash

echo -n "Installing home dir files..."
cp -rT home/ ~/
mkdir -p ~/.vim/backups ~/.vim/swaps ~/.vim/undo
echo "Done"

echo -n "Installing base16-shell..."
mkdir -p ~/.config/base16-shell
cp -rT base16-shell/ ~/.config/base16-shell/
echo "Done"

echo -n "Installing vim-pathogen..."
mkdir -p ~/.vim/autoload ~/.vim/bundle
cp vim-pathogen/autoload/pathogen.vim ~/.vim/autoload
echo "Done"

echo -n "Installing vim-plug..."
cp vim-plug/plug.vim ~/.vim/autoload
echo "Done"

echo -n "Installing systemd files..."
sudo cp -rT systemd/ /etc/systemd/
echo "Done"
