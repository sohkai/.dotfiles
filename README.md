System configuration files
==========================

Source the files from the config files sitting in the home directory:

Bash
----
`[[ -r ~/.dotfiles/.bashrc ]] && . ~/.dotfiles/.bashrc`

Vim
---
`source ~/.dotfiles/.vimrc.after`

Mercurial
---------
`%include ~/.dotfiles/.hgrc`

Dependencies
------------
* Depends on [git-completion.bash](https://github.com/git/git/blob/master/contrib/completion/git-completion.bash)
also being present in the folder.
* Expects that [nvm](https://github.com/creationix/nvm), if installed,
is located at its default directory of `~/.nvm`
