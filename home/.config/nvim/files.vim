" save as root https://github.com/neovim/neovim/issues/1496
"noremap <leader>W :w !sudo tee % > /dev/null<CR>

command! -nargs=0 Only %bd|e#|bd#

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
map ]h :GitGutterNextHunk<CR>
map [h :GitGutterPrevHunk<CR>
