####################
# External plugins #
####################

eval "$(direnv hook bash)" # direnv setup
source_file $DOTFILES/modules/grc/grc.bashrc # grc setup

if is_osx; then
    source_file $HOME/.iterm2_shell_integration.bash # iTerm shell integration
fi
