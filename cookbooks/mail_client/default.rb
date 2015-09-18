package "mutt" do
  options "--with-confirm-attachment-patch --with-trash-patch --with-debug"
end

%w(
  fetchmail
  msmtp
  urlview
).each { |pkg| package pkg }

directory "#{Dir.home}/mail" do
  mode "0700"
end

directory "#{Dir.home}/.mutt" do
  mode "0700"
end

file "#{Dir.home}/.mutt/muttrc" do
  mode "0600"
end

git "#{Dir.home}/.mutt/mutt-colors-solarized" do
  repository "https://github.com/altercation/mutt-colors-solarized"
  revision "master"
end

file "#{Dir.home}/.msmtprc" do
  mode "0600"
end

file "#{Dir.home}/.fetchmailrc" do
  mode "0600"
end

file "#{Dir.home}/.procmailrc" do
  mode "0600"
end
