require 'itamae/plugin/resource/brew_tap'

package "git" do
  options %w(--with-brewed-curl --with-brewed-openssl --with-gettext --with-pcre).shelljoin
end

%w(
  tig
  gibo

  hub
  gist

  bazaar
  mercurial
).each { |pkg| package pkg }

brew_tap "tcnksm/ghr"
package "ghr"
