####################
# External plugins #
####################

source_file /usr/local/opt/autoenv/activate.sh # Autoenv

# macOS plugins
if is_osx; then
    source_file $DOTFILES/profile.d/external/tab.sh # OSX new tab
fi
