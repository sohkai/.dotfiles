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
# Dotfiles setup #
##################

echo "------------------------------"
echo "| Installing local dotfiles |"
echo "------------------------------"
echo
source ./install_dotfiles.sh

# Set up the environment to point to where the dotfiles are located
echo "export DOTFILES=$(pwd)" >> $HOME/.init_env


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

# Set Zsh to be the default shell

if [ -x /bin/zsh ]; then
    echo "------------------------"
    echo "| Setting up the shell |"
    echo "------------------------"
    echo
    echo "Setting zsh as the default shell..."

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
echo "  - Some homebrewed apps may require manual setup, please see the logs above"
echo "  - Please set up SSH keys for Github by visiting https://help.github.com/articles/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent/"
echo
