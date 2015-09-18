require "itamae/plugin/resource/cask"

%w(
  java
  android-studio
).each { |pkg| cask pkg }
