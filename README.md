System configuration files
==========================

Source the files from the config files sitting in the home directory:

Bash
----
[[ -r ~/.dotfiles/.bashrc ]] && . ~/.dotfiles/.bashrc

Vim
---
source ~/.dotfiles/.vimrc.after

Mercurial
---------
%include ~/.dotfiles/.hgrc
