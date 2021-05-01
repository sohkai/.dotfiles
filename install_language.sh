#!/bin/bash

##################
# Language setup #
##################

# Node.js (and NVM)
echo "Installing node through NVM..."
echo
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.37.2/install.sh | bash
source $HOME/.bashrc # This will be overwritten later, but we source it immediately to load nvm for this session

# Python (and Pyenv)
echo "Installing python through pyenv..."
echo
echo 'eval "$(pyenv init -)"' >> $HOME/.bash_profile # This will be overwritten later, just update it now to install global python packages
source $HOME/.bash_profile
# On newer macOS versions, you may need to include these flags on install:
#   CFLAGS="-L$(brew --prefix zlib)/include -L$(brew --prefix bzip2)/include" LDFLAGS="-L$(brew --prefix zlib)/lib -L$(brew --prefix bzip2)/lib"
pyenv install 2.7.17
pyenv install 3.9.0
pyenv global 3.9.0 2.7.17

pip install --upgrade pip setuptools
pip2 install --upgrade pip setuptools

pip install --user \
    glances \
    ipython \
    restview \
    twine \
    virtualenv

# Ruby (and RVM)
echo "Installing ruby through rvm..."
echo
gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB
\curl -sSL https://get.rvm.io | bash -s stable --ruby
source $HOME/.bash_profile

gem install \
    ghi \
    lolcat \
    pry \
    screengif
