#!/usr/bin/env zsh
set -uo pipefail

NODE_VERSION=$(cat home/.node-version)
NPM_GLOBAL_PACKAGES=(chrome-remote-interface@0.33.3 zx@8.8.2)

if uname | grep >/dev/null Darwin; then
  echo "Detected Darwin"

  export IS_MACOS=true
else
  export IS_MACOS=
fi

if uname -a | grep >/dev/null -- -rpi- || grep &>/dev/null -i "raspberry pi" /sys/firmware/devicetree/base/model; then
  echo "Detected raspi"

  export IS_RASPI=true
else
  export IS_RASPI=
fi

if [[ ! -z "$IS_MACOS" ]]; then
  echo "Attempting to use GNU coreutils path on macOS"
  export PATH="$HOMEBREW_PREFIX/opt/coreutils/libexec/gnubin:$HOMEBREW_PREFIX/opt/findutils/libexec/gnubin:$PATH"
fi

echo -n "Installing home dir files..."
cp -prsT --update=none $(realpath home)/ ~/
mkdir -p ~/.vim/backups ~/.vim/swaps ~/.vim/undo
echo "Done"

echo -n "Generating system-specific configuration..."
$(dirname $0)/generate.sh
echo "Done"

if [[ "${1-}" == "-a" ]] && uname | grep >/dev/null Linux; then
  echo -n "Installing system files..."
  sudo cp -rT --preserve=mode,timestamps $(realpath etc)/ /etc/
  echo "Done"
fi

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

echo -n "Setting up fnm/npm..."
zsh -i -c "fnm install $NODE_VERSION && fnm use $NODE_VERSION && npm i -g $NPM_GLOBAL_PACKAGES"
echo "Done"

if [[ -z "$IS_RASPI" ]]; then
  echo -n "Setting up Rust..."
  rustup install stable && rustup default stable && rustup component add rust-analysis rust-src rustfmt && cargo install --locked prcs cargo-insta cargo-outdated cargo-watch cross
  echo "Done"
fi

echo -n "Setting up vim..."
nvim -c 'PlugInstall' -c "source $(realpath snapshot.vim)" -c 'VimProcInstall' -c 'qa!'
echo "Done"

if [[ ! -z "$IS_MACOS" ]]; then
  echo -n "Downloading grml-zsh-config..."
  if [[ ! -d ~/.grml.zsh ]]; then
    curl -L > ~/.grml.zsh https://git.grml.org/f/grml-etc-core/etc/zsh/zshrc
  fi
  echo "Done"

  echo -n "Running brew list export once..."
  PKG_LIST=$HOME/docs/tech/pkg-list/$HOST.txt
  brew list >$PKG_LIST
  echo >>$PKG_LIST
  brew cask list >>$PKG_LIST
  echo "Done"
fi

echo -n "Looking for dangling symlinks..."
DANGLING_SYMLINKS_CMD="find ~ -maxdepth 4 -xtype l ! -path '*/.config/BraveSoftware/*' ! -path '*/.thunderbird/*' ! -path '*/.config/discord/*' ! -path '*/.config/Signal/*' ! -path '*/.mozilla/firefox/*' ! -path '*/.steampath'"
if [[ ! -z "$IS_MACOS" || ! -z "$IS_RASPI" ]] DANGLING_SYMLINKS_CMD="${DANGLING_SYMLINKS_CMD} ! -path '*/.config/autostart/*'"
DANGLING_SYMLINKS=`eval $DANGLING_SYMLINKS_CMD`
if [ -n "$DANGLING_SYMLINKS" ]; then
  echo "Dangling symlinks:"
  echo $DANGLING_SYMLINKS
  echo "To remove, use:"
  echo "$DANGLING_SYMLINKS_CMD -delete"
fi
