#!/bin/bash

#########
# Setup #
#########

# We'll be changing these for the installation... :)
shopt -s nullglob &> /dev/null # Expand no matches to empty string
shopt -s globstar &> /dev/null # Enable ** globbing in bash

# Utility function to recursively install into a given directory any files matching the given
# extension. Makes a back up of any existing files that will be replaced by appending ".bak" to
# their name.
#
# Args:
#     install_dir: Directory to install into
#     file_ext: File extension to match
#     install_cmd (optional): Command to use for installation. Defaults to "cp".
install_ext() {
    if [[ $# -ne 1 &&  $# -ne 2 && $# -ne 3 ]]; then
        return 1 # Return error if not given right arguments
    fi

    local install_dir="$1"
    local file_ext="$2"
    local install_cmd="${3:-cp}"

    for file_to_install in "$DOTFILES"/**/*."${file_ext}"; do
        base_file_name=${file_to_install##*/}
        file_dest="$install_dir"/."${base_file_name%.$file_ext}" # Prepend $install_dir, make it a dotfile, and strip the trailing file extension
        echo "Installing $file_dest"
        if [[ -e $file_dest ]]; then
            mv "$file_dest" "$file_dest".bak # Back up currently install configuration to .bak
            echo "  Original $file_dest has been backed up to $file_dest.bak"
        fi
        $install_cmd "$file_to_install" "$file_dest"
    done
}


################
# Installation #
################

# Install .local files
echo "Installing local dotfiles..."
echo
install_ext "$HOME" "local"

# Install .symlink files
echo "Installing symlinked files..."
echo
install_ext "$HOME" "symlink" "ln -s"

# Install some special files...
echo "Installing other (e.g. XDG-base ~/.config) files..."
echo
mkdir -p $HOME/.config/nvim/
cp "$DOTFILES"/vim.d/nvim.local.config $HOME/.config/nvim/init.vim


############
# Clean up #
############

# And now turn off our (probably) changed settings
shopt -u nullglob globstar &> /dev/null
