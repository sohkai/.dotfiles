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
    iina \
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
    tree \
    watch \
    wdiff \
    wifi-password \
    wget \
    vim \

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
    gpg-suite \
    grandperspective \
    iterm2 \
    karabiner-elements \
    keybase \
    linphone \
    little-snitch \
    macdown \
    macs-fan-control \
    mountain-duck \
    namebench \
    notion \
    numi \
    omnifocus \
    onyx \
    opera \
    paragon-ntfs \
    private-internet-access \
    rescuetime \
    rocket-chat \
    signal \
    skype \
    spectacle \
    steam \
    telegram \
    the-unarchiver \
    time-out \
    transmission \
    vimr \
    vlc \
    virtualbox \
    xquartz \
    zoomus \
    1password

# Override system vim with macvim
brew install macvim --with-override-system-vim
brew link --overwrite macvim

# Install iTerm shell integration
curl -L https://iterm2.com/misc/bash_startup.in -o $HOME/.iterm2_shell_integration.bash
