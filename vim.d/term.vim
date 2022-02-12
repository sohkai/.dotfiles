" Set the all important colorscheme
colorscheme one
set background=dark
call one#highlight('Comment', '787878', '', 'none')
call one#highlight('Search', 'fafafa', 'be5046', '')
call one#highlight('Todo', 'fafafa', 'c678dd', 'bold')

" Set the corresponding terminal colors
" See https://vimhelp.org/terminal.txt.html#term_setansicolors%28%29
if has('nvim')
  let g:terminal_color_0 = '#282c34'
  let g:terminal_color_1 = '#be5046'
  let g:terminal_color_2 = '#98c379'
  let g:terminal_color_3 = '#d19a66'
  let g:terminal_color_4 = '#61afef'
  let g:terminal_color_5 = '#c678dd'
  let g:terminal_color_6 = '#56b6c2'
  let g:terminal_color_7 = '#5c6370'
  let g:terminal_color_8 = '#4b5263'
  let g:terminal_color_9 = '#e06c75'
  let g:terminal_color_10 = '#98c379'
  let g:terminal_color_11 = '#e5c07b'
  let g:terminal_color_12 = '#61afef'
  let g:terminal_color_13 = '#c678dd'
  let g:terminal_color_14 = '#56b6c2'
  let g:terminal_color_15 = '#abb2bf'
else
  let g:terminal_ansi_colors = [
    \ '#282c34', '#be5046', '#98c379', '#d19a66',
    \ '#61afef', '#c678dd', '#56b6c2', '#5c6370',
    \ '#4b5263', '#e06c75', '#98c379', '#e5c07b',
    \ '#61afef', '#c678dd', '#56b6c2', '#abb2bf'
  \ ]
endif
