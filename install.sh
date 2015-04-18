#!/bin/bash

if [ -d "$HOME/.dotfiles" ]; then
    echo Already exists
    ls -ld "$HOME/.dotfiles"
else
    git clone --recursive https://github.com/tacahilo/.dotfiles.git $HOME/.dotfiles
fi

cat <<EOS
###############
# install vim #
###############
EOS
ln -sf $HOME/.dotfiles/.vim $HOME
curl --progress-bar https://raw.githubusercontent.com/Shougo/neobundle.vim/master/bin/install.sh | sh
vim +NeoBundleInstall +qall

cat <<EOS
###############
# install zsh #
###############
EOS
ln -sf $HOME/.dotfiles/.zsh.d $HOME

cat <<EOS
##################
# install anyenv #
##################
EOS
if [ -e "$HOME/.anyenv" ]; then
    ln -sf $HOME/.dotfiles/.anyenv $HOME
    mkdir -p $HOME/.anyenv/plugins
    pushd $HOME/.anyenv/plugins
    git clone https://github.com/znz/anyenv-update.git
    git clone https://github.com/znz/anyenv-git.git
    popd
else
    echo Already exists
    ls -ld "$HOME/.anyenv"
fi

mkdir -p ~/{bin,src}
mkdir -p ~/usr/local/{bin,lib,src}

if expr "$OSTYPE" : "^darwin" >/dev/null; then
  . setup.sh.osx
fi
