####################
# External plugins #
####################

eval "$(direnv hook zsh)" # direnv setup
source_file $DOTFILES/modules/grc/grc.zsh # grc setup

if is_osx; then
    source_file $HOME/.iterm2_shell_integration.zsh # iTerm shell integration
fi
