package "git" do
  options %w(--with-brewed-curl --with-brewed-openssl --with-gettext --with-pcre).shelljoin
end

execute "tcnksm/ghr" do
  command "brew tap tcnksm/ghr"
  not_if %w(brew tap | grep -w -- 'tcnksm/ghr').shelljoin
end

%w(
  tig
  gibo

  hub
  gist
  ghr

  bazaar
  mercurial
).each { |pkg| package pkg }
