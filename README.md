OSX configuration files
=======================

Just `cd && git clone git@github.com:sohkai/.dotfiles.git --recurse-submodules && ~/.dotfiles/install.sh`.

At the end, you'll still need to do some things by hand to complete the install. This includes
things such as:

- Uploading your git SSH key to Github
- Setting up a [git signing key](https://git-scm.com/book/en/v2/Git-Tools-Signing-Your-Work) in
  `~/.gitconfig`
- Setting up a [homebrew's git token](https://gist.github.com/christopheranderton/8644743)
  (`HOMEBREW_GITHUB_API_TOKEN`) in your resulting `~/.profile_env`.
- Adding any other local configuration (e.g. aliases, paths, etc) to your resulting `~/.bashrc`,
  `~/.zshrc`, `~/.profile_env`, `~/.language_ver`, etc.

Make sure to pay attention to the messages at the end for further instructions.

**NOTES**:

- This repo **MUST** be cloned into the home directory (`~/`) as `~/.dotfiles/`
- [`install.sh`](./install.sh) is most useful on OSX (due to `brew`)
- On OSX, you should probably install Xcode, or at least the Xcode CLI tools
  (`xcode-select --install`), before running [`install.sh`](./install.sh)


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
- Zsh and Zim profile
- Tmux
- vimrc
- git (and Github SSH key)
- mercurial
- [And lots more](./install.sh)


Shell Structure
---------------

The locally installed shell files will ultimately refer back to the configuration files in this
directory.

For bash, the general source order is:

1. `~/.bash_profile (loaded by bash on login; always on OSX)`
1. `~/.bashrc`
    - `~/.dotfiles/bash.d/bashrc`
        - `~/.dotfiles/profile.d/*.sh`
        - `~/.dotfiles/bash.d/*.sh`
        - `~/.dotfiles/profile.d/after*.sh`
    - `~/.profilerc`
    - `~/.languagerc`

For zsh, the general source order is:

1. `~/.zshenv` (loaded by zsh)
1. `~/.zlogin` (loaded by zsh on login; always on OSX)
1. `~/.zshrc`
    - `~/.dotfiles/zsh.d/zshrc`
        - `~/.zimrc`
        - `~/.dotfiles/zsh.d/zimrc`
        - `~/.dotfiles/zsh.d/zplugrc`
        - `~/.dotfiles/profile.d/*.sh`
        - `~/.dotfiles/zsh.d/*.zsh`
        - `~/.dotfiles/profile.d/after*.sh`
    - `~/.profilerc`
    - `~/.languagerc`

Bash and zsh both source their paths, environment settings, aliases, functions, and other
configuration details from the `*.sh` or `*.zsh` files found in the shared
[`profile.d/`](./profile.d/) folder as well as their own respective folder. The `profile.d/` files
are loaded first before any corresponding [`bash.d/`](./bash.d/) or [`zsh.d/`](./zsh.d/) files are
loaded; this allows the files in `bash.d/` or `zsh.d/` to override any inherited setting from
`profile.d/`. Files in [`profile.d/after/`](./profile.d/after/), [`bash.d/after/`](./bash.d/after/),
and [`zsh.d/after/`](./zsh.d/after/) are run **after** all other files in `profile.d`, `bash.d`, and
`zsh.` are sourced and can be used to reset non-local settings (e.g. an alias set by a sourced
plugin).

**NOTE**: After installation, the `.profilerc` and `.languagerc` files do not link to a
corresponding file in this repo; as such, they should contain only local configuration.
Specifically, the `.profilerc` file should be used for general environment settings (e.g. local
aliases, environments, etc) and `.languagerc` should specify defaults for any loaded language
version managers. Due to the slow speed of some version managers (*ahem* `nvm` *ahem*),
`.languagerc` is only loaded at startup if confirmed.


Changes
-------

In general, keep local configurations to one of the local files. Only modify the files in this repo
when you know you would like to also propagate that change to all environments.

For the most part, if you do make a change to a file in this repo, you will be able to propagate
that change by resourcing the corresponding local configuration file. However, there are a few
configuration files that are not able to be loaded from another file or are designed to only be
locally placed; changes to these files will only come into effect if they are made locally and will
have to be duplicated into this repo. A list of files to be wary of when changing:

* [`.bash_profile`](./bash.d/bash_profile.local) and [`.inputrc`](./bash.d/inputrc.local) (if you
  want to make modifications to these, make sure you have a good reason not to change their tracked
  version instead)
* [`.profilerc`](./profile.d/profilerc.local) and [`.languagerc`](./profile.d/languagerc.local)
  (although these should **ONLY** ever contain local configuration, so you shouldn't need to
  duplicate anything other than a template for these files)
* [`.gitconfig`](./git.d/gitconfig.local)
* [`.hgrc`](./hg.d/hgrc.local) and [`.hgignore_global`](./hg.d/hgignore_global.local)
* [`.npmrc`](./node.d/npmrc.local)
* [`.pypirc`](./python.d/pypirc.local)
* [`.rvmrc`](./ruby.d/rvmrc.local)
* [`.vimrc`](./vim.d/vimrc.local) and [`.gvimrc`](./vim.d/gvimrc.local)
* [`.zshrc`](./zsh.d/zshrc.local), [`.zshenv`](./zsh.d/zshev.local),
  [`.zlogin`](./zsh.d/zlogin.local), and [`.zimrc`](./zsh.d/zimrc.local)
