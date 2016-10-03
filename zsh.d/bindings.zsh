################
# Key bindings #
################

bindkey -M viins '^F' vi-forward-word
bindkey -M viins '^E' vi-add-eol
bindkey -M viins '^R' history-incremental-search-backward
bindkey -M vicmd '^R' history-incremental-search-backward
bindkey -M viins '^S' history-incremental-search-forward
bindkey -M vicmd '^S' history-incremental-search-forward

bindkey -M vicmd 'q' push-line # Reset the current prompt but save it for the next command
bindkey -M viins ' ' magic-space # Magic space completion for history

# Requires history-substring-search
is_defined history-substring-search-up && bindkey -M vicmd 'k' history-substring-search-up
is_defined history-substring-search-down && bindkey -M vicmd 'j' history-substring-search-down

# Ranger
is_defined ranger && bindkey -s '^O' "ranger_cd\n"
