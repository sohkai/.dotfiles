#########################################
# Utility configuration shell functions #
#########################################

# Confirm the action
# https://gist.github.com/davejamesmiller/1965569
#
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
#
# Args:
#    command: Command to check.
#
# Returns:
#    True if the command is defined in the current session
is_defined() {
    type $1 &> /dev/null;
}

is_osx() {
    [[ "$OSTYPE" == darwin* ]]
}

# Source a directory (non-recursively).
#
# Args:
#    dir_loc: Location of directory to source. **MUST** not have a trailing slash.
#    ext (optional): Extension of files to source. Defaults to 'sh'
#    ignored_files (optional): Comma delimited string of ignored files. Can be only be
#                              just the base file name. Defaults to ''
#                              Example: 'ignored.sh,another_ignored.sh'
source_dir() {
    if [[ $# -ne 1 &&  $# -ne 2 && $# -ne 3 ]]; then
        return 1 # Return error if not given right arguments
    fi

    local dir_loc="$1"
    local file_ext="${2:-sh}"
    local ignored_files="$3"
    if [[ -d $dir_loc ]]; then
        for file in "$dir_loc"/*."$file_ext"; do
            if [[ ${ignored_files#*${file##*/}} == $ignored_files ]]; then
                source $file
            fi
        done
    fi
}

# Source a file, if the file exists and is readable.
# Args:
#    file_loc: Abosolute location of file to source.
source_file() {
    if [[ $# -ne 1 ]]; then
        return 1 # Return error if not given right arguments
    fi

    local file_loc="$1"
    [[ -r $1 ]] && source $1
}
