#!/bin/bash

echo -n "Installing home dir files..."
cp -nprsT $(realpath home)/ ~/
mkdir -p ~/.vim/backups ~/.vim/swaps ~/.vim/undo
echo "Done"

echo -n "Installing base16-shell..."
ln -fnsT $(realpath base16-shell) ~/.config/base16-shell
echo "Done"

echo -n "Installing vim-pathogen..."
mkdir -p ~/.vim/autoload ~/.vim/bundle
ln -fnsT $(realpath vim-pathogen/autoload/pathogen.vim) ~/.vim/autoload/pathogen.vim
echo "Done"

echo -n "Installing vim-plug..."
mkdir -p ~/.local/share/nvim/site/autoload
ln -fnsT $(realpath vim-plug/plug.vim) ~/.local/share/nvim/site/autoload/plug.vim
echo "Done"

if [ "$1" == "-a" ]; then
  echo -n "Installing systemd files..."
  sudo cp -nprsT $(realpath systemd)/ /etc/systemd/
  echo "Done"
fi

DANGLING_SYMLINKS=`find ~ -maxdepth 4 -xtype l`
if [ -n "$DANGLING_SYMLINKS" ]; then
  echo "Dangling symlinks:"
  echo $DANGLING_SYMLINKS
  echo "To remove, use:"
  echo "find ~ -maxdepth 4 -xtype l -delete"
fi
