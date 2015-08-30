package "vim" do
  options "--with-lua --with-luajit"
end

git "#{Dir.home}/.vim" do
  repository "https://github.com/tacahilo/.vim"
end

def neobundle
  "https://raw.githubusercontent.com/Shougo/neobundle.vim/master/bin/install.sh"
end

execute "neobundle" do
  command "curl -sS #{neobundle} | sh"
  not_if "test -d #{Dir.home}/.vim/bundle/neobundle.vim"
end

