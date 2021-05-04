####################
# External plugins #
####################

# Fasd (but without the aliases)
eval "$(fasd --init zsh-hook zsh-ccomp zsh-ccomp-install zsh-wcomp zsh-wcomp-install)"

# Add fasd_cd ourselves (https://github.com/clvv/fasd/blob/master/fasd#L89)
fasd_cd() {
  if [ $# -le 1 ]; then
    fasd "$@"
  else
    local _fasd_ret="$(fasd -e 'printf %s' "$@")"
    [ -z "$_fasd_ret" ] && return
    [ -d "$_fasd_ret" ] && cd "$_fasd_ret" || printf %s\n "$_fasd_ret"
  fi
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
