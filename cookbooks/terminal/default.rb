include_recipe "../homebrew/default.rb"
include_recipe "../zsh/default.rb"
include_recipe "../anyenv/envs.rb"
include_recipe "../gnu/default.rb"
include_recipe "../peco/default.rb"
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
  reattach-to-user-namespace
  ssh-copy-id
  the_silver_searcher
  tree
  watch
).each { |pkg| package pkg }

package "tmux"
remote_file "#{Dir.home}/.tmux.conf"

directory "#{Dir.home}/.tmux/plugins"
git "#{Dir.home}/.tmux/plugins/tpm" do
  repository "https://github.com/tmux-plugins/tpm"
end

package "urlview"
remote_file "#{Dir.home}/.urlview"
