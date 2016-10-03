##### FIRST THINGS FIRST #####

# Gotta get my fortune
if (( $+commands[fortune] )); then
  if [[ -t 0 || -t 1 ]]; then
    fortune -s
    print
  fi
fi


############
# Autoload #
############

source_dir docker
source_dir git
source_dir homebrew
source_dir osx
source_dir tmux
source_dir vim
