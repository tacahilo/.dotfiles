%w(
  autoconf
  automake
  gzip
  coreutils
  parallel
  gpg2
).each { |pkg| package pkg }

%w(
  gnu-sed
  gnu-tar
  grep
).each do |pkg|
  package pkg do
    options "--with-default-names"
  end
end
