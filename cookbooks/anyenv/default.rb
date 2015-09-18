git "#{Dir.home}/.anyenv" do
  repository "https://github.com/riywo/anyenv"
end

directory "#{Dir.home}/.anyenv/plugins"

git "#{Dir.home}/.anyenv/plugins/anyenv-update" do
  repository "https://github.com/znz/anyenv-update"
end
