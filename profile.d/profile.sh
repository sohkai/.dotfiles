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

source_dir $HOME/.dotfiles/docker.d
source_dir $HOME/.dotfiles/git.d
source_dir $HOME/.dotfiles/homebrew.d
source_dir $HOME/.dotfiles/osx.d
source_dir $HOME/.dotfiles/tmux.d
source_dir $HOME/.dotfiles/vim.d
