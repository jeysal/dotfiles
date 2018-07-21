#!/bin/bash

echo -n "Installing home dir files..."
cp -nprsT $(realpath home)/ ~/
mkdir -p ~/.vim/backups ~/.vim/swaps ~/.vim/undo
echo "Done"

echo -n "Installing base16-shell..."
ln -fnsT $(realpath base16-shell) ~/.config/base16-shell
echo "Done"

echo -n "Installing vim-plug..."
mkdir -p ~/.local/share/nvim/site/autoload
ln -fnsT $(realpath vim-plug/plug.vim) ~/.local/share/nvim/site/autoload/plug.vim
echo "Done"

if [ "$1" != "-a" ]; then
  exit
fi

echo -n "Installing systemd files..."
sudo cp -nprsT $(realpath systemd)/ /etc/systemd/
echo "Done"
