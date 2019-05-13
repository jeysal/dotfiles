" additional extensions
autocmd BufNewFile,BufRead *.json setfiletype json syntax=javascript
autocmd BufNewFile,BufRead *.tsx setfiletype typescript.tsx syntax=typescript
autocmd BufNewFile,BufRead *.md set syntax=markdown
autocmd BufNewFile,BufRead COMMIT_EDITMSG set spell
autocmd FileType markdown,latex set spell

" highlight
autocmd CursorHold * silent call CocActionAsync('highlight')
" show type hint
nmap <silent> <C-q> :call CocActionAsync('doHover')<CR>
" navigate errors
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)
" goto definition
nmap <silent> gd <Plug>(coc-definition)
" goto type definition
nmap <silent> gD <Plug>(coc-type-definition)
" outline
nmap <silent> <leader>q :CocList outline<CR>
" references
nmap <silent> <leader>7 <Plug>(coc-references)
" format
nmap <silent> <C-l> <Plug>(coc-format)
" insert doc
autocmd FileType javascript,typescript map <leader>d :JsDoc<CR>
" rename
nmap <silent> <leader>r <Plug>(coc-rename)
" quick fix
nmap <silent> <leader><CR> <Plug>(coc-codeaction)
