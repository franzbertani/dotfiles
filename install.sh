#!/bin/bash

dotfiles=(".vimrc")

dir="${HOME}/.dotfiles"

for dotfile in "${dotfiles[@]}"; do
    ln -sf "${dir}/${dotfile}" "${HOME}"
done
