" additional extensions
autocmd BufNewFile,BufRead *.json setfiletype json syntax=javascript
autocmd BufNewFile,BufRead *.tsx setfiletype typescript syntax=typescript

" goto definition
autocmd FileType javascript map <buffer> gd :FlowJumpToDef<CR>
autocmd FileType typescript map <buffer> gd :TsuDefinition<CR>

" show type hint
autocmd FileType javascript map <buffer> <leader>q :FlowType<CR>
autocmd FileType typescript map <buffer> <leader>q :echo tsuquyomi#hint()<CR>

" format
autocmd FileType javascript noremap <buffer> <C-l> :Neoformat<CR>
autocmd FileType typescript noremap <buffer> <C-l> :Neoformat<CR>

" operations
autocmd FileType typescript map <buffer> <leader><CR> :TsuQuickFix<CR>
autocmd FileType typescript map <buffer> <leader>i :TsuImport<CR>
autocmd FileType typescript map <buffer> <leader>r :TsuRenameSymbol<CR>
autocmd FileType javascript,typescript map <leader>d :JsDoc<CR>
