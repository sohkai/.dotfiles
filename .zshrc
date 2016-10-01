##### FIRST THINGS FIRST #####

# Print a random, hopefully interesting, adage.
if (( $+commands[fortune] )); then
  if [[ -t 0 || -t 1 ]]; then
    fortune -s
    print
  fi
fi


##### Autoload #####

# Load zplug and plugins
[[ -r ~/.zplug/init.zsh ]] && . ~/.zplug/init.zsh
zplug "eventi/noreallyjustfuckingstopalready"

autoload -U zcalc zsh-mime-setup
zsh-mime-setup

# Source Zim
[[ -r "${ZDOTDIR:-$HOME}/.zim/init.zsh" ]] && . ${ZDOTDIR:-$HOME}/.zim/init.zsh

# iTerm shell integration
[[ -r ~/.iterm2_shell_integration.zsh ]] && . ~/.iterm2_shell_integration.zsh

# Scripts
[[ -r ~/.dotfiles/modules/grc/grc.zsh ]] && . ~/.dotfiles/modules/grc/grc.zsh # grc

# Source aliases, functions, and shell plugins
[[ -r ~/.dotfiles/shell/.alias ]] && . ~/.dotfiles/shell/.alias
[[ -r ~/.dotfiles/shell/zsh/.alias ]] && . ~/.dotfiles/shell/zsh/.alias
[[ -r ~/.dotfiles/shell/.function ]] && . ~/.dotfiles/shell/.function
[[ -r ~/.dotfiles/shell/.plugin ]] && . ~/.dotfiles/shell/.plugin

# Language version managers
[[ -r "$NVM_DIR/nvm.sh" ]] && . "$NVM_DIR/nvm.sh" # NVM
[[ -r "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm" # RVM
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)" # Pyenv-virtualenv


##### Aliases #####
alias resource="source ~/.zshrc && source ~/.zshenv"


##### Key bindings #####
bindkey -M viins '^F' vi-forward-word
bindkey -M viins '^E' vi-add-eol
bindkey -M viins '^R' history-incremental-search-backward
bindkey -M vicmd '^R' history-incremental-search-backward
bindkey -M viins '^S' history-incremental-search-forward
bindkey -M vicmd '^S' history-incremental-search-forward

bindkey -M vicmd 'q' push-line # Reset the current prompt but save it for the next command
bindkey -M viins ' ' magic-space # Magic space completion for history

# Requires history-substring-search
is_defined history-substring-search-up && bindkey -M vicmd 'k' history-substring-search-up
is_defined history-substring-search-down && bindkey -M vicmd 'j' history-substring-search-down

##### Misc #####
setopt VI # Vim key bindings
setopt CORRECT # Correct commands
setopt RM_STAR_WAIT # Sanity check for rm *
setopt EXTENDED_GLOB # Use extended globbing
setopt NO_CASE_GLOB # Case insensitive glob
setopt RC_EXPAND_PARAM # Expand arrays
setopt IGNORE_EOF # Force 'exit' to logout
setopt COMPLETE_IN_WORD # Tab complete in word
unsetopt COMPLETE_ALIASES # Don't expand aliases to allow for completion after aliases

KEYTIMEOUT=1 # Shorten vi mode delay


##### Completion #####
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}' # Case insensitive
zstyle ':completion:*:killall:*' command 'ps -u $USER -o cmd' # Better killall completion
zstyle ':completion:*' verbose yes
[[ -r ~/.pyenv/completions/pyenv.zsh ]] && . ~/.pyenv/completions/pyenv.zsh # Pyenv

# In case git completion ever gets slow, turn this on:
# function __git_files {
#   _wanted files expl 'local files' _files # Just use all files in the directory instead of being based on git status
# }


##### History #####
# See zim.history
setopt APPEND_HISTORY # Don't overwrite history
setopt HIST_REDUCE_BLANKS


##### Non built-ins #####


##### Zplug loading #####
#
# Install packages that have not been installed yet
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    else
        echo
    fi
fi

zplug load
