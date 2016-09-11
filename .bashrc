##### Autoload #####
# Source paths, environment variables, aliases, and functions
[[ -r shell/.path ]] && . shell/.path
[[ -r shell/.profile_env ]] && . shell/.profile_env
[[ -r shell/.alias ]] && . shell/.alias
[[ -r shell/.function ]] && . shell/.function

# iTerm shell integration
[[ -r ~/.iterm2_shell_integration.bash ]] && . ~/.iterm2_shell_integration.bash

# Scripts
[[ -r shell/bash/tab.bash ]] && . shell/bash/tab.bash # OSX new tab



##### Aliases #####
alias resource="source ~/.bash_profile"


##### Key bindings #####
bind "\C-j menu-complete" # Forward cycle through completions
bind "\C-k menu-complete-backward" # Backward cycle through completions


##### Completion #####
[[ -r shell/bash/.git-completion.bash ]] && . shell/bash/.git-completion.bash # git


##### History #####
export HISTCONTROL=ignoredups
export HISTTIMEFORMAT='%F %T '

stty -ixon # disable XON/XOFF flow control for <C-S>
