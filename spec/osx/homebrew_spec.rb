require 'spec_helper'

describe 'homebrew cask' do
  %w(
    cmake
    cmigemo
    colordiff
    ctags
    direnv
    graphviz
    heroku
    highlight
    imagemagick
    jpegoptim
    jq
    less
    lv
    massren
    ncurses
    nkf
    openssl
    optipng
    pcre
    reattach-to-user-namespace
    redis
    ssh-copy-id
    the_silver_searcher
    tmux
    tree
    urlview
    watch
  ).each do |pkg|
    describe package(pkg) do
      it { should be_installed }
    end
  end
end
