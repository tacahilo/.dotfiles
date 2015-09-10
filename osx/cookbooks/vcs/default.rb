require 'itamae/plugin/resource/brew_tap'

package "git" do
  options %w(--with-brewed-curl --with-brewed-openssl --with-gettext --with-pcre).shelljoin
end

remote_file "#{Dir.home}/.gitignore_global"
execute "git config --global core.excludesfile ~/.gitignore_global" do
  not_if %w(git config --global --get core.excludesfile).shelljoin
end

remote_file "#{Dir.home}/.gitattributes_global"
execute "git config --global core.attributesfile ~/.gitattributes_global" do
  not_if %w(git config --global --get core.attributesfile).shelljoin
end

remote_file "#{Dir.home}/.hgignore_global"
package "mercurial"

remote_file "#{Dir.home}/.tigrc"
package "tig"

brew_tap "tcnksm/ghr"
package "ghr"

%w(
  gibo
  hub
  gist
  bazaar
).each { |pkg| package pkg }
