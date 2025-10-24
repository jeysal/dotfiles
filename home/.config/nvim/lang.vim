autocmd BufNewFile,BufRead COMMIT_EDITMSG set spell
autocmd FileType markdown,latex set spell

" highlight
autocmd CursorHold * silent if exists("*CocActionAsync") | call CocActionAsync('highlight') | endif
" organize imports on save
augroup organize_imports
  autocmd!
  autocmd FileType typescript,typescriptreact autocmd BufWritePre <buffer> :silent call CocAction('runCommand', 'editor.action.organizeImport')
augroup END
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
map <silent> <leader>q :CocOutline<CR>
" references
map <silent> <leader>7 <Plug>(coc-references)
" format
nmap <silent> <C-\> <Plug>(coc-format)
" insert doc
autocmd FileType javascript,typescript map <leader>d :JsDoc<CR>
" rename
map <silent> <leader>r <Plug>(coc-rename)
" quick fix
map <silent> <leader>\ <Plug>(coc-codeaction-selected)
" codeaction
map <silent> <leader><CR> <Plug>(coc-codeaction)
" copilot
imap <silent><script><expr> <M-Tab> copilot#Accept("\<CR>")
let g:copilot_no_tab_map = v:true
