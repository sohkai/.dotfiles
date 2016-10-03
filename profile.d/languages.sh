####################
# Language support #
####################

# Source node, python, and ruby
for language in "node" "python" "ruby"; do
    local language_loc="$HOME/.dotfiles/$language.d"
    source_dir $language_loc
done
