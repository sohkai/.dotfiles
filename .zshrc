##### Autoload #####
autoload -U compinit zcalc zsh-mime-setup
compinit
zsh-mime-setup

# Source Prezto
[[ -r "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]] && . ${ZDOTDIR:-$HOME}/.zprezto/init.zsh

# iTerm shell integration
[[ -r ~/.iterm2_shell_integration.zsh ]] && . ~/.iterm2_shell_integration.zsh

# Scripts
[[ -r $(brew --prefix autoenv)/activate.sh ]] && . $(brew --prefix autoenv)/activate.sh # autoenv

# Source paths, aliases, and functions
[[ -r ~/.dotfiles/shell/.path ]] && . ~/.dotfiles/shell/.path
[[ -r ~/.dotfiles/shell/.alias ]] && . ~/.dotfiles/shell/.alias
[[ -r ~/.dotfiles/shell/.function ]] && . ~/.dotfiles/shell/.function

# Note: Node, Python, and Ruby's version managers are automatically loaded from Prezto


##### Aliases #####
alias zresource="source ~/.zshrc"


##### Key bindings #####
bindkey -M viins '^R' history-incremental-search-backward
bindkey -M vicmd '^R' history-incremental-search-backward
bindkey -M viins '^S' history-incremental-search-forward
bindkey -M vicmd '^S' history-incremental-search-forward

bindkey -M vicmd "q" push-line # Reset the current prompt but save it for the next command
bindkey -M viins ' ' magic-space # Magic space completion for history


##### Misc #####
setopt VI # Vim key bindings
setopt RM_STAR_WAIT # Sanity check for rm *
setopt EXTENDED_GLOB # Use extended globbing
setopt NO_CASE_GLOB # Case insensitive glob
setopt RC_EXPAND_PARAM # Expand arrays
setopt IGNORE_EOF # Force 'exit' to logout
setopt COMPLETE_IN_WORD # Tab complete in word

KEYTIMEOUT=1 # Shorten vi mode delay


##### Completion #####
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}' # Case insensitive
zstyle ':completion:*:killall:*' command 'ps -u $USER -o cmd' # Better killall completion
zstyle ':completion:*' verbose yes
[[ -r ~/.pyenv/completions/pyenv.zsh ]] && . ~/.pyenv/completions/pyenv.zsh # Pyenv


##### History #####
SAVEHIST=10000
HISTSIZE=10000

setopt EXTENDED_HISTORY # Save the time and how long a command ran
setopt APPEND_HISTORY # Don't overwrite history
setopt SHARE_HISTORY # Share history between multiple shells
setopt HIST_IGNORE_DUPS # Ignore duplicates
setopt HIST_IGNORE_ALL_DUPS # Account for inbetween commands when ignoring duplicates
setopt HIST_REDUCE_BLANKS
setopt HIST_VERIFY # When using a hist thing, make a newline show the change before executing it.
setopt HIST_SAVE_NO_DUPS
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_FIND_NO_DUPS


##### Non built-ins #####
VIRTUAL_ENV_DISABLE_PROMPT=0 # Keep virtualenv prompt
