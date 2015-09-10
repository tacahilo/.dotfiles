BREW_URL = 'https://raw.githubusercontent.com/Homebrew/install/master/install'
execute "ruby -e \"$(curl -fsSL #{BREW_URL})\"" do
  not_if "which brew"
end

require 'itamae/plugin/resource/brew_tap'
brew_tap 'caskroom/cask'
package 'brew-cask'

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
).each { |pkg| package pkg }
