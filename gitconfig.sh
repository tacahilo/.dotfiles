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
git config --global alias.a 'add -A'
git config --global alias.ap 'add -p'
git config --global alias.b 'branch -v'
git config --global alias.ca 'commit --amend'
git config --global alias.ci 'commit --verbose'
git config --global alias.cl 'clone --recursive'
git config --global alias.co checkout
git config --global alias.d diff
git config --global alias.dc 'diff --cached --ignore-space-change'
git config --global alias.f 'fetch --prune'
git config --global alias.l log
git config --global alias.lg 'log --graph --all'
git config --global alias.pl pull
git config --global alias.plo 'pull origin'
git config --global alias.plom 'pull origin master'
git config --global alias.po 'push origin'
git config --global alias.pom 'push origin master'
git config --global alias.ps 'push'
git config --global alias.push 'push --verbose'
git config --global alias.r 'remote -v'
git config --global alias.re 'reset'
git config --global alias.s 'status -sb'

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
