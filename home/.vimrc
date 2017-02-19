syntax enable
colorscheme monokai

filetype plugin indent on
set smartindent
set tabstop=4
set shiftwidth=4
set expandtab

if &term =~ '256color'
  " disable Background Color Erase (BCE) so that color schemes
  " render properly when inside 256-color tmux and GNU screen.
  " see also http://snk.tuxfamily.org/log/vim-256color-bce.html
  set t_ut=
endif
