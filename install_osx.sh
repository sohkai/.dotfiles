#!/bin/bash

#######################
# System dependencies #
#######################

# Use some sane macOS system defaults
# Inspired by https://mths.be/macos
echo "Setting up system preferences..."
echo

# Close any open System Preferences panes, to prevent them from overriding
# settings we’re about to change
osascript -e 'tell application "System Preferences" to quit'

# Ask for the administrator password upfront
sudo -v


#################
# General UI/UX #
#################

# Disable transparency in the menu bar and elsewhere on Yosemite
defaults write com.apple.universalaccess reduceTransparency -bool true

# Always show scrollbars
defaults write NSGlobalDomain AppleShowScrollBars -string "WhenScrolling"

# Increase window resize speed for Cocoa applications
defaults write NSGlobalDomain NSWindowResizeTime -float 0.001

# Expand save panel by default
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode2 -bool true

# Expand print panel by default
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint -bool true
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint2 -bool true

# Automatically quit printer app once the print jobs complete
defaults write com.apple.print.PrintingPrefs "Quit When Finished" -bool true


##########
# Screen #
##########

# Require password immediately after sleep or screen saver begins
defaults write com.apple.screensaver askForPassword -int 1
defaults write com.apple.screensaver askForPasswordDelay -int 0

# Save screenshots to the desktop
defaults write com.apple.screencapture location -string "${HOME}/Desktop"

# Save screenshots in PNG format (other options: BMP, GIF, JPG, PDF, TIFF)
defaults write com.apple.screencapture type -string "png"

# Finder: show all filename extensions
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# Finder: show path bar
defaults write com.apple.finder ShowPathbar -bool true

# Keep folders on top when sorting by name
defaults write com.apple.finder _FXSortFoldersFirst -bool true

# Avoid creating .DS_Store files on network or USB volumes
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true

# Use column view in all Finder windows by default
# Four-letter codes for the other view modes: `icnv`, `Nlsv`, `Flwv`
defaults write com.apple.finder FXPreferredViewStyle -string "clmv"


####################################
# Dock, Dashboard, and hot corners #
####################################

# Disable Dashboard
defaults write com.apple.dashboard mcx-disabled -bool true

# Don’t show Dashboard as a Space
defaults write com.apple.dock dashboard-in-overlay -bool true

# Don’t automatically rearrange Spaces based on most recent use
defaults write com.apple.dock mru-spaces -bool false

# Automatically hide and show the Dock
defaults write com.apple.dock autohide -bool true

# Add a spacer to the left side of the Dock (where the applications are)
#defaults write com.apple.dock persistent-apps -array-add '{tile-data={}; tile-type="spacer-tile";}'
# Add a spacer to the right side of the Dock (where the Trash is)
#defaults write com.apple.dock persistent-others -array-add '{tile-data={}; tile-type="spacer-tile";}'
# Alternatively:
# touch FullSpace.dockspace
# touch HalfSpace.docksmallspace


###################
# Safari & WebKit #
###################

# Privacy: don’t send search queries to Apple
defaults write com.apple.Safari UniversalSearchEnabled -bool false
defaults write com.apple.Safari SuppressSearchSuggestions -bool true

# Enable “Do Not Track”
defaults write com.apple.Safari SendDoNotTrackHTTPHeader -bool true

# Set Safari’s home page to `about:blank` for faster loading
defaults write com.apple.Safari HomePage -string "about:blank"

# Enable Safari’s debug menu
defaults write com.apple.Safari IncludeInternalDebugMenu -bool true

# Enable the Develop menu and the Web Inspector in Safari
defaults write com.apple.Safari IncludeDevelopMenu -bool true
defaults write com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey -bool true
defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled -bool true

# Add a context menu item for showing the Web Inspector in web views
defaults write NSGlobalDomain WebKitDeveloperExtras -bool true


####################
# Activity Monitor #
####################

# Show the main window when launching Activity Monitor
defaults write com.apple.ActivityMonitor OpenMainWindow -bool true

# Show all processes in Activity Monitor
defaults write com.apple.ActivityMonitor ShowCategory -int 0

# Sort Activity Monitor results by CPU usage
defaults write com.apple.ActivityMonitor SortColumn -string "CPUUsage"
defaults write com.apple.ActivityMonitor SortDirection -int 0


##########
# Photos #
##########

# Prevent Photos from opening automatically when devices are plugged in
defaults -currentHost write com.apple.ImageCapture disableHotPlug -bool true


############
# Homebrew #
############

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
    locateme \
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
    haptic-touch-bar \
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

# Install custom taps
brew tap dteoh/sqa
brew cask install slowquitapps

defaults write com.dteoh.SlowQuitApps delay -int 1000

# Override system vim with macvim
brew install macvim --with-override-system-vim
brew link --overwrite macvim

# Install iTerm shell integration
curl -L https://iterm2.com/misc/bash_startup.in -o $HOME/.iterm2_shell_integration.bash
