#!/bin/bash

echo -n "Installing home dir files..."
rsync -a home/ ~/
mkdir -p ~/.vim/backups ~/.vim/swaps ~/.vim/undo
echo "Done"

echo -n "Installing base16-shell..."
mkdir -p ~/.config/base16-shell
rsync -a base16-shell/ ~/.config/base16-shell/
echo "Done"

echo -n "Installing vim-plug..."
mkdir -p ~/.local/share/nvim/site/autoload
rsync -a vim-plug/plug.vim ~/.local/share/nvim/site/autoload/plug.vim
echo "Done"

if [ "$1" != "-a" ]; then
  exit
fi

echo -n "Installing systemd files..."
sudo rsync -a systemd/ /etc/systemd/
echo "Done"
