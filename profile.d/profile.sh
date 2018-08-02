##### FIRST THINGS FIRST #####

# Gotta get mai fortune cookiez
if type fortune &> /dev/null ; then
    if [[ -t 0 || -t 1 ]]; then
        fortune -s
        echo
    fi
fi


############
# Autoload #
############

source_dir $HOME/.dotfiles/docker.d
source_dir $HOME/.dotfiles/git.d
source_dir $HOME/.dotfiles/homebrew.d
source_dir $HOME/.dotfiles/tmux.d
source_dir $HOME/.dotfiles/vim.d

# Check if we should load OSX-specific files
if is_osx; then
    source_dir $HOME/.dotfiles/osx.d
fi
