#########################################################################
#                               Aliases                                 #
# (see https://github.com/sorin-ionescu/prezto/tree/master/modules/osx) #
#########################################################################

# No point doing anything else if we're not on OSX
if [[ "$OSTYPE" != darwin* ]]; then
  return 1
fi

alias pbc='pbcopy' # Clipboard copy
alias pbp='pbpaste' # Clipboard paste
