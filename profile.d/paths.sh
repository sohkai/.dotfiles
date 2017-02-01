# Add to path if not already added and folder exists

# Homebrew
local homebrew_bin_path=/usr/local/bin
local homebrew_sbin_path=/usr/local/sbin
[[ :$PATH: != *:"$homebrew_bin_path":* ]] && [[ -d "$homebrew_bin_path" ]] && export PATH="$homebrew_bin_path":$PATH
[[ :$PATH: != *:"$homebrew_sbin_path":* ]] && [[ -d "$homebrew_sbin_path" ]] && export PATH="$homebrew_sbin_path":$PATH

# Yarn (JS)
local yarn_global_path=`yarn global bin`
[[ :$PATH: != *:"$yarn_global_path":* ]] && export export PATH="$yarn_global_path":$PATH


# RVM
# Add RVM to PATH for scripting
local rvm_bin_path=$HOME/.rvm/bin
[[ :$PATH: != *:"$rvm_bin_path":* ]] && [[ -d "$rvm_bin_path" ]] && export PATH=$PATH:"$rvm_bin_path"

# Android SDK
local android_platform_tools_path=/Users/Brett/Development/androidSDK/platform-tools
local android_tools_path=/Users/Brett/Development/androidSDK/tools
[[ :$PATH: != *:"$android_platform_tools_path":* ]] && [[ -d "$android_platform_tools_path" ]] && export PATH=$PATH:"$android_platform_tools_path"
[[ :$PATH: != *:"$android_tools_path":* ]] && [[ -d "$android_tools_path" ]] && export PATH=$PATH:"$android_tools_path"
