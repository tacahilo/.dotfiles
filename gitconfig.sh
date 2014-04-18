#!/bin/sh

which git >&/dev/null
if [ $? -ne 0 ]; then
  echo not found git
  exit 1
fi

echo set user information
git config --global user.name "Takahiro OKUMURA"
git config --global user.email "hfm.garden@gmail.com"

echo set alias
git config --global alias.co checkout
git config --global alias.ci commit
git config --global alias.cl clone
git config --global alias.d diff
git config --global alias.s 'status -sb'
git config --global alias.r 'remote -v'
git config --global alias.b 'branch -v'
git config --global alias.f 'fetch --prune'
git config --global alias.l log
git config --global alias.lg 'log --graph --all'

echo set editor vim
git config --global core.editor vim
git config --global merge.tool vimdiff

echo set display
git config --global color.ui auto
git config --global alias.graph 'log --graph --decorate --oneline'
git config --global core.attributesfile ~/.gitattributes_global

echo set github
git config --global github.user Tacahilo
git config --global github.email hfm.garden@gmail.com

echo set push default
git config --global push.default simple

git config --list
