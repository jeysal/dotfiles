let tmux_navigator_no_mappings = 1
if has('vim_starting')
  if &rtp =~ '\<tmux-navigator\>'
    nnoremap <silent> <c-a><c-h> :TmuxNavigateLeft<cr>
    nnoremap <silent> <c-a><c-j> :TmuxNavigateDown<cr>
    nnoremap <silent> <c-a><c-k> :TmuxNavigateUp<cr>
    nnoremap <silent> <c-a><c-l> :TmuxNavigateRight<cr>
  else
    nnoremap <C-h> <c-w>h
    nnoremap <C-j> <c-w>j
    nnoremap <C-k> <c-w>k
    nnoremap <C-l> <c-w>l
  endif
endif
