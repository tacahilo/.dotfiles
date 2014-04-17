if [ -f $(brew --prefix)/etc/bash_completion ]; then
    . $(brew --prefix)/etc/bash_completion
fi
eval "$(rbenv init -)"

# added by travis gem
[ -f /Users/hfm/.travis/travis.sh ] && source /Users/hfm/.travis/travis.sh
