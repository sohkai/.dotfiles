OSX configuration files
=======================

Just `cd && git clone git@github.com:sohkai/.dotfiles.git && ~/.dotfiles/install.sh`.

You'll still need to do some things by hand, such as:

- Upload your git SSH keys to Github
- Set up a [git signing key](https://git-scm.com/book/en/v2/Git-Tools-Signing-Your-Work) in
  `~/.gitconfig`
- Set up [homebrew's git token](https://gist.github.com/christopheranderton/8644743)
  (`HOMEBREW_GITHUB_API_TOKEN`) in `~/.bashrc`

So make sure to follow some of the messages (a summary will be printed at the end).

**NOTE**: Mostly useful only on OSX.
**NOTE**: You should probably install Xcode, or at least the Xcode CLI tools, before running
`~/.dotfiles/install.sh`.

install.sh
----------

What's included (everything with a `.local` suffix is copied to `~/` without the suffix):

- Setting up [homebrew](http://brew.sh/), [Cask](https://caskroom.github.io/), and then a whole
  bunch of goodies
- Languages:
    - Node.js (with [nvm](https://github.com/creationix/nvm))
        - npmrc
    - Python (with [pyenv](https://github.com/yyuu/pyenv))
        - pypirc
    - Ruby (with [rvm](https://rvm.io/))
- inputrc
- Bash profile
- Zsh and Prezto profile
- Tmux configuration
- vimrc
- git configuration (and Github SSH key)
- mercurial configuration
