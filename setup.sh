#!/bin/bash

git clone --recursive git@github.com:Tacahilo/.dotfiles.git $HOME/.dotfiles
git clone --recursive git@github.com:Tacahilo/.vim.git $HOME/.vim
git clone --recursive git@github.com:Tacahilo/.zsh.d.git $HOME/.zsh.d

if expr "$OSTYPE" : "^darwin" >/dev/null; then
  . setup.sh.osx
else
  exit 1
fi
