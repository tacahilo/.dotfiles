#!/bin/sh

for file in `find ~/.dotfiles -d 1 -name '.*' | grep -v '.git$' | sed "s/.*dotfiles\///g"`
do
    ln -is ~/.dotfiles/$file ~/$file
done
