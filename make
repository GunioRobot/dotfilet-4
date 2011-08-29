#!/bin/zsh

# Copy all dot.* files to home directory starts from '.'
for name in dot.*; do
  cp $name ~/${name#dot};
done

source ~/.zshrc
