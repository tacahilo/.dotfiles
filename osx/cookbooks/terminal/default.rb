include_recipe "../zsh/default.rb"
include_recipe "../gnu/default.rb"
include_recipe "../mail_client/default.rb"

%w(
  colordiff
  direnv
  highlight
  jq
  less
  lv
  massren
  ncurses
  ncurses
  reattach-to-user-namespace
  ssh-copy-id
  the_silver_searcher
  tree
  watch
  weechat
).each { |pkg| package pkg }

package "tmux"
remote_file "#{Dir.home}/.tmux.conf"

package "urlview"
remote_file "#{Dir.home}/.urlview"
