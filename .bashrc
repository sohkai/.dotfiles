# Aliases
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ......="cd ../../../../.."

# Alias rmtrash instead of rm
alias rt="rmtrash"

# Move (or Add) /usr/local/bin to the front of the path 
[ -d /usr/local/bin ] && export PATH=$(echo /usr/local/bin:$PATH | sed -e 's;:/usr/local/bin;;')

# history settings
export HISTCONTROL=ignoredups
export HISTTIMEFORMAT='%F %T '

# macvim settings
vim='mvim -v' 
alias vim="${vim}" 
alias gvim="mvim" 
export EDITOR="${vim} -g --remote-tab-silent" 
export GIT_EDITOR="${vim} -g -f"

# terminal settings
export CLICOLOR=1   #ls colourful
export GREP_OPTIONS='--color=auto'   #grep colourful

# nvm settings
export NVM_DIR="/Users/brett/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
nvm use stable

# Android SDK settings
export PATH=${PATH}:/Users/brett/Development/Android\ SDK/sdk/platform-tools:/Users/brett/Development/Android\ SDK/sdk/tools
export ANDROID_HOME=/Users/brett/Development/Android\ SDK/sdk
