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

# Search string, respecting gitignore and ignoring lock files
ggs() {
    local search="$1"
    shift
    git grep -niEI --color=auto "$search" ':!*.lock' "$@"
}

# Make a directory and cd into it
mkcd() {
    mkdir -p $1;
    cd $1;
}

# FASD + FZF
fasd_fzf() {
  fasd -"$1" "$2" | fzf -1 -0 --no-sort +m
}

# FASD + FZF directory jump
fasd_fzf_cd() {
  local dir
  dir="$(fasd_fzf -Rdl "$1")" && cd "${dir}" || return 1
}

# FASD + FZF select directory
fasd_fzf_sd() {
  fasd_fzf -Rdl "$1"
}

# FASD + FZF select file
fasd_fzf_sf() {
  fasd_fzf -Rfl "$1"
}

# FASD + FZF vim jump
fasd_fzf_vim() {
  local file
  file="$(fasd_fzf -Rfl "$1")" && nvim "${file}" || return 1
}

# FZF git branch checkout helper
fzf_gitcheckout() {
  local branches branch
  branches=$(git branch -vv) &&
  branch=$(echo "$branches" | fzf +m) &&
  git checkout $(echo "$branch" | awk '{print $1}' | sed "s/.* //")
}

# FZF git commit checkout helper
fzf_gitcommit() {
  local commits commit
  commits=$(git log --pretty=oneline --abbrev-commit --reverse) &&
  commit=$(echo "$commits" | fzf --tac +s +m -e) &&
  git checkout $(echo "$commit" | sed "s/ .*//")
}

# FZF git commit hash selector
fzf_gitcommithash() {
  local commits commit
  commits=$(git log --color=always --pretty=oneline --abbrev-commit --reverse) &&
  commit=$(echo "$commits" | fzf --tac +s +m -e --ansi --reverse) &&
  echo -n $(echo "$commit" | sed "s/ .*//")
}

# FZF git stash helper
fzf_gitstash() {
  local out q k sha
  while out=$(
    git stash list --pretty="%C(yellow)%h %>(14)%Cgreen%cr %C(blue)%gs" |
    fzf --ansi --no-sort --query="$q" --print-query \
        --expect=ctrl-d,ctrl-b);
  do
    IFS=$'\n'; set -f
    lines=($(<<< "$out"))
    unset IFS; set +f
    q="${lines[0]}"
    k="${lines[1]}"
    sha="${lines[-1]}"
    sha="${sha%% *}"
    [[ -z "$sha" ]] && continue
    if [[ "$k" == 'ctrl-d' ]]; then
      git diff $sha
    elif [[ "$k" == 'ctrl-b' ]]; then
      git stash branch "stash-$sha" $sha
      break;
    else
      git -c color.ui=always stash show -p $sha | less -+F
    fi
  done
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
