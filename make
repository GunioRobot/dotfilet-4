#!/bin/zsh

cp dot.gemrc $HOME/.gemrc
cp dot.gitconfig $HOME/.gitconfig
cp dot.screenrc $HOME/.screenrc
cp dot.rspec $HOME/.rspec
cp dot.vimrc $HOME/.vimrc
cp dot.zshrc $HOME/.zshrc

VIM_HOME=$HOME/.vim
if [ ! -f $VIM_HOME ]; then
    mkdir $VIM_HOME
    mkdir $VIM_HOME/autoload
    mkdir $VIM_HOME/doc
    mkdir $VIM_HOME/plugin
fi

cp dot.vim/autoload/* $HOME/.vim/autoload
cp dot.vim/doc/* $HOME/.vim/doc
cp dot.vim/plugin/* $HOME/.vim/plugin

source $HOME/.zshrc
