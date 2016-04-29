#!/bin/bash

echo -n "Copying files to home directory..."
cp -rT home/ ~/
echo "Done"

echo "Downloading vim monokai theme..."
mkdir -p ~/.vim/colors
curl https://raw.githubusercontent.com/sickill/vim-monokai/master/colors/monokai.vim > ~/.vim/colors/monokai.vim
echo "Done"
