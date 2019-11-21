" config
let g:NERDTreeShowHidden=1
let g:NERDTreeWinSize=32

noremap <leader>t :NERDTreeFind<CR>

" start automatically
autocmd VimEnter * if @% == "" | NERDTree | endif
" take focus away
autocmd VimEnter * wincmd p
" quit automatically
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
