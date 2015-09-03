#!/bin/bash

# clone dotfiles dir
[ -d "$HOME/.dotfiles" ] || git clone --recursive https://github.com/tacahilo/.dotfiles.git $HOME/.dotfiles


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
anyenv install pyenv
anyenv install goenv
anyenv rehash

mkdir -p ~/{bin,src}
mkdir -p ~/usr/local/{bin,lib,src}

if expr "$OSTYPE" : "^darwin" >/dev/null; then
  . setup.sh.osx
fi


goenv install 1.5
goenv global 1.5
go get -u github.com/golang/lint
go get -u github.com/mitchellh/gox
go get -u github.com/motemen/ghq
go get -u github.com/motemen/gore
go get -u github.com/nsf/gocode
go get -u github.com/spf13/hugo
go get -u github.com/tcnksm/gcli
go get -u golang.org/x/tools/cmd/goimports
go get -u golang.org/x/tools/cmd/gorename
