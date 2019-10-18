#!/bin/sh

mkdir -p ~/.config/

usage(){
    echo "Usage: $0 -lbox" 1>&2
    echo
    printf "OPTIONS\n"
    printf -- "-l to symlink dotfiles\n"
    printf -- "-b to install brew and brew cask software\n"
    printf -- "-x to install command line tools\n"
    echo
    exit 1
}

setSymlink(){
    ln -s ~/.dotfiles/aliases  ~/.aliases
    mkdir -p ~/.cache/zsh
    ln -s ~/.dotfiles/zshrc  ~/.zshrc
    ln -s ~/.dotfiles/bash_profile  ~/.bash_profile
    ln -s ~/.dotfiles/global_ignore  ~/.global_ignore
    ln -s ~/.dotfiles/vimrc  ~/.vimrc
    ln -s ~/.dotfiles/tmux.conf  ~/.tmux.conf
    mkdir -p ~/.config/kitty
    ln -sfF ~/.dotfiles/kitty.conf  ~/.config/kitty/kitty.conf
}

installBrew(){
    echo '    Installing homebrew'
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    echo '    Install brew tools'
    brew install ctags gcc imagemagick neovim python tmux uncrustify vim wget zsh
    echo '    Install cask apps'
    brew cask install docker firefox font-fira-code iterm2 karabiner-elements keepassxc skim spotify syncthing-app vimr vlc kitty
    echo '    Configure nvim'
    nvim/install.sh
}

cliTools(){
    xcode-select --install
    sudo xcodebuild -license accept
}

setParameters(){
    while getopts "lbox?h" o; do
        case "${o}" in
            l)
                setSymlink
                ;;
            b)
                installBrew
                ;;
            x)
                cliTools
                ;;
            *)
                usage
                ;;
        esac
    done
}

setParameters "$@"
