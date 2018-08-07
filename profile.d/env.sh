########################
# Environment settings #
########################

# Set language
if [[ -z "$LANG" ]]; then
  export LANG='en_US.UTF-8'
fi

# Colour
export CLICOLOR=1 # ls colourful

# Editor
export EDITOR="vim -f"

# FZF
export FZF_DEFAULT_COMMAND='fd --type file --follow --hidden --exclude .git --color=always'
export FZF_DEFAULT_OPTS="--reverse --height 40% --ansi"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_CTRL_T_OPTS="--select-1 --exit-0"

# GPG
export GPG_TTY=$(tty)

# Pager
export PAGER='less'
export LESS='-F -g -i -M -R -S -w -X -z-4'

# Utilities
export ANSIWEATHERRC=$DOTFILES/profile.d/ansiweatherrc # Ansiweather
