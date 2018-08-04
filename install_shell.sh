#!/bin/bash

###############
# Shell setup #
###############

echo "Setting tmux up..."
echo

if is_osx; then
    echo "Installing tmux through brew..."
    echo
    brew install tmux
else
    echo "Can't automatically install tmux for the current OS."
    echo
fi

# Install tpm
git clone https://github.com/tmux-plugins/tpm $HOME/.tmux/plugins/tpm

echo "Setting zsh up..."
echo

if is_osx; then
    echo "Installing zsh through brew..."
    echo
    brew install zsh zsh-completions
    curl -L https://iterm2.com/misc/zsh_startup.in -o $HOME/.iterm2_shell_integration.zsh
else
    echo "Can't automatically install zsh for the current OS. Please visit https://gist.github.com/derhuerst/12a1558a4b408b3b2b6e for manual instructions."
    echo
fi

# Install zim
git clone --recursive https://github.com/zimfw/zimfw.git ${ZDOTDIR:-${HOME}}/.zim

# Install zplug
curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh
