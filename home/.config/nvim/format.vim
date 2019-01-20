autocmd FileType javascript,typescript,json,yaml,css,scss,markdown map <buffer> <C-l> :Neoformat<CR>

let g:neoformat_enabled_javascript = ['prettier']
let g:neoformat_enabled_typescript = ['prettier']

let g:neoformat_enabled_json = ['prettier']
let g:neoformat_enabled_yaml = ['prettier']

let g:neoformat_enabled_css = ['prettier']
let g:neoformat_enabled_scss = ['prettier']

let g:neoformat_enabled_markdown = ['prettier']
