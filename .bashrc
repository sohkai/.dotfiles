##### Autoload #####
# Source paths, environment variables, aliases, and functions
[[ -r ~/.dotfiles/shell/.path ]] && . ~/.dotfiles/shell/.path
[[ -r ~/.dotfiles/shell/.profile_env ]] && . ~/.dotfiles/shell/.profile_env
[[ -r ~/.dotfiles/shell/.alias ]] && . ~/.dotfiles/shell/.alias
[[ -r ~/.dotfiles/shell/.function ]] && . ~/.dotfiles/shell/.function

# iTerm shell integration
[[ -r ~/.iterm2_shell_integration.bash ]] && . ~/.iterm2_shell_integration.bash

# Scripts
[[ -r $(brew --prefix autoenv)/activate.sh ]] && . $(brew --prefix autoenv)/activate.sh # autoenv
[[ -r ~/.dotfiles/shell/bash/tab.bash ]] && . ~/.dotfiles/shell/bash/tab.bash # OSX new tab

# Language version managers
[ -r "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" # NVM
[ -r "$HOME/.rvm/scripts/rvm" ] && . "$HOME/.rvm/scripts/rvm" # RVM
eval "$(pyenv init -)" # Pyenv
[ -r "/usr/local/bin/virtualenvwrapper.sh" ] && . "/usr/local/bin/virtualenvwrapper.sh" # virtualenvwrapper


##### Aliases #####
alias resource="source ~/.bash_profile"


##### Key bindings #####
bind "\C-j menu-complete" # Forward cycle through completions
bind "\C-k menu-complete-backward" # Backward cycle through completions


##### Completion #####
[[ -r ~/.dotfiles/shell/bash/.git-completion.bash ]] && . ~/.dotfiles/shell/bash/.git-completion.bash # git
[[ -r $NVM_DIR/bash_completion ]] && . $NVM_DIR/bash_completion # NVM
[[ -r ~/.pyenv/completions/pyenv.bash ]] && . ~/.pyenv/completions/pyenv.bash # Pyenv


##### History #####
export HISTCONTROL=ignoredups
export HISTTIMEFORMAT='%F %T '

stty -ixon # disable XON/XOFF flow control for <C-S>
