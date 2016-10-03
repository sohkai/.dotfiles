# FIXME: maybe look at using prezto's aliases instead (see git, utility)
alias vim="mvim -v"
alias gvim="mvim"

##### Git (also see Prezto's git module and bash/.alias) #####
alias gcma='gca -m'
alias giai='gia --interactive'
alias gll="git log --pretty=format:'%C(yellow)%h|%Cred%ad|%Cblue%an|%Cgreen%d %Creset%s' --date=short | column -ts'|' | less -rX"
alias glgp="git log --graph --pretty=format:'%C(yellow)%h %Cred%ad %Cblue%an %Cgreen%d %Creset%s' --date=short --abbrev-commit"
unalias grc 2>/dev/null # We want the brewed 'grc'
alias grC='git rebase --continue' # Note that is the same as the the default 'grc'


##### Misc #####
# Directory movement
alias dirs='dirs -v'
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ......="cd ../../../../.."
alias cd..="cd .."
alias mkdir="mkdir -pv"
alias r="ranger_cd"

# File search
alias ff="find . -iname" # Find file
alias ss="grep -rniEI" # Search string
alias ggs="git grep -niEI" # Search string respective to git

# Etc
alias rt="rmtrash" # Safe rm (to trash)
alias shist="history | grep"
alias psg="ps aux | grep -v grep | grep -i -e VSZ -e"
alias killps="sudo kill -9"
alias chrome="open -a 'Google Chrome'" # Only on OSX
alias serve="python -m http.server"

alias dockm="docker-machine"
alias dockc="docker-compose"
alias dmls="docker-machine ls"
alias dcps="docker-compose ps"


##### Pyenv-virtualenv #####
alias mkvirtualenv="pyenv virtualenv"
alias mkvenv="mkvirtualenv"
alias lsvirtualenv="pyenv virtualenvs"
alias lsvenv="lsvirtualenv"
alias rmvirtualenv="pyenv uninstall"
alias rmvenv="rmvirtualenv"
alias workon="pyenv activate"
alias stopwork="pyenv deactivate"
