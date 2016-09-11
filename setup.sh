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

brew install ack autoenv bash binutils colordiff colormake coreutils curl \
             diffutils erlang ffmpeg fasd gifsicle git git-lfs gnupg2 gpg go \
             gzip heroku heroku-toolbelt htop imagemagick mercurial mongodb \
             nmap openssl perl pgcli postgresql python rename rmtrash tmux \
             watch wdiff wifi-password wget zsh zsh-completions

brew cask install chrome-devtools dockertoolbox firefox github-desktop \
                  google-chrome grandperspective iterm2 skype steam xquartz

# Install iTerm shell integration
curl -L https://iterm2.com/misc/bash_startup.in \ -o ~/.iterm2_shell_integration.bash
curl -L https://iterm2.com/misc/zsh_startup.in \ -o ~/.iterm2_shell_integration.zsh


##### Languages #####

# Node.js (and NVM)
npm install -g commitizen devtool greenkeeper jsonlint node-debug np \
               npm-check-updates npm-user-validate webpack-bundle-size-analyzer

# Python (and pyenv)
pip install ipython restview twine

# Ruby (and RVM)
gpg --keyserver hkp://keys.gnupg.net --recv-keys D39DC0E3
curl -sSL https://get.rvm.io | bash -s stable
rvm install ruby --latest

gem install lolcat screengif tmuxinator


##### Shells #####

# Set Zsh to be the default shell
chsh -s /bin/zsh

# Zsh Prezto
git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
