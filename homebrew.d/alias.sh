##############################################################################
#                                    Aliases                                 #
# (see https://github.com/sorin-ionescu/prezto/tree/master/modules/homebrew) #
##############################################################################

# No point doing anything else if we're not on OSX
if [[ "$OSTYPE" != darwin* ]]; then
  return 1
fi

alias brewc='brew cleanup'
alias brewC='brew cleanup --force'
alias brewi='brew install'
alias brewl='brew list'
alias brews='brew search'
alias brewu='brew update && brew upgrade --all'
alias brewx='brew remove'

# Cask
alias cask='brew cask'
alias caskc='brew cask cleanup --outdated'
alias caskC='brew cask cleanup'
alias caski='brew cask install'
alias caskl='brew cask list'
alias casks='brew cask search'
alias caskx='brew cask uninstall'
