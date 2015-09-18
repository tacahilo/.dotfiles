%w(
  fping
  hping
  httpie
  curl
  wget
).each { |pkg| package pkg }
