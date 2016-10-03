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

source_dir docker.d
source_dir git.d
source_dir homebrew.d
source_dir osx.d
source_dir tmux.d
source_dir vim.d
