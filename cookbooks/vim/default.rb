package "vim" do
  options "--with-lua --with-luajit"
end

package "ctags"

remote_file "#{Dir.home}/.ctags"

git "#{Dir.home}/.vim" do
  repository "https://github.com/tacahilo/.vim"
  revision "master"
end

execute "vim-plug" do
  command "curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
  not_if "test -f #{Dir.home}/.vim/autoload/plug.vim"
end
