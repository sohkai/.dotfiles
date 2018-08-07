###########
# Aliases #
###########

# List directory
alias ls='ls -CF'
alias l='ls -1A'
alias ll='ls -lh'
alias lr='ll -R'
alias la='ll -A'
alias lm='la | "$PAGER"'
alias lx='ll -XB'
alias lk='ll -Sr'
alias lt='ll -tr'
alias lc='lt -c'
alias lu='lt -u'
alias sl='ls'

# Directory movement
alias dirs='dirs -v'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ......='cd ../../../../..'
alias cd..='cd ..'
alias po='popd'
alias pu='pushd'
alias r='ranger_cd'
alias cdgithub='cd $HOME/Development/github'

# File search
# alias ff='find . -iname' # Find file via builtin find
alias ff='fd' # Find file recursively
alias ffe='fd -e' # Find file recursively via extension
alias ffa='fd -HI' # Find all files, including hidden and ignored

alias ss='grep -rniEI --color=auto' # Search string
alias ggs='git grep -niEI --color=auto' # Search string respective to git

# Resources
alias top='htop'
alias df='df -kh'
alias du='du -kh'
alias psg='ps aux | grep -v grep | grep -i -e VSZ -e'
alias killps='sudo kill -9'

# Etc
alias _='sudo'
alias cp='cp -i'
alias e='$EDITOR'
alias ln='ln -i'
alias mkdir='mkdir -pv'
alias mv='mv -i'
alias p='$PAGER'
alias rm='rm -i'
alias t='type'
alias type='type -a'
alias rt='rmtrash' # Safe rm (to trash)
alias shist='history | grep'
alias o='open'
alias serve='python -m http.server'

# macOS aliases
if is_osx; then
    alias chrome="open -a 'Google Chrome'" # Only on OSX
fi
