" save as root
noremap <leader>W :w !sudo tee % > /dev/null<CR>


" --- fzf.vim ---

noremap <C-p> :GFiles<CR>
noremap <leader>p :Files<CR>

let g:fzf_mru_relative = 1
let g:fzf_mru_max = 32
noremap <C-e> :FZFMru<CR>

noremap <C-f> :GLines<CR>
noremap <leader>f :Lines<CR>

command! -bang -nargs=* GLines call fzf#vim#grep('rg --fixed-strings --ignore-case --column --line-number --no-heading --hidden --glob "!.git/*" '.shellescape(<q-args>), 1, <bang>0)
command! -bang -nargs=* Lines call fzf#vim#grep('rg --fixed-strings --ignore-case --column --line-number --no-heading --hidden --no-ignore --glob "!.git/*" '.shellescape(<q-args>), 1, <bang>0)


" --- Git ---

" find using Ggrep
noremap <leader>e :Ggrep<space>

" gitgutter
map [h [c
map ]h ]c


" --- NERDTree ---

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
