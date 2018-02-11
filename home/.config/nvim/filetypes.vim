" additional extensions
autocmd BufNewFile,BufRead *.json setfiletype json syntax=javascript
autocmd BufNewFile,BufRead *.tsx setfiletype typescript syntax=typescript

" goto definition
autocmd FileType javascript map <buffer> gd :FlowJumpToDef<CR>
autocmd FileType typescript map <buffer> gd :TsuDefinition<CR>
autocmd FileType reason map <buffer> gd :call LanguageClient_textDocument_definition()<CR>

" show type hint
autocmd FileType javascript map <buffer> <C-q> :FlowType<CR>
autocmd FileType typescript map <buffer> <C-q> :echo tsuquyomi#hint()<CR>
autocmd FileType reason map <buffer> <C-q> :call LanguageClient_textDocument_hover()<CR>

" list symbols
autocmd FileType reason map <buffer> <leader>q :call LanguageClient_textDocument_documentSymbol()<CR>

" references
autocmd FileType reason map <buffer> <leader>7 :call LanguageClient_textDocument_references()<CR>

" format
autocmd FileType javascript noremap <buffer> <C-l> :Neoformat<CR>
autocmd FileType typescript noremap <buffer> <C-l> :Neoformat<CR>
autocmd FileType reason map <buffer> <C-l> :call LanguageClient_textDocument_formatting()<CR>

" insert doc
autocmd FileType javascript,typescript map <leader>d :JsDoc<CR>

" import
autocmd FileType typescript map <buffer> <leader>i :TsuImport<CR>

" rename
autocmd FileType typescript map <buffer> <leader>r :TsuRenameSymbol<CR>
autocmd FileType reason map <buffer> <leader>r :call LanguageClient_textDocument_rename()<CR>

" quick fix
autocmd FileType typescript map <buffer> <leader><CR> :TsuQuickFix<CR>
