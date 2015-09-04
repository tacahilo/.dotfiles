#!/bin/bash

# clone dotfiles dir
[ -d "$HOME/.dotfiles" ] || git clone --recursive https://github.com/tacahilo/.dotfiles.git $HOME/.dotfiles

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
