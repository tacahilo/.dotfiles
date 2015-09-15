package "vim" do
  options "--with-lua --with-luajit"
end

package "ctags"

git "#{Dir.home}/.vim" do
  repository "https://github.com/tacahilo/.vim"
  revision "master"
end

execute "neobundle" do
  command "curl -sSL https://raw.githubusercontent.com/Shougo/neobundle.vim/master/bin/install.sh | sh"
  not_if "test -d #{Dir.home}/.vim/bundle/neobundle.vim"
end
