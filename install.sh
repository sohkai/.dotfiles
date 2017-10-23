#!/bin/bash

#######################
# System dependencies #
#######################

# Make me some homebrew!
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Install dupes for OSX packages
brew tap homebrew/dupes

# Install cask for OSX apps
brew tap caskroom/cask

# Get some nice brews
brew install --default-names findutils gnu-sed gnu-tar gnu-which gnutls grep

brew install ack ag ansiweather autoenv bash binutils colordiff colormake \
             coreutils curl diff-so-fancy diffutils erlang fasd ffmpeg fortune \
             fzf gifsicle git git-extras git-lfs gnupg2 gpg go grc gzip heroku \
             heroku-toolbelt htop hub imagemagick mercurial mongodb mtr nmap \
             openssl parallel perl pgcli postgresql pstree pyenv \
             pyenv-virtualenv ranger rename rmtrash tmux tree watch wdiff \
             wifi-password wget vim zsh zsh-completions

brew cask install anki arq beyond-compare charles chrome-devtools cyberduck \
                  discord dockertoolbox dropbox firefox flux franz gimp gitter \
                  github-desktop google-chrome google-drive grandperspective \
                  iterm2 keybase linphone macdown mountain-duck namebench opera \
                  private-internet-access resucetime sizeup slack skype steam \
                  transmission unrarx virtualbox xquartz xtrafinder

# Override system vim with macvim
brew install macvim --env-std --with-override-system-vim

# Install neovim
brew tap neovim/neovim
brew install neovim

# Link brewed apps to /Applications
brew linkapps

# Install iTerm shell integration
curl -L https://iterm2.com/misc/bash_startup.in -o ~/.iterm2_shell_integration.bash
curl -L https://iterm2.com/misc/zsh_startup.in -o ~/.iterm2_shell_integration.zsh


##################
# Language setup #
##################

# Node.js (and NVM)
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.31.7/install.sh | bash
# FIXME: double check that this will install nvm and source it
nvm install node
nvm use node

brew install yarn --without-node # Install yarn and use NVM's version

npm install -g commitizen devtool greenkeeper htmlhint jsonlint mancy node-debug np \
               npm-check-updates npm-user-validate webpack-bundle-size-analyzer

# Python (and Pyenv)
echo 'eval "$(pyenv init -)"' >> ~/.bash_profile # This will be overwritten after, just do it now to install global python packages
. ~/.bash_profile
pyenv install 2.7.12
pyenv install 3.5.2
pyenv global 3.5.2

pip install --user glances neovim ipython restview twine virtualenv

# Ruby (and RVM)
gpg --keyserver hkp://keys.gnupg.net --recv-keys D39DC0E3
curl -sSL https://get.rvm.io | bash -s stable
rvm install ruby --latest

gem install ghi lolcat pry screengif travis


###############
# Shell setup #
###############

# Set Zsh to be the default shell
chsh -s /bin/zsh

# Install zim
git clone --recursive https://github.com/Eriner/zim.git ${ZDOTDIR:-${HOME}}/.zim

# Install zplug
curl -sL zplug.sh/installer | zsh

# Install tpm
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm


##################
# Dotfiles setup #
##################

. ./install_dotfiles.sh


##############
# User setup #
##############

mkdir ~/Development
mkdir ~/Development/github

# Install tpm plugins (must be after .tmux.conf has been loaded)
source ~/.tmux/plugins/tpm/scripts/variables.sh && ~/.tmux/plugins/tpm/bin/install_plugins


###########################################################
# Manual configuration (left as an exercise for the user) #
###########################################################

# FIXME

# Git settings
ssh-keygen -t rsa -C "qisheng.brett.sun@gmail.com"

# Copy ssh key to github.com
# FIXME echo some more messages
echo ~/.ssh/id_rsa.pub

ssh -T git@github.com # Test connection
