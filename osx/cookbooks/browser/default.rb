require "itamae/plugin/resource/cask"

%w(
  google-chrome
  firefox
  opera
).each { |pkg| cask pkg }
