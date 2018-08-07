####################
# Language support #
####################

# Load local language configuration, if confirmed
if ask "Load languages?" N; then
  # Source node, python, and ruby
  for language in "node" "python" "ruby"; do
    local language_loc="$DOTFILES/$language.d"
    source_dir $language_loc
  done
  source $HOME/.languagerc
fi
