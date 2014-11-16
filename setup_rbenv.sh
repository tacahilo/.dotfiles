#!/bin/bash

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
[ -d "$HOME/.rbenv" ] || {
    git clone https://github.com/sstephenson/rbenv.git $HOME/.rbenv
    mkdir $HOME/.rbenv/plugins
    git clone https://github.com/znz/rbenv-plug $HOME/.rbenv/plugins/rbenv-plug
}

plugins=(
    ruby-build
    rbenv-default-gems
    rbenv-gem-rehash
    rbenv-update
    gem-src
)
for item in ${plugins[@]}; do
  rbenv plug $item
done


# set default-gems
cat <<EOF > $HOME/.rbenv/default-gems
artii
awesome_print
bundler
debugger
hirb
hirb-unicode
ipaddress
mgem
pry
pry-theme
puppet
puppet-lint
reek
rubocop
sheet
sup
wirb
EOF


cat <<'EOF'

    _          __                       _
 .-| |-.      |  ]                   .-| |-.
 \     /  .--.| | .--.  _ .--. .---. \     /
|_     _/ /'`\' / .'`\ [ `.-. / /__\|_     _|
 /     \| \__/  | \__. || | | | \__.,/     \
 '-|_|-' '.__.;__'.__.'[___||__'.__.''-|_|-'

EOF
