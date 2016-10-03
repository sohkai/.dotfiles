##### Misc #####
# Set language
if [[ -z "$LANG" ]]; then
  export LANG='en_US.UTF-8'
fi

export CLICOLOR=1 # ls colourful
export GREP_OPTIONS='--color=auto' # grep colourful

# Editor
export EDITOR="vim -f"

# Pager
export PAGER='less'
export LESS='-F -g -i -M -R -S -w -X -z-4'


##### Non built-ins #####
# Docker settings
export MACHINE_DRIVER=virtualbox


##### Android #####
export ANDROID_HOME=~/Development/androidSDK


##### Ansiweather#####
export ANSIWEATHERRC=~/.dotfiles/profile.d/ansiweatherrc


##### Node #####
export NVM_DIR="${HOME}/.nvm"

