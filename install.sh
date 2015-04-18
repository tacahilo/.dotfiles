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
################
# install *env #
################
EOS

cat <<EOS
#########
# rbenv #
#########
EOS
if [ ! -d "$HOME/.rbenv" ]; then
    git clone --depth 1 https://github.com/sstephenson/rbenv.git $HOME/.rbenv
    mkdir $HOME/.rbenv/plugins
    git clone --depth 1 https://github.com/znz/rbenv-plug $HOME/.rbenv/plugins/rbenv-plug
fi

plugins=(
    ruby-build
    rbenv-default-gems
    rbenv-gem-rehash
    rbenv-update
    gem-src
)
for item in ${plugins[@]}; do
  rbenv plug $item
done

cat <<EOF > $HOME/.rbenv/default-gems
artii
awesome_print
bundler
debugger
dotenv
git-browse-remote
hirb
hirb-unicode
ipaddress
librarian-puppet
mgem
mysql2
octokit
pry
pry-theme
puppet
puppet-lint
reek
rubocop
sheet
wirb
EOF

cat <<EOS
#########
# plenv #
#########
EOS
if [ ! -d "$HOME/.plenv" ]; then
    git clone --depth 1 git://github.com/tokuhirom/plenv.git ~/.plenv
    mkdir ~/.plenv/plugins
    git clone --depth 1 git://github.com/tokuhirom/Perl-Build.git ~/.plenv/plugins/perl-build
    git clone --depth 1 git://github.com/Tacahilo/plenv-update.git ~/.plenv/plugins/plenv-update
fi

mkdir -p ~/{bin,src}
mkdir -p ~/usr/local/{bin,lib,src}

if expr "$OSTYPE" : "^darwin" >/dev/null; then
  . setup.sh.osx
fi
