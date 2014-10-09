#!/bin/bash

git clone --recursive https://github.com/tacahilo/.dotfiles.git $HOME/.dotfiles
ln -sf $HOME/.dotfiles/.vim $HOME/.vim
ln -sf $HOME/.dotfiles/.zsh.d $HOME/.zsh.d

mkdir ~/{bin,src}
mkdir -p ~/usr/local/{bin,lib,src}

if expr "$OSTYPE" : "^darwin" >/dev/null; then
  . setup.sh.osx
fi
