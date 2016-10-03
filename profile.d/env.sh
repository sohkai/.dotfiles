########################
# Environment settings #
########################

# Set language
if [[ -z "$LANG" ]]; then
  export LANG='en_US.UTF-8'
fi

# Colour
export CLICOLOR=1 # ls colourful
export GREP_OPTIONS='--color=auto' # grep colourful

# Editor
export EDITOR="vim -f"

# Pager
export PAGER='less'
export LESS='-F -g -i -M -R -S -w -X -z-4'

# Docker
export MACHINE_DRIVER=virtualbox

# Utilities
export ANDROID_HOME=~/Development/androidSDK # Android SDK
export ANSIWEATHERRC=~/.dotfiles/profile.d/ansiweatherrc # Ansiweather
