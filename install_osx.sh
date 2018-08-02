#!/bin/bash

#######################
# System dependencies #
#######################

# Make me some homebrew!
echo "Installing homebrew..."
echo
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Get some nice brews
brew install --with-default-names \
    findutils \
    gnu-sed \
    gnu-which \
    gnutls \
    grep

brew install \
    ack \
    ag \
    ansiweather \
    autoenv \
    bash \
    binutils \
    colordiff \
    colormake \
    coreutils \
    curl \
    diff-so-fancy \
    diffutils \
    docker-compose \
    docker-machine \
    erlang \
    fasd \
    ffmpeg \
    fortune \
    fzf \
    gifsicle \
    git \
    git-extras \
    git-lfs \
    gnupg2 \
    gnu-tar \
    gpg \
    go \
    grc \
    gzip \
    heroku \
    heroku-toolbelt \
    htop \
    hub \
    imagemagick \
    mercurial \
    mongodb \
    mtr \
    neovim \
    nmap \
    openssl \
    parallel \
    perl \
    pgcli \
    postgresql \
    pstree \
    pyenv \
    pyenv-virtualenv \
    ranger \
    reattach-to-user-namespace \
    rename \
    rmtrash \
    tmux \
    tree \
    watch \
    wdiff \
    wifi-password \
    wget \
    vim \
    zsh \
    zsh-completions

brew cask install \
    aegisub \
    anki \
    appcleaner \
    arq \
    bartender \
    bettertouchtool \
    beyond-compare \
    brave \
    charles \
    cheatsheet \
    chrome-devtools \
    chromium \
    cyberduck \
    discord \
    docker \
    dropbox \
    fantastical \
    firefox \
    flow \
    flux \
    forklift \
    franz \
    ganache \
    gimp \
    gitter \
    google-chrome \
    google-drive \
    gpgtools \
    grandperspective \
    iterm2 \
    keybase \
    linphone \
    little-snitch \
    macdown \
    macs-fan-control \
    mountain-duck \
    mpv \
    namebench \
    notion \
    numi \
    omnifocus \
    onyx \
    opera \
    paragon-ntfs \
    private-internet-access \
    resucetime \
    rocket-chat \
    signal \
    skype \
    spectacle \
    steam \
    telegram \
    time-out \
    transmission \
    unrarx \
    vimr \
    vlc \
    virtualbox \
    xquartz \
    xtrafinder \
    zoom

# Override system vim with macvim
brew install macvim --env-std --with-override-system-vim

# Link brewed apps to /Applications
brew linkapps

# Install iTerm shell integration
curl -L https://iterm2.com/misc/bash_startup.in -o $HOME/.iterm2_shell_integration.bash
curl -L https://iterm2.com/misc/zsh_startup.in -o $HOME/.iterm2_shell_integration.zsh


##################
# Language setup #
##################

# Node.js (and NVM)
echo "Installing node through NVM..."
echo
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh | bash
source $HOME/.bash_profile
nvm install stable
nvm use stable

brew install yarn --without-node # Install yarn and use NVM's version

npm install -g \
    commitizen \
    htmlhint \
    jsonlint \
    ndb \
    np \
    nps \
    npm-check-updates \
    react-devtools \
    @storybook/cli

# Python (and Pyenv)
echo "Installing python through pyenv..."
echo
echo 'eval "$(pyenv init -)"' >> $HOME/.bash_profile # This will be overwritten after, just do it now to install global python packages
source $HOME/.bash_profile
pyenv install 2.7.12
pyenv install 3.5.2
pyenv global 3.5.2 2.7.12

pip install --upgrade pip setuptools

pip install --user \
    glances \
    neovim \
    ipython \
    restview \
    twine \
    virtualenv

# Ruby (and RVM)
echo "Installing ruby through rvm..."
echo
gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB
\curl -sSL https://get.rvm.io | bash -s stable --ruby

gem install \
    ghi \
    lolcat \
    pry \
    screengif \
    travis


###############
# Shell setup #
###############

echo "Setting zsh up..."
echo

# Set Zsh to be the default shell
chsh -s /bin/zsh

# Install zim
git clone --recursive https://github.com/zimfw/zimfw.git ${ZDOTDIR:-${HOME}}/.zim

# Install zplug
brew install zplug

# Install tpm
git clone https://github.com/tmux-plugins/tpm $HOME/.tmux/plugins/tpm
