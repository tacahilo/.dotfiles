#!/bin/bash

# clone dotfiles dir
[ -d "$HOME/.dotfiles" ] || git clone --recursive https://github.com/tacahilo/.dotfiles.git $HOME/.dotfiles


go get -v -u github.com/golang/lint
go get -v -u github.com/mitchellh/gox
go get -v -u github.com/motemen/ghq
go get -v -u github.com/motemen/gore
go get -v -u github.com/nsf/gocode
go get -v -u github.com/spf13/hugo
go get -v -u github.com/tcnksm/gcli
go get -v -u golang.org/x/tools/cmd/goimports
go get -v -u golang.org/x/tools/cmd/gorename
