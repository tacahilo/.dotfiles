#!/bin/bash

# clone dotfiles dir
[ -d "$HOME/.dotfiles" ] || git clone --recursive https://github.com/tacahilo/.dotfiles.git $HOME/.dotfiles


go get -u github.com/golang/lint
go get -u github.com/mitchellh/gox
go get -u github.com/motemen/ghq
go get -u github.com/motemen/gore
go get -u github.com/nsf/gocode
go get -u github.com/spf13/hugo
go get -u github.com/tcnksm/gcli
go get -u golang.org/x/tools/cmd/goimports
go get -u golang.org/x/tools/cmd/gorename
