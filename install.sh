#!/bin/bash
# Install tpm if necessary
if [ ! -d ~/.tmux/plugins/tpm ]; then
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi

# Install oh my zsh!
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
curl -L git.io/antigen > antigen.zsh

# Install antigen
git clone https://github.com/zsh-users/antigen.git ~/antigen

# Dotfile installer
ln -sf ~/dotfiles/zshrc ~/.zshrc
ln -sf ~/dotfiles.vimrc ~/.vimrc
ln -sf ~/dotfiles/vim ~/.vim
ln -sf ~/dotfiles/tmux.conf ~/.tmux.conf
ln -sf ~/dotfiles/latexmkrc ~/.latexmkrc