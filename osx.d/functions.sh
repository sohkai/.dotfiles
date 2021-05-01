#############
# Functions #
#############

# Deletes .DS_Store and __MACOSX directories.
# Adapted from https://github.com/sorin-ionescu/prezto/tree/master/modules/osx #
osx-rm-dir-metadata() {
    find "${@:-$PWD}" \( \
        -type f -name '.DS_Store' -o \
        -type d -name '__MACOSX' \
    \) -print0 | xargs -0 rm -rf
}
