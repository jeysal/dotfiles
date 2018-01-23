" lint automatically
autocmd BufWritePost,BufEnter * Neomake

let g:neomake_javascript_enabled_makers = ['eslint']
let g:neomake_typescript_enabled_makers = ['tsc', 'tslint']
