#!/usr/bin/env zsh

if uname | grep >/dev/null Darwin; then
  echo "Detected Darwin"

  export IS_MACOS=true
fi

if uname -a | grep >/dev/null rpi-legacy; then
  echo "Detected raspi"

  export IS_RASPI=true
fi

if [[ ! -z "$IS_MACOS" ]]; then
  echo "Attempting to use GNU coreutils path on macOS"
  export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
fi

echo -n "Installing home dir files..."
cp -nprsT $(realpath home)/ ~/
mkdir -p ~/.vim/backups ~/.vim/swaps ~/.vim/undo
echo "Done"

echo -n "Installing base16-shell..."
ln -fnsT $(realpath base16-shell) ~/.config/base16-shell
echo "Done"

echo -n "Installing pure..."
mkdir -p ~/.pure
ln -fnsT $(realpath pure/pure.zsh) ~/.pure/prompt_pure_setup
ln -fnsT $(realpath pure/async.zsh) ~/.pure/async
echo "Done"

echo -n "Installing vim-pathogen..."
mkdir -p ~/.vim/autoload ~/.vim/bundle
ln -fnsT $(realpath vim-pathogen/autoload/pathogen.vim) ~/.vim/autoload/pathogen.vim
echo "Done"

echo -n "Installing vim-plug..."
mkdir -p ~/.local/share/nvim/site/autoload
ln -fnsT $(realpath vim-plug/plug.vim) ~/.local/share/nvim/site/autoload/plug.vim
echo "Done"

echo -n "Setting up nvm/npm..."
NODE_VERSION=16.13.0
NPM_GLOBAL_PACKAGES=(chrome-remote-interface@0.28.1 lid-sleep-daemon@2.0.1 serve@11.3.0 typescript-language-server@0.4.0)
zsh -i -c "nvm install $NODE_VERSION && nvm alias default $NODE_VERSION && npm i -g $NPM_GLOBAL_PACKAGES"
echo "Done"

if [[ -z "$IS_RASPI" ]]; then
  echo -n "Setting up Rust..."
  rustup install stable && rustup default stable && rustup component add rls-preview rust-analysis rust-src rustfmt && cargo install --locked prcs cargo-insta cargo-outdated cargo-watch cross
  echo "Done"
fi

echo -n "Setting up vim..."
pip install --user neovim
nvim -c 'PlugInstall' -c "source $(realpath snapshot.vim)" -c 'VimProcInstall' -c 'qa!'
echo "Done"

echo -n "Setting up i3..."
pip install --user i3ipc
echo "Done"

if [[ ! -z "$IS_MACOS" ]]; then
  echo -n "Downloading grml-zsh-config..."
  if [[ ! -d ~/.grml.zsh ]]; then
    curl -L > ~/.grml.zsh https://git.grml.org/f/grml-etc-core/etc/zsh/zshrc
  fi
  echo "Done"

  if [[ ! -d ~/.powerlevel10k ]]; then
    echo -n "Downloading powerlevel10k..."
    git clone https://github.com/romkatv/powerlevel10k ~/.powerlevel10k
    echo "Done"
  fi

  echo -n "Linking VSCode files..."
  mkdir -p "$HOME/Library/Application Support/Code/User"
  ln -fst "$HOME/Library/Application Support/Code/User" ~/.config/Code/User/*
  echo "Done"

  echo -n "Running list exports once..."
  npm ls -g --depth=0 2>/dev/null >$HOME/docs/tech/npm-global-list/$HOST.txt

  PKG_LIST=$HOME/docs/tech/pkg-list/$HOST.txt
  brew list >$PKG_LIST
  echo >>$PKG_LIST
  brew cask list >>$PKG_LIST

  ls $HOME/.vscode/extensions/ >$HOME/docs/tech/vscode-ext-list/$HOST.txt
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
