" save as root
noremap <leader>W :w !sudo tee % > /dev/null<CR>


" --- Ctrl-p ---

noremap <C-p> :GFiles<CR>
inoremap <C-p> <C-c>:GFiles<CR>
noremap <leader>p :Files<CR>

noremap <C-e> :History<CR>
inoremap <C-e> <C-c>:History<CR>
noremap <leader>e :Ag<CR>


" --- Git ---

" find using Ggrep
noremap <leader>f :Ggrep<space>

" gitgutter
map [h [c
map ]h ]c


" --- NERDTree ---

" config
let g:NERDTreeShowHidden=1
let g:NERDTreeWinSize=42

noremap <leader>t :NERDTreeFind<CR>

" start automatically
autocmd VimEnter * if @% == "" | NERDTree | endif
" take focus away
autocmd VimEnter * wincmd p
" quit automatically
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
