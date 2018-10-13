#!/bin/bash

echo "Installing vim..."
echo

if is_osx; then
    brew install \
        neovim \
        vim

    # Override system vim with macvim
    brew install macvim --with-override-system-vim
    brew link --overwrite macvim
else
    echo "Can't automatically install vim and neovim for the current OS."
fi

# Set up backups directories
mkdir -p $HOME/.vim/.temp/
mkdir -p $HOME/.vim/.undo/

# Install neovim language providers
echo "Installing neovim providers..."
echo

npm install -g neovim
pip2 install --user neovim
pip3 install --user neovim
gem install neovim

echo "Installing dein..."
echo

curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh
sh ./installer.sh ~/.vim/dein
rm install.sh
