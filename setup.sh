#!/bin/bash

git clone --recursive https://github.com/Tacahilo/.vim.git $HOME/.vim
git clone --recursive https://github.com/Tacahilo/.zsh.d.git $HOME/.zsh.d

if expr "$OSTYPE" : "^darwin" >/dev/null; then
  . setup.sh.osx
lse
  exit 1
fi

# alias dotfiles
for file in `find ~/.dotfiles -d 1 -name '.*' | grep -v '.git$' | sed "s/.*dotfiles\///g"`; do
   ln -s ~/.dotfiles/$file ~/$file
done
