package "zsh"

git "#{Dir.home}/.zsh.d" do
  repository "https://github.com/tacahilo/.zsh.d"
  recursive true
end

remote_file "#{Dir.home}/.zshrc"
remote_file "#{Dir.home}/.zshenv"
remote_file "#{Dir.home}/.zlogin"
