#!/bin/sh

if expr "$OSTYPE" : "^darwin" >/dev/null; then
  echo installing rbenv...
  cd ~
else
  exit 1
fi

if [ -d ~/.rbenv ]; then
  exit 1
fi

mkdir -p ~/.rbenv/plugins

git clone https://github.com/sstephenson/rbenv.git ~/.rbenv
git clone https://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build
git clone https://github.com/sstephenson/rbenv-default-gems.git ~/.rbenv/plugins/rbenv-default-gems
git clone https://github.com/sstephenson/rbenv-gem-rehash.git ~/.rbenv/plugins/rbenv-gem-rehash

cd ~/.rbenv
touch default-gems
echo <<EOF > default-gems 
bundler
pry
pry-theme
awesome_print
hirb
EOF

echo done.
