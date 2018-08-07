################
# Key bindings #
################

bindkey -M viins '^F' vi-forward-word
bindkey -M viins '^E' vi-add-eol

bindkey -M vicmd 'q' push-line # Reset the current prompt but save it for the next command
bindkey -M viins ' ' magic-space # Magic space completion for history

# Ranger
is_defined ranger && bindkey -s '^O' "ranger_cd\n"
