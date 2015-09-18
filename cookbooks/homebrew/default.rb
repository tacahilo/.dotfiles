BREW_URL = 'https://raw.githubusercontent.com/Homebrew/install/master/install'
execute "ruby -e \"$(curl -fsSL #{BREW_URL})\"" do
  not_if "which brew"
end

require 'itamae/plugin/resource/brew_tap'
brew_tap 'caskroom/cask'
package 'brew-cask'

%w(
  cmake
  graphviz
  heroku-toolbelt
  imagemagick
  jpegoptim
  jq
  nkf
  openssl
  optipng
  pcre
  redis
  urlview
  weechat
).each { |pkg| package pkg }
