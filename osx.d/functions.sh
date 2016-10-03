################################################################################
#                                 Functions                                    #
# Adapted from https://github.com/sorin-ionescu/prezto/tree/master/modules/osx #
################################################################################

# Open man pages in Dash
mand() {
    if (( $# > 0 )); then
        open "dash://manpages:$1" 2>/dev/null
        if (( $? != 0 )); then
            print "$0: Dash is not installed" >&2
            break
        fi
    else
        print 'What manual page do you want?' >&2
    fi
}

# Deletes .DS_Store and __MACOSX directories.
osx-rm-dir-metadata() {
    find "${@:-$PWD}" \( \
        -type f -name '.DS_Store' -o \
        -type d -name '__MACOSX' \
    \) -print0 | xargs -0 rm -rf
}
