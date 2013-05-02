# 言語設定
export LANG=ja_JP.UTF-8
export SHELL=/usr/local/bin/zsh
# カラー設定
export LSCOLORS=ExFxCxdxBxegedabagacad
export LS_COLORS='di=01;34:ln=01;35:so=01;32:ex=01;31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
# gnuplot等のグラフ出力先をX11に指定
export GNUTERM=x11
# Homebrew用PATH指定
export PATH=/usr/local/bin:/usr/local/sbin:/usr/local/share:$PATH
# TeXLive用PATH指定
export PATH=/usr/local/texlive/2012/bin/x86_64-darwin:$PATH
# Cabal(Haskell)用設定
export PATH=$HOME/.cabal/bin:$PATH

# rbenv用設定
export PATH=$HOME/.rbenv/shims:$PATH
# NODEBREW用PATH指定
export PATH=$HOME/.nodebrew/current/bin:$PATH
export NODEBREW_ROOT=$HOME/.nodebrew
# JAVA用PATH指定
export JAVA_HOME=/System/Library/Java/JavaVirtualMachines/1.6.0.jdk/Contents/Home
# PYTHON用設定
export PYTHONPATH=$HOME/.pythonbrew/current:$(brew --prefix)/lib/python2.7/site-packages:$PYTHONPATH
export WORKON_HOME=$HOME/.virtualenvs
# perlbrev用環境設定
export PATH=$PATH:$HOME/perl5/perlbrew/bin/
