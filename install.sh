#!/bin/bash

echo -n "Installing home dir files..."
cp -rT home/ ~/
echo "Done"

echo -n "Installing vim monokai theme..."
mkdir -p ~/.vim/colors
cp vim-monokai/colors/monokai.vim ~/.vim/colors
echo "Done"

echo -n "Installing systemd files..."
sudo cp -rT systemd/ /etc/systemd/
echo "Done"
