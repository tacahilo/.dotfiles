#!/bin/bash

git clone --recursive https://github.com/tacahilo/.dotfiles.git $HOME/.dotfiles
git clone --recursive https://github.com/tacahilo/.vim.git $HOME/.vim
git clone --recursive https://github.com/tacahilo/.zsh.d.git $HOME/.zsh.d
ln -sf ~/.dotfiles/usr ~/usr
mkdir ~/bin
mkdir ~/src

if expr "$OSTYPE" : "^darwin" >/dev/null; then
  . setup.sh.osx
else
  exit 1
fi
