#!/bin/zsh

# TODO automatically cp dot.* to ~
cp dot.gemrc ~/.gemrc
cp dot.gitconfig ~/.gitconfig
cp dot.gitignore ~/.gitignore
cp dot.screenrc ~/.screenrc
cp dot.rspec ~/.rspec
cp dot.vimrc ~/.vimrc
cp dot.zshrc ~/.zshrc
cp dot.alias.zshrc ~/.alias.zshrc
cp dot.git.zshrc ~/.git.zshrc

source ~/.zshrc
