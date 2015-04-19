#!/bin/bash

# clone dotfiles dir
[ -d "$HOME/.dotfiles" ] || git clone --recursive https://github.com/tacahilo/.dotfiles.git $HOME/.dotfiles

# setting Vim
ln -sf $HOME/.dotfiles/.vim $HOME/.vim
curl --progress-bar https://raw.githubusercontent.com/Shougo/neobundle.vim/master/bin/install.sh | sh
vim +NeoBundleInstall +qall

# zsh
ln -sf $HOME/.dotfiles/.zsh.d $HOME

# anyenv
if [ ! -d "$HOME/.anyenv" ]; then
    git clone https://github.com/riywo/anyenv $HOME/.anyenv
    mkdir -p $HOME/.anyenv/plugins && cd $HOME/.anyenv/plugins
    git clone https://github.com/znz/anyenv-update.git
fi

PATH=$HOME/.anyenv/bin:$PATH
eval "$(anyenv init -)"

## *env by anyenv
anyenv install rbenv
mkdir -p $HOME/.anyenv/envs/rbenv/plugins && cd $HOME/.anyenv/envs/rbenv/plugins
git clone https://github.com/amatsuda/gem-src.git
git clone https://github.com/sstephenson/rbenv-gem-rehash.git
git clone https://github.com/sstephenson/rbenv-default-gems.git
ln -sf $HOME/.dotfiles/rbenv-default-gems $HOME/.anyenv/envs/rbenv/default-gems

anyenv install plenv

mkdir -p ~/{bin,src}
mkdir -p ~/usr/local/{bin,lib,src}

if expr "$OSTYPE" : "^darwin" >/dev/null; then
  . setup.sh.osx
fi
