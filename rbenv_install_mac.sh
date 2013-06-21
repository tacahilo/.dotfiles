#!/bin/sh

if ! expr "$OSTYPE" : "^darwin" >/dev/null; then
  echo not OS X
  exit 1
fi

if [ -d ~/.rbenv ]; then
  echo ~/.rbenv already exists
  exit 1
fi

cat <<'EOF'

_____               _        __  __   _
|_   _|             / |_     [  |[  | (_)
  | |  _ .--.  .--.`| |-,--.  | | | | __  _ .--.  .--./)
  | | [ `.-. |( (`\]| |`'_\ : | | | |[  |[ `.-. |/ /'`\;
 _| |_ | | | | `'.'.| |// | |,| | | | | | | | | |\ \._//
|_____[___||__[\__) \__\'-;__[___[___[___[___||__.',__`
      [  |                                      ( ( __))
 _ .--.| |.--.  .---. _ .--. _   __
[ `/'`\| '/'`\ / /__\[ `.-. [ \ [  ]
 | |   |  \__/ | \__.,| | | |\ \/ _ _ _
[___] [__;.__.' '.__.[___||__]\__(_(_(_)

EOF

git clone https://github.com/sstephenson/rbenv.git ~/.rbenv
mkdir -p ~/.rbenv/plugins
git clone https://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build
git clone https://github.com/sstephenson/rbenv-default-gems.git ~/.rbenv/plugins/rbenv-default-gems
git clone https://github.com/sstephenson/rbenv-gem-rehash.git ~/.rbenv/plugins/rbenv-gem-rehash

cd ~/.rbenv
touch default-gems

cat <<EOF > default-gems
bundler
pry
pry-theme
awesome_print
hirb
EOF

cat <<'EOF'

    _          __                       _
 .-| |-.      |  ]                   .-| |-.
 \     /  .--.| | .--.  _ .--. .---. \     /
|_     _/ /'`\' / .'`\ [ `.-. / /__\|_     _|
 /     \| \__/  | \__. || | | | \__.,/     \
 '-|_|-' '.__.;__'.__.'[___||__'.__.''-|_|-'

EOF
