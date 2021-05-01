##### FIRST THINGS FIRST #####

# Gotta get mai fortune cookiez
if is_defined fortune ; then
    fortune -s
    echo
fi

##########
# Themes #
##########

# Base16 Shell
BASE16_SHELL="$HOME/.config/base16-shell/"
[ -n "$PS1" ] && \
    [ -s "$BASE16_SHELL/profile_helper.sh" ] && \
        eval "$("$BASE16_SHELL/profile_helper.sh")"


############
# Autoload #
############

source_dir $DOTFILES/git.d
source_dir $DOTFILES/tmux.d
source_dir $DOTFILES/vim.d

# Check if we should load OSX-specific files
if is_osx; then
    source_dir $DOTFILES/osx.d
fi
