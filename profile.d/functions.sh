#############
# Functions #
#############

# Make a directory and cd into it
mkcd() {
    mkdir -p $1;
    cd $1;
}

# Automatically cd after ranger closes
ranger_cd() {
    tempfile="$(mktemp -t tmp.XXXXXX)"
    ranger --choosedir="$tempfile" "${@:-$(pwd)}"
    test -f "$tempfile" &&
    if [ "$(cat -- "$tempfile")" != "$(echo -n `pwd`)" ]; then
        cd -- "$(cat "$tempfile")"
    fi
    rm -f -- "$tempfile"
}

# Open up man, OSX edition
# http://www.commandlinefu.com/commands/view/7581/rtfm-function#comment
rtfm() {
    help $@ || man $@ || open "http://www.google.com/search?q=$@";
}

# Lazy load travis.rb
travis() {
    source ~/.travis/travis.sh
    unset -f travis
    travis "$@"
}
