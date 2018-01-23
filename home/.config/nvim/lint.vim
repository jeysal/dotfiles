" lint automatically
autocmd BufWritePost,BufEnter * Neomake

let g:neomake_javascript_enabled_makers = ['eslint']
let g:neomake_typescript_enabled_makers = ['tsc', 'mytslint']
let g:neomake_typescript_mytslint_maker = {
      \ 'exe': 'tslint',
      \ 'args': ['--project', neomake#utils#FindGlobFile('tsconfig.json'), '%:p'],
      \ 'errorformat': '%EERROR: %f[%l\, %c]: %m,%E%f[%l\, %c]: %m'
      \ }
