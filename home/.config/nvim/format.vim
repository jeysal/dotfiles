" JSON & CSS C-l
autocmd FileType json map <buffer> <C-l> :Neoformat<CR>
autocmd FileType css map <buffer> <C-l> :Neoformat<CR>
autocmd FileType markdown map <buffer> <C-l> :Neoformat<CR>

let g:neoformat_enabled_markdown = ['prettier']
let g:neoformat_enabled_css = ['prettier']
let g:neoformat_enabled_json = ['prettier']

let g:neoformat_enabled_javascript = ['prettier']
let g:neoformat_enabled_typescript = ['prettier']
