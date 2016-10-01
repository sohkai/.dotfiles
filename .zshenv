# Source path environment settings
[[ -r ~/.dotfiles/shell/.path ]] && . ~/.dotfiles/shell/.path
[[ -r ~/.dotfiles/shell/.profile_env ]] && . ~/.dotfiles/shell/.profile_env

# Add .fpath to $FPATH
[[ :$PATH: == *:$HOME/.fpath:* ]] || [ -d $HOME/.fpath ] && export FPATH=$FPATH:$HOME/.fpath
[[ :$PATH: == *:$HOME/.dotfiles/zsh/.fpath:* ]] || [ -d $HOME/.dotfiles/zsh/.fpath ] && export FPATH=$FPATH:$HOME/.dotfiles/zsh/.fpath
