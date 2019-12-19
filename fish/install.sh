#!/bin/sh

fish_config_file=~/.config/fish

mkdir -p ~/.config/

if [ ! -L "$fish_config_file" ]; then
  ln -s ~/.dotfiles/fish/fish.symlink "$fish_config_file"
fi
