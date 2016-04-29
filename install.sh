#!/bin/bash

echo -n "Copying files to home directory..."
cp -rT home/ ~/
echo "Done"

echo -n "Installing vim monokai theme..."
mkdir -p ~/.vim/colors
cp vim-monokai/colors/monokai.vim ~/.vim/colors
echo "Done"

echo "Installing powerline shell prompt..."
cd powerline-shell
./install.py
cp powerline-shell.py ~
cd ..
echo "Done"
