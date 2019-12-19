#!/bin/sh

echo '    Installing clitools'
xcode-select --install
sudo xcodebuild -license accept

echo '    Installing homebrew'
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
echo '    Install brew tools'
[ -f ./brew_list ] && brew install $(awk '{printf("%s ",$1)}' ./brew_list)
echo '    Install cask apps'
[ -f ./brew_cask_list ] && brew install $(awk '{printf("%s ",$1)}' ./brew_cask_list)
echo '    Install universal-ctags'
brew install --HEAD universal-ctags/universal-ctags/universal-ctags

mkdir -p ~/.config/

ln -sf ~/.dotfiles/aliases  ~/.aliases
mkdir -p ~/.cache/zsh
ln -s ~/.dotfiles/zshrc  ~/.zshrc
ln -s ~/.dotfiles/bash_profile  ~/.bash_profile # just in case
ln -s ~/.dotfiles/global_ignore  ~/.global_ignore
ln -s ~/.dotfiles/tmux.conf  ~/.tmux.conf

mkdir -p ~/.config/kitty
ln -sfF ~/.dotfiles/kitty.conf  ~/.config/kitty/kitty.conf
nvim/install.sh
