" Ctrl+Space omnicomplete
inoremap <silent><expr> <C-space> coc#refresh()
inoremap <C-@> <C-space>

" <CR> confirm completion
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" coc yank list
nnoremap <silent> <space>y  :<C-u>CocList -A --normal yank<cr>

" restore c-6 mapping
nnoremap <C-6> <C-^>

" fuck off, we got :h for that
:nmap <F1> <nop>
:imap <F1> <nop>

" how tf am I supposed to press shift-6??
:map § ^
