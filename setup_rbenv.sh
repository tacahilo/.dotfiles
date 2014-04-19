#!/bin/sh

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

# install rbenv
git clone https://github.com/sstephenson/rbenv.git $HOME/.rbenv

# install plugins
mkdir $HOME/.rbenv/plugins
git clone https://github.com/znz/rbenv-plug $HOME/.rbenv/plugins/rbenv-plug

plugins=(
    ruby-build
    rbenv-default-gems
    rbenv-gem-rehash
    rbenv-update
)
for item in ${plugins[@]}
do
  rbenv plug $item
done

# set default-gems
cat <<EOF > $HOME/.rbenv/default-gems
artii
awesome_print
bundler
hirb
hirb-unicode
pry
pry-theme
puppet-lint
sup
EOF

cat <<'EOF'

    _          __                       _
 .-| |-.      |  ]                   .-| |-.
 \     /  .--.| | .--.  _ .--. .---. \     /
|_     _/ /'`\' / .'`\ [ `.-. / /__\|_     _|
 /     \| \__/  | \__. || | | | \__.,/     \
 '-|_|-' '.__.;__'.__.'[___||__'.__.''-|_|-'

EOF
