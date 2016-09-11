OSX configuration files
=======================

Just `cd && git clone git@github.com:sohkai/.dotfiles.git && ~/.dotfiles/install.sh`.

You'll still need to do some things by hand, such as:

- Upload your git SSH keys to Github
- Set up a [git signing key](https://git-scm.com/book/en/v2/Git-Tools-Signing-Your-Work) in
  `~/.gitconfig`
- Set up [homebrew's git token](https://gist.github.com/christopheranderton/8644743)
  (`HOMEBREW_GITHUB_API_TOKEN`) in your resulting `~/.profile_env`.
- Add any other local configuration (e.g. aliases, paths, etc) to your resulting `~/.bashrc`,
  `~/.zshrc, ~/.profile_env`, etc.

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
    - Node.js (with [nvm](https://github.com/creationix/nvm)) and an [.npmrc](./.npmrc)
    - Python (with [pyenv](https://github.com/yyuu/pyenv)) and an [.pypirc](./.pypirc)
    - Ruby (with [rvm](https://rvm.io/))
- Bash profile and inputrc
- Zsh and Prezto profile
- Tmux configuration
- vimrc
- git configuration (and Github SSH key)
- mercurial configuration

Shell Structure
---------------

The installed local shell files will ultimately refer back to the configuration files in this
directory.

For bash, the general source order is:

1. `~/.bash_profile`
1. `~/.bashrc`
1. `~/.dotfiles/.bashrc`
1. `~/.profile_env`

For zsh, the general source order is:

1. `~/.zshenv` (loaded by zsh separately first)
1. `~/.zlogin` (loaded by zsh separately)
1. `~/.zshrc`
1. `~/.dotfiles/.zpreztorc` (as first step of `~/.dotfiles/zshrc`)
1. `~/.dotfiles/.zshrc`
1. `~/.profile_env`

Both bash and zsh source their paths, environment settings, aliases, and functions from files in the
[`shell`](./shell) folder.

In general, any local configurations should be made to one of the local files, and any changes that
should be kept for all environments should be made to files in this repo.

**NOTE**: If you did not clone this repo into your home directory, you will need to modify all the
links to this repo in the local configuration files to point to your install directory yourself.

Changes
-------

For the most part, changing the files in this repo and then resourcing the local configuration file
should propagate those changes. However, there are a few configuration files that do not have the
ability to load from another file or are designed to only be locally placed; changes to these files
will only come into effect if they are made locally and will have to be duplicated into this repo.
A list of files to be wary for when changing:

* [`.tmux.conf`](./.tmux.conf.local)
* [`.pypirc`](./.pypirc.local)
* [`.profile_env`](./.profile_env.local) (although this should **ONLY** ever contain local
  configuration, so you shouldn't be duplicating anything other than an environment template to this
  file)
* [`.bash_profile`](./.bash_profile.local) (if you want to make modifications to this, make sure you
  have a good reason not to change your local or tracked `.bashrc` instead)
