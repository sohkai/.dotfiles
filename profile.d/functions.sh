#############
# Functions #
#############

# Count code in a directory
# Usage: code_count <directory> <file extension>
# Example: code_count src/ js
code_count() {
    if [ "$#" -ne 2 ]; then
        echo "Usage: code_count <directory> <file extension>"
        return 1
    fi

    echo "$(find "$1" -type f -iname *."$2" | xargs wc -l | sort)"
}

# Make a gif!
gifify() {
  if [[ -n "$1" ]]; then
    if [[ $2 == '--good' ]]; then
      ffmpeg -i $1 -r 10 -vcodec png out-static-%05d.png
      time convert -verbose +dither -layers Optimize -resize 600x600\> out-static*.png  GIF:- | gifsicle --colors 128 --delay=5 --loop --optimize=3 --multifile - > $1.gif
      rm out-static*.png
    else
      ffmpeg -i $1 -s 600x400 -pix_fmt rgb24 -r 10 -f gif - | gifsicle --optimize=3 --delay=3 > $1.gif
    fi
  else
    echo "proper usage: gifify <input_movie.mov>. You DO need to include extension."
  fi
}

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
    source $HOME/.travis/travis.sh
    unset -f travis
    travis "$@"
}
