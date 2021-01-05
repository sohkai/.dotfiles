# Add to path if not already added and folder exists

if [ -n "$TMUX" ]; then
    # Reset the path if starting a shell in tmux; see https://superuser.com/a/583502/639617
    PATH=""
    source /etc/profile
fi

# Homebrew
local homebrew_bin_path=/usr/local/bin
local homebrew_sbin_path=/usr/local/sbin
local homebrew_gnubin_path=/usr/local/opt/coreutils/libexec/gnubin
local homebrew_gnuman_path=/usr/local/opt/coreutils/libexec/gnuman
[[ :$PATH: != *:"$homebrew_bin_path":* ]] && [[ -d "$homebrew_bin_path" ]] && export PATH="$homebrew_bin_path":$PATH
[[ :$PATH: != *:"$homebrew_sbin_path":* ]] && [[ -d "$homebrew_sbin_path" ]] && export PATH="$homebrew_sbin_path":$PATH
[[ :$PATH: != *:"$homebrew_gnubin_path":* ]] && [[ -d "$homebrew_gnubin_path" ]] && export PATH="$homebrew_gnubin_path":$PATH
[[ :$PATH: != *:"$homebrew_gnuman_path":* ]] && [[ -d "$homebrew_gnuman_path" ]] && export PATH="$homebrew_gnuman_path":$PATH

# Go
# Add default GOPATH
export PATH="$HOME/go/bin":$PATH

# RVM
# Add RVM to PATH for scripting
local rvm_bin_path=$HOME/.rvm/bin
[[ :$PATH: != *:"$rvm_bin_path":* ]] && [[ -d "$rvm_bin_path" ]] && export PATH=$PATH:"$rvm_bin_path"
