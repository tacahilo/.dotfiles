require "itamae/plugin/resource/cask"
%w(
  google-chrome
  firefox
  opera
).each { |pkg| cask pkg }

package "lynx"
remote_file "#{Dir.home}/.lynx.lss"
