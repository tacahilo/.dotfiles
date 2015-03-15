#!/bin/bash

if [ -d "$HOME/.dotfiles" ]; then
    echo Already exists
    ls -ld "$HOME/.dotfiles"
else
    git clone --recursive https://github.com/tacahilo/.dotfiles.git $HOME/.dotfiles
fi

ln -sf $HOME/.dotfiles/.vim $HOME/.vim
ln -sf $HOME/.dotfiles/.zsh.d $HOME/.zsh.d
ln -sf $HOME/.dotfiles/.anyenv $HOME/.anyenv

mkdir -p ~/{bin,src}
mkdir -p ~/usr/local/{bin,lib,src}

if expr "$OSTYPE" : "^darwin" >/dev/null; then
  . setup.sh.osx
fi
