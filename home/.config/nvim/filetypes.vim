" additional extensions
autocmd BufNewFile,BufRead *.json setfiletype json syntax=javascript
autocmd BufNewFile,BufRead *.tsx setfiletype typescript syntax=typescript

" language server commands
let g:LanguageClient_serverCommands = {
      \ 'javascript': ['flow', 'lsp', '--from', './node_modules/.bin'],
      \ 'reason': ['ocaml-language-server', '--stdio'],
      \ 'ocaml': ['ocaml-language-server', '--stdio'],
      \ 'java': ['java-language-server'],
      \ 'rust': ['rls'],
      \ }

" goto definition
autocmd FileType javascript,reason,java,rust map <buffer> gd :call LanguageClient_textDocument_definition()<CR>
autocmd FileType typescript map <buffer> gd :TSDef<CR>
autocmd FileType go map <buffer> gd :GoDef<CR>

" goto type definition
autocmd FileType javascript,reason,java,rust map <buffer> gD :call LanguageClient_textDocument_typeDefinition()<CR>
autocmd FileType typescript map <buffer> gD :TSTypeDef<CR>

" show type hint
autocmd FileType javascript,reason,java,rust map <buffer> <C-q> :call LanguageClient_textDocument_hover()<CR>
autocmd FileType typescript map <buffer> <C-q> :TSType<CR>
autocmd FileType go map <buffer> <C-q> :GoInfo<CR>

" list symbols
autocmd FileType javascript,reason,java,rust map <buffer> <leader>q :call LanguageClient_textDocument_documentSymbol()<CR>
autocmd FileType typescript map <buffer> <leader>q :TSGetDocSymbols<CR>

" references
autocmd FileType javascript,reason,java,rust map <buffer> <leader>7 :call LanguageClient_textDocument_references()<CR>
autocmd FileType typescript map <buffer> <leader>7 :TSRefs<CR>
autocmd FileType go map <buffer> <leader>7 :GoCallers<CR>

" format (see format.vim for Neoformat)
autocmd FileType reason,java,rust map <buffer> <C-l> :call LanguageClient_textDocument_formatting()<CR>
autocmd FileType go map <buffer> <C-l> :GoFmt<CR>

" insert doc
autocmd FileType javascript,typescript map <leader>d :JsDoc<CR>

" rename
autocmd FileType typescript map <buffer> <leader>r :TSRename<CR>
autocmd FileType javascript,reason,rust map <buffer> <leader>r :call LanguageClient_textDocument_rename()<CR>
autocmd FileType go map <buffer> <leader>r :GoRename<CR>

" quick fix
autocmd FileType typescript map <buffer> <leader><CR> :TSGetCodeFix<CR>
