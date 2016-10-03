#########################################
# Utility configuration shell functions #
#########################################

# Confirm the action
# https://gist.github.com/davejamesmiller/1965569
# Args:
#    prompt: Confirmation prompt
#    default: Default answer.
#
# Returns:
#    0 if confirmed, non-zero if not.
ask() {
    local prompt default REPLY

    while true; do

        if [ "${2:-}" = "Y" ]; then
            prompt="Y/n"
            default=Y
        elif [ "${2:-}" = "N" ]; then
            prompt="y/N"
            default=N
        else
            prompt="y/n"
            default=
        fi

        # Ask the question (not using "read -p" as it uses stderr not stdout)
        echo -n "$1 [$prompt] "

        # Read the answer (use /dev/tty in case stdin is redirected from somewhere else)
        read REPLY </dev/tty

        # Default?
        if [ -z "$REPLY" ]; then
            REPLY=$default
        fi

        # Check if the reply is valid
        case "$REPLY" in
            Y*|y*) return 0 ;;
            N*|n*) return 1 ;;
        esac

    done
}

# Check that a given alias or function is available
# Args:
#    command: Command to check.
#
# Returns:
#    True if the command is defined in the current session
is_defined() {
    type $1 &> /dev/null;
    return $?
}
