" Add runtime path for fzf if it exists, since it's managed by zplug...
if executable('fzf')
	set runtimepath+=$HOME/.zplug/repos/junegunn/fzf/
endif

set runtimepath+=$HOME/.vim/dein/repos/github.com/Shougo/dein.vim
let s:dein_toml = fnamemodify(expand('<sfile>'), ':h').'/dein.toml'
let s:dein_lazy_toml = fnamemodify(expand('<sfile>'), ':h').'/dein_lazy.toml'

if dein#load_state('$HOME/.vim/dein')
  call dein#begin('$HOME/.vim/dein')

	" Load plugin config from tomls
	call dein#load_toml(s:dein_toml, { 'lazy': 0 })
	call dein#load_toml(s:dein_lazy_toml, { 'lazy': 1 })

  call dein#end()
  call dein#save_state()
endif

" Check for uninstalled plugins on startup
if dein#check_install()
  call dein#install()
endif
