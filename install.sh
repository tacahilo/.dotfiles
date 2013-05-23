#!/bin/sh

if expr "$OSTYPE" : "^darwing" >/dev/null; then
    echo migrating...
    cd ~/.
else
    exit 1
fi


# install homebrew
which brew > /dev/null
if [ $? -eq 0 ]; then
    echo homebrew already installed
else
    echo install homebrew >&2
    ruby -e "$(curl -fsSL https://raw.github.com/mxcl/homebrew/go)"
    brew install git
    brew install mercurial
    brew install zsh
    brew install wget
    brew install emacs --cocoa --HEAD --use-git-head
    brew install vim
    brew install macvim
    brew install tree
    brew install proctools
    brew install fontforge
    brew install gibo
fi


# plenv
which plenv > /dev/null 2>&1
if [ $? -eq 0 ]; then
    echo plenv already installed
else
   ln -s ~/.dotfiles/libs/plenv ~/.plenv
fi


# pyenv
which pyenv > /dev/null 2>&1
if [ $? -eq 0 ]; then
    echo pyenv already installed
else
   ln -s ~/.dotfiles/libs/pyenv ~/.pyenv
fi


# rbenv
which rbenv > /dev/null 2>&1
if [ $? -eq 0 ]; then
    echo rbenv already installed
else
   ln -s ~/.dotfiles/libs/rbenv ~/.rbenv
fi


# phpenv
which phpenv > /dev/null 2>&1
if [ $? -eq 0 ]; then
    echo phpenv already installed
else
   ln -s ~/.dotfiles/libs/phpenv ~/.phpenv
fi


# nodebrew
which nodebrew > /dev/null 2>&1
if [ $? -eq 0 ]; then
    echo nodebrew already installed
else
    curl -L git.io/nodebrew | perl - setup
fi


# alias dotfiles
for file in `find ~/.dotfiles -d 1 -name '.*' | grep -v '.git$' | sed "s/.*dotfiles\///g"`; do
   ln -s ~/.dotfiles/$file ~/$file
done
