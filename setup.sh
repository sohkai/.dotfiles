#!/bin/bash

##### SYS UTILS #####

# Install brew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew doctor

# Install dupes for OSX packages
brew tap homebrew/dupes

# Install cask for OSX apps
brew tap caskroom/cask

# Get some nice brews
brew install --default-names findutils gnu-sed gnu-tar gnu-which gnutls grep

# FIXME: LIST MORE!!! (And Casks)
brew install ack ag ansiweather autoenv bash binutils colordiff colormake \
             coreutils curl diff-so-fancy diffutils erlang ffmpeg fasd \
             gifsicle git git-extras git-lfs gnupg2 gpg go gzip heroku \
             heroku-toolbelt htop imagemagick mercurial mongodb nmap openssl \
             perl pgcli postgresql pyenv pyenv-virtualenv rename rmtrash tmux \
             watch wdiff wifi-password wget vim zsh zsh-completions

# Override system vim with macvim
brew install macvim --env-std --with-override-system-vim

brew cask install chrome-devtools dockertoolbox firefox github-desktop \
                  google-chrome grandperspective iterm2 skype steam xquartz

# Link brewed apps to /Applications
brew linkapps

# Install iTerm shell integration
curl -L https://iterm2.com/misc/bash_startup.in -o ~/.iterm2_shell_integration.bash
curl -L https://iterm2.com/misc/zsh_startup.in -o ~/.iterm2_shell_integration.zsh


##### Languages #####

# Node.js (and NVM)
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.31.7/install.sh | bash
# FIXME: double check that this will install nvm and source it
nvm install node
nvm use node
npm install -g commitizen devtool greenkeeper jsonlint node-debug np \
               npm-check-updates npm-user-validate webpack-bundle-size-analyzer

# Python (and Pyenv)
echo 'eval "$(pyenv init -)"' >> ~/.bash_profile
exec $SHELL
pyenv install 2.7.12
pyenv install 3.5.2
pyenv global 3.5.2

pip install ipython restview twine virtualenv

# Ruby (and RVM)
gpg --keyserver hkp://keys.gnupg.net --recv-keys D39DC0E3
curl -sSL https://get.rvm.io | bash -s stable
rvm install ruby --latest

gem install lolcat screengif travis


##### Shells #####

# Set Zsh to be the default shell
chsh -s /bin/zsh

# Zsh Prezto
git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"

# Install tpm
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm


##### Dotfiles #####

# FIXME

# Git settings
ssh-keygen -t rsa -C "qisheng.brett.sun@gmail.com"

# Copy ssh key to github.com
# FIXME echo some more messages
echo ~/.ssh/id_rsa.pub

ssh -T git@github.com # Test connection

# FIXME move these settings to gitconfig
# FIXME double check settings
git config --global user.name "Brett Sun"
git config --global user.email "qisheng.brett.sun@gmail.com"
git config --global github.user sohkai
# FIXME echo for token
git config --global github.token your_token_here

git config --global core.editor "vim"
git config --global color.ui true


##### Set up user #####

mkdir ~/Development

# Install tpm plugins
source .tmux/plugins/tpm/scripts/variables.sh && ~/.tmux/plugins/tpm/bin/install_plugins
