#!/usr/bin/env zsh

echo -n "Installing home dir files..."
cp -nprsT $(realpath home)/ ~/
mkdir -p ~/.vim/backups ~/.vim/swaps ~/.vim/undo
echo "Done"

echo -n "Installing base16-shell..."
ln -fnsT $(realpath base16-shell) ~/.config/base16-shell
echo "Done"

echo -n "Installing spacemacs..."
ln -fnsT $(realpath spacemacs) ~/.emacs.d
echo "Done"

echo -n "Installing vim-pathogen..."
mkdir -p ~/.vim/autoload ~/.vim/bundle
ln -fnsT $(realpath vim-pathogen/autoload/pathogen.vim) ~/.vim/autoload/pathogen.vim
echo "Done"

echo -n "Installing vim-plug..."
mkdir -p ~/.local/share/nvim/site/autoload
ln -fnsT $(realpath vim-plug/plug.vim) ~/.local/share/nvim/site/autoload/plug.vim
echo "Done"

echo -n "Setting up nvm..."
NODE_VERSION=12
zsh -i -c "nvm install $NODE_VERSION && nvm alias default $NODE_VERSION"
echo "Done"

echo -n "Setting up vim..."
pip install --user neovim
nvim -c 'PlugInstall' -c 'VimProcInstall' -c 'qa!'
echo "Done"

echo -n "Setting up i3..."
pip install --user i3ipc
echo "Done"

if uname | grep >/dev/null Darwin; then
  echo "Detected Darwin"

  echo -n "Installing pure..."
  mkdir -p ~/.pure
  ln -fnsT $(realpath pure/pure.zsh) ~/.pure/prompt_pure_setup
  ln -fnsT $(realpath pure/async.zsh) ~/.pure/async
  echo "Done"

  echo -n "Linking VSCode files..."
  mkdir -p "$HOME/Library/Application Support/Code/User"
  ln -fst "$HOME/Library/Application Support/Code/User" ~/.config/Code/User/*
  echo "Done"

  echo -n "Running list exports once..."
  npm ls -g --depth=0 2>/dev/null >$HOME/gdrive/tech/npm-global-list/$HOST.txt

  PKG_LIST=$HOME/gdrive/tech/pkg-list/$HOST.txt
  brew list >$PKG_LIST
  echo >>$PKG_LIST
  brew cask list >>$PKG_LIST

  ls $HOME/.vscode/extensions/ >$HOME/gdrive/tech/vscode-ext-list/$HOST.txt
  echo "Done"
fi

if [[ "$1" == "-a" ]] && uname | grep >/dev/null Linux; then
  echo -n "Installing systemd files..."
  sudo cp -nprsT $(realpath systemd)/ /etc/systemd/
  echo "Done"

  echo -n "Installing udev files..."
  sudo cp -nprsT $(realpath udev)/ /etc/udev/
  echo "Done"
fi

DANGLING_SYMLINKS=`find ~ -maxdepth 4 -xtype l`
if [ -n "$DANGLING_SYMLINKS" ]; then
  echo "Dangling symlinks:"
  echo $DANGLING_SYMLINKS
  echo "To remove, use:"
  echo "find ~ -maxdepth 4 -xtype l -delete"
fi
