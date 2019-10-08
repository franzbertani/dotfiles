#!/bin/sh

mkdir -p ~/.config/

usage(){
    echo "Usage: $0 -lbox" 1>&2
    echo
    printf "OPTIONS\n"
    printf -- "-l to symlink dotfiles\n"
    printf -- "-b to install brew and brew cask software\n"
    printf -- "-o to setup oh-my-zsh\n"
    printf -- "-x to install command line tools\n"
    echo
    exit 1
}

setSymlink(){
    ln -s ~/.dotfiles/aliases  ~/.aliases
    ln -s ~/.dotfiles/zshrc  ~/.zshrc
    ln -s ~/.dotfiles/bash_profile  ~/.bash_profile
    ln -s ~/.dotfiles/global_ignore  ~/.global_ignore
    ln -s ~/.dotfiles/vimrc  ~/.vimrc
    ln -s ~/.dotfiles/tmux.conf  ~/.tmux.conf
}

installBrew(){
    echo '    Installing homebrew'
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    echo '    Install brew tools'
    brew install ctags gcc imagemagick neovim python tmux uncrustify vim wget zsh
    echo '    Install cask apps'
    brew cask install docker firefox font-fira-code iterm2 karabiner-elements keepassxc skim spotify syncthing-app vimr vlc
    echo '    Configure nvim'
    nvim/install.sh
}

cliTools(){
    xcode-select --install
    sudo xcodebuild -license accept
}

ohMyZsh(){
    echo '    Install ohmyzsh'
    sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
    ln -s ~/.dotfiles/mytheme.zsh-theme  ~/.oh-my-zsh/custom/themes/mytheme.zsh-theme
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
            o)
                ohMyZsh
                ;;
            x)
                cliTools
                ;;
            h|?)
                usage
                ;;
        esac
    done
}

setParameters "$@"
