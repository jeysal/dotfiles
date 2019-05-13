" theme
colorscheme base16-spacemacs
if filereadable(expand("~/.vimrc_background"))
  autocmd FocusGained * source ~/.vimrc_background
endif

" powerline
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
