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

# Pager
export PAGER='less'
export LESS='-F -g -i -M -R -S -w -X -z-4'

# Utilities
export ANSIWEATHERRC=$DOTFILES/profile.d/ansiweatherrc # Ansiweather
