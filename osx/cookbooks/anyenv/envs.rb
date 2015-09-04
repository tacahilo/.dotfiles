include_recipe './default.rb'
include_recipe './definitions.rb'

%w(
  goenv
  plenv
  pyenv
  rbenv
  exenv
).each { |env| anyenv_install env }
