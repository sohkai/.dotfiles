################################################################################
#                                 Functions                                    #
# Adapted from https://github.com/sorin-ionescu/prezto/tree/master/modules/git #
################################################################################

# Search string, respecting gitignore and ignoring svg and lock files
ggs() {
    local search="$1"
    shift
    git grep -niEI --color=auto "$search" ':!*.lock' ':!*.svg' ':!*yarn*.js' "$@"
}

# Displays the current Git branch.
git-branch-current() {
    if ! git rev-parse 2> /dev/null; then
        print "$0: not a repository: $PWD" >&2
        return 1
    fi

    local ref="$(git symbolic-ref HEAD 2> /dev/null)"

    if [[ -n "$ref" ]]; then
        print "${ref#refs/heads/}"
        return 0
    else
        return 1
    fi
}

# Displays the path to the working tree root.
git-root() {
    local root="$(git rev-parse --show-toplevel 2> /dev/null)"

    if [[ -n "$root" ]]; then
        print "$root"
        return 0
    else
        print "$0: not a repository work tree: $PWD" >&2
        return 1
    fi
}
