#!/bin/bash

################
# Script setup #
################

# Get directory of where this install script is located
SHELL_NAME=$(ps -p $$ -ocomm=)
case "$SHELL_NAME" in
    *bash)
        SCRIPT_LOC=${BASH_SOURCE[0]}
        ;;
    *zsh)
        SCRIPT_LOC=${(%):-%N}
        ;;
    *)
        echo "install.sh must be run under either bash or zsh."
        exit 1
esac
DOTFILES_DIR=$(dirname $SCRIPT_LOC)

# Move to the root location of where the dotfiles repo was cloned to
cd $DOTFILES_DIR

# Source utilities
if [[ -d ./utility.d ]]; then
    for file in ./utility.d/*.sh; do
        source $file
    done
fi

# Make sure some particular files exist
touch $HOME/.bash_profile
touch $HOME/.bashrc

############
# OS setup #
############

if is_osx; then
    echo "-----------------------------------------"
    echo "| Installing dependencies for OSX/macOS |"
    echo "-----------------------------------------"
    echo
    source ./install_osx.sh
fi


##################
# Language setup #
##################

echo "------------------------------------"
echo "| Installing programming languages |"
echo "------------------------------------"
echo
source ./install_language.sh


##################
# Dotfiles setup #
##################

export DOTFILES=$(pwd)

echo "------------------------------"
echo "| Installing local dotfiles |"
echo "------------------------------"
echo
source ./install_dotfiles.sh

# Set up the environment to point to where the dotfiles are located
echo "export DOTFILES=$DOTFILES" >> $HOME/.init_env


##############
# User setup #
##############

echo "-----------------------"
echo "| Setting up the user |"
echo "-----------------------"
echo
echo "Creating local file structure..."
mkdir $HOME/Development
mkdir $HOME/Development/github

###############
# Shell setup #
###############

echo "------------------------"
echo "| Setting up the shell |"
echo "------------------------"
echo
source ./install_shell.sh

if [ -x /bin/zsh ]; then
    echo "Setting zsh as the default shell..."
    echo

    chsh -s /bin/zsh
fi


###########################################################
# Manual configuration (left as an exercise for the user) #
###########################################################

echo "-------------------------------------------------------------"
echo
echo "All done! Phew, thanks for waiting :)."
echo "There's a few manual steps left, that you'll need to finish by yourself:"
echo
echo "  - Please install the tmux plugins by invoking PREFIX+I (see https://github.com/tmux-plugins/tpm#installing-plugins)"
echo "  - Please set up your git user config (see https://help.github.com/articles/setting-your-username-in-git/)"
echo "  - Please set up SSH keys for Github by visiting https://help.github.com/articles/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent/"
echo "  - Please set up GPG keys for Github by visiting https://help.github.com/articles/signing-commits-with-gpg/"
if is_osx; then
    echo "  - Some macOS-specific manual setup:"
    echo "    - Some homebrewed apps may require manual setup, please see the logs above"
    echo "    - Set up Better Touch Tool to use the saved preferences at $DOTFILES/osx.d/bettertouchtool/ by importing the preferences"
    echo "    - Set up iterm2 to use the saved preferences at $DOTFILES/osx.d/iterm2/"
    echo "    - Set up karabiner to use the saved preferences at $DOTFILES/osx.d/karabiner/ by copying the folder into ~/.config/karabiner/"
    echo "    - Set up spectacle to use the saved preferences at $DOTFILES/osx.d/spectacle/ by copying the folder into ~/Library/Application\ Support/Spectacle/"
    echo "    - You might have to fix the patched Source Code Pro font using FontBook (see https://github.com/ryanoasis/nerd-fonts/issues/258)."
fi
echo
echo "Note that some of these changes require a logout/restart to take effect."
echo
