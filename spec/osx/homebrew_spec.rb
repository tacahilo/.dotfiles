require 'spec_helper'

describe 'homebrew cask' do
  describe package('brew-cask') do
    it { should be_installed }
  end

  %w(
    cmake
    cmigemo
    colordiff
    ctags
    direnv
    graphviz
    heroku-toolbelt
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
    weechat
  ).each do |pkg|
    describe package(pkg) do
      it { should be_installed }
    end
  end
end
