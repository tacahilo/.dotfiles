package 'vim' do
  options '--with-lua --with-luajit'
end

git '~/.vim' do
  repository 'https://github.com/tacahilo/.vim'
end
