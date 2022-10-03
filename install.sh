#!/bin/bash

# Install tpm if necessary
if [ ! -d ~/.tmux/plugins/tpm ]; then
    echo "Installing tpm..."
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi

# Install antigen/oh-my-zsh
if [ ! -f ~/antigen/antigen.zsh ]; then
    git clone https://github.com/zsh-users/antigen.git ~/antigen
fi

# Dotfile installer
ln -sf ~/dotfiles/zshrc ~/.zshrc
ln -sf ~/dotfiles/vimrc ~/.vimrc
if [ ! -d ~/.config/nvim ]; then
    mkdir ~/.config/nvim
    git clone https://github.com/NvChad/NvChad ~/.config/nvim --depth 1
fi
ln -sf ~/dotfiles/init.vim ~/.config/nvim/init.vim
if [ -d ~/vim ]; then
    rm -rf ~/.vim
fi
ln -sf ~/dotfiles/vim ~/.vim
ln -sf ~/dotfiles/editorconfig ~/.editorconfig
ln -sf ~/dotfiles/tmux.conf ~/.tmux.conf
ln -sf ~/dotfiles/latexmkrc ~/.latexmkrc
