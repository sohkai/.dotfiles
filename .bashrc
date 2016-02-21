# Terminal settings
export CLICOLOR=1                    # ls colourful
export GREP_OPTIONS='--color=auto'   # grep colourful

# Move (or Add) /usr/local/bin and /usr/local/sbin to the front of the path
[ -d /usr/local/bin ] && export PATH=$(echo /usr/local/bin:$PATH | sed -e 's;:/usr/local/bin;;')
[ -d /usr/local/sbin ] && export PATH=$(echo /usr/local/sbin:$PATH | sed -e 's;:/usr/local/sbin;;')

# Git bash completion
source ~/.dotfiles/.git-completion.bash

# Bindings
bind "\C-j menu-complete"           # Forward cycle through completions
bind "\C-k menu-complete-backward"  # Backward cycle through completions

# Aliases
alias +='pushd'
alias -- -='popd'
alias ?='dirs -v'
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ......="cd ../../../../.."
alias cd..="cd .."
alias ls="ls -CF"
alias sl="ls"
alias ll="ls -lhA"
alias mkdir="mkdir -pv"

alias shist="history | grep"

alias sf="find . -name "
alias ss="grep -rni"

alias psg="ps aux | grep -v grep | grep -i -e VSZ -e"
alias killps="sudo kill -9"

# Git aliases
alias gll="git log --pretty=format:'%C(yellow)%h|%Cred%ad|%Cblue%an|%Cgreen%d %Creset%s' --date=short | column -ts'|' | less -r"
alias gst="git status"
alias gs="git stash"
alias gsp="git stash pop"
alias gbr="git branch"
alias gbrup="git branch -u"
alias gch="git checkout"
alias gchbr="git checkout -b"

# Alias rmtrash instead of rm
alias rt="rmtrash"

# History settings
export HISTCONTROL=ignoredups
export HISTTIMEFORMAT='%F %T '

stty -ixon # disable XON/XOFF flow control for <C-S>

# Editor settings
vim='mvim -v'
alias vim="${vim}"
alias gvim="mvim"
export EDITOR="${vim} -f"
export GIT_EDITOR="${vim} -f"

# NVM settings
export NVM_DIR="${HOME}/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

# Functions
# Make a directory and cd into it
mkcd () {
    mkdir -p $1;
    cd $1;
}

# Open up man, OSX edition
# http://www.commandlinefu.com/commands/view/7581/rtfm-function#comment
rtfm() {
    help $@ || man $@ || open "http://www.google.com/search?q=$@";
}

# Random cool things from the internet:
#
# Remove all files except for specified one
# http://www.commandlinefu.com/commands/view/6652/remove-all-but-one-specific-file#comment
# rm -f !(survivior.txt)
#
# Make a directory and move into it
# http://www.commandlinefu.com/commands/view/9000/mkdir-cd-into-it-as-single-command#comment
# mkdir /home/foo/doc/bar && cd $_
#
# Rename a file extension
# http://www.commandlinefu.com/commands/view/1295/quickly-rename-a-file#comment
# mv filename.{old,new}
#
# Open Finder from the current Terminal location
# http://www.commandlinefu.com/commands/view/2395/open-finder-from-the-current-terminal-location#comment
# open .
#
# Start COMMAND, and kill it if still running after 5 seconds
# http://www.commandlinefu.com/commands/view/9721/start-command-and-kill-it-if-still-running-after-5-seconds#comment
# timeout 5s <COMMAND>
#
# Run last command (potentially as root)
# http://www.commandlinefu.com/commands/view/13/run-the-last-command-as-root#comment
# [sudo] !!
#
# Run previous command with changed arguments
# http://www.commandlinefu.com/commands/view/19/runs-previous-command-but-replacing#comment
# ^foo^bar    (changes first found match)
# ^foo^bar^:& (changes all found matches)
#
# Invoke editor to edit command
# http://www.commandlinefu.com/commands/view/1446/rapidly-invoke-an-editor-to-write-a-long-complex-or-tricky-command#comment
# ctrl-x e
# fc
# <Esc> v (in vim mode; ie. go out of insert mode and v)
#
# Use last argument of most recent command
# http://www.commandlinefu.com/commands/view/1551/place-the-argument-of-the-most-recent-command-on-the-shell#comment
# <Esc> _
# $_
#
# Delete and yank partial command
# http://www.commandlinefu.com/commands/view/6148/type-partial-command-kill-this-command-check-something-you-forgot-yank-the-command-resume-typing.#comment
# <ctrl+u> [...] <ctrl+y>
# <Esc> dd [...] p (in vim mode; ie. same yanking as usual)
#
# Show currently mounted file systems
# http://www.commandlinefu.com/commands/view/1556/currently-mounted-filesystems-in-nice-layout#comment
# mount | column -t
#
# Show external IP
# http://www.commandlinefu.com/commands/view/5427/get-your-external-ip-address#comment
# curl ifconfig.me
#
# Serve current directory as LAN server
# http://www.commandlinefu.com/commands/view/71/serve-current-directory-tree-at-httphostname8000#comment
# python -m SimpleHTTPServer 8080
# python3 -m http.server 8080
