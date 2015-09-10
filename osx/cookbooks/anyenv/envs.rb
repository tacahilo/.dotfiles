include_recipe './default.rb'
include_recipe './definitions.rb'

package 'erlang'

%w(
  goenv
  plenv
  pyenv
  rbenv
  exenv
).each { |env| anyenv_install env }

directory "#{Dir.home}/.anyenv/envs/rbenv/plugins"

git "#{Dir.home}/.anyenv/envs/rbenv/plugins/gem-src" do
  repository "https://github.com/amatsuda/gem-src"
end

git "#{Dir.home}/.anyenv/envs/rbenv/plugins/rbenv-gem-rehash" do
  repository "https://github.com/sstephenson/rbenv-gem-rehash"
end

git "#{Dir.home}/.anyenv/envs/rbenv/plugins/rbenv-default-gems" do
  repository "https://github.com/sstephenson/rbenv-default-gems"
end

remote_file "#{Dir.home}/.anyenv/envs/rbenv/default-gems"
remote_file "#{Dir.home}/.gemrc"
remote_file "#{Dir.home}/.irbrc"
remote_file "#{Dir.home}/.pryrc"
