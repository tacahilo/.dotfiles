#!/bin/sh

PATH=/usr/local/bin:$PATH

TAPS=(
    homebrew/binary
    homebrew/dupes
    homebrew/versions
    homebrew/science
    josegonzalez/php
)

FORMULAS=(
    autoconf
    automake
    bash
    boot2docker
    caskroom/cask/brew-cask
    cmigemo
    cmake
    coreutils
    ctags
    curl
    fontconfig
    fontforge
    fping
    freetype
    gcc
    gcc48
    gibo
    gist
    "git --with-brewed-curl --with-brewed-openssl --with-gettext --with-pcre"
    git-flow
    "global --with-exuberant-ctags"
    gnu-tar
    graphviz
    gzip
    highlight
    hping
    "hub --HEAD"
    imagemagick
    isync
    jq
    laurent22/massren/massren
    mosh
    msmtp
    mysql
    ncurses
    nkf
    node
    openssl
    packer
    peco/peco/peco
    readline
    reattach-to-user-namespace
    ssh-copy-id
    the_silver_searcher
    tig
    tmux
    tree
    unzip
    "vim --with-lua --with-luajit"
    watch
    "weechat --with-python --with-perl --with-ruby --with-lua"
    wget
    zsh
)

CASKS=(
    coteditor
    cyberduck
    dropbox
    firefox
    google-chrome
    iterm2
    karabiner
    kobito
    onyx
    opera
    silverlight
    skitch
    skype
    vagrant
    virtualbox
    xquartz
)

setup() {

    if which brew; then
        ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    fi

}

function install_brewfiles() {
    for tap in "${TAPS[@]}"; do
        brew tap $tap
    done

    for formula in "${FORMULAS[@]}"; do
        brew install $formula
    done
}

function install_caskfiles() {
    for cask in "${CASKS[@]}"; do
        brew cask install $cask
    done
}

function main() {
    setup

    brew update
    brew upgrade

    install_brewfiles
    install_caskfiles

    brew cleanup
    brew doctor
}

main
