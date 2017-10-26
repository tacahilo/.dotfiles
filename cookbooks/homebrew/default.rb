BREW_URL = 'https://raw.githubusercontent.com/Homebrew/install/master/install'
execute "ruby -e \"$(curl -fsSL #{BREW_URL})\"" do
  not_if "which brew"
end

require 'itamae/plugin/resource/brew_tap'
brew_tap 'caskroom/cask'

%w(
  cmake
  graphviz
  heroku
  imagemagick
  jpegoptim
  jq
  nkf
  openssl
  optipng
  pcre
  redis
  urlview
).each { |pkg| package pkg }
