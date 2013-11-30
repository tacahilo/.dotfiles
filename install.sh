#!/bin/sh

if expr "$OSTYPE" : "^darwin" >/dev/null; then
    echo migrating...
    cd ~/.
else
    exit 1
fi

# install homebrew
type -p brew >&/dev/null
if [ $? -eq 0 ]; then
    echo homebrew already installed
else
    echo install homebrew
    ruby -e "$(curl -fsSL https://raw.github.com/mxcl/homebrew/go)"
    brew install git
    brew update
fi

type -p brew >&/dev/null
if [ $? -eq 0 ]; then
    brew install tig
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

# vim
git clone --recursive https://github.com/Tacahilo/.vim.git $HOME/.vim
# zsh
git clone --recursive https://github.com/Tacahilo/.zsh.d.git $HOME/.zsh.d

# alias dotfiles
for file in `find ~/.dotfiles -d 1 -name '.*' | grep -v '.git$' | sed "s/.*dotfiles\///g"`; do
   ln -s ~/.dotfiles/$file ~/$file
done
