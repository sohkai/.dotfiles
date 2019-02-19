###########
# Node.js #
###########

# Load NVM (avoid this and try to lazy load instead, see https://github.com/lukechilds/zsh-nvm#lazy-loading)
# source_file "$NVM_DIR/nvm.sh"

# Yarn global path
# Note that this can't go in profile.d/paths.sh because node isn't loaded by then
local yarn_global_path=$(yarn global bin)
[[ :$PATH: != *:"$yarn_global_path":* ]] && export PATH="$yarn_global_path":$PATH
