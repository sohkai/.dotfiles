####################
# Language support #
####################

# Source node, python, and ruby configurations
for language in "node" "python" "ruby"; do
  local language_loc="$DOTFILES/$language.d"
  source_dir $language_loc
done

# Load local language configuration
source $HOME/.languagerc
