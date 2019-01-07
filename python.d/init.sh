##########
# Python #
##########

# Load Pyenv and accessories
pyenv() {
    eval "$(command pyenv init -)"
    eval "$(command pyenv virtualenv-init -)"
    pyenv "$@"
}
