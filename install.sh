#!/bin/sh

if expr "$OSTYPE" : "^darwing" >/dev/null; then
    echo migrating...
else
    exit 1
fi

cd ~/.

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


# install pythonbrew
which pythonbrew > /dev/null
if [ $? -eq 0 ]; then
    echo pythonbrew already installed
else
    curl -kL http://xrl.us/pythonbrewinstall | bash
fi


if [[ condition ]]; then
    #statements
fi

# alias dotfiles
for file in `find ~/.dotfiles -d 1 -name '.*' | grep -v '.git$' | sed "s/.*dotfiles\///g"`; do
   ln -s ~/.dotfiles/$file ~/$file
done