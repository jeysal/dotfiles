" lint automatically
autocmd BufWritePost,BufEnter * Neomake

let g:neomake_javascript_enabled_makers = ['eslint']
let g:neomake_typescript_enabled_makers = ['tsc', 'tslint']

" running eslint from anywhere except the project root can cause problems e.g. with jest's .eslintrc.js
let g:neomake_javascript_eslint_maker = {
        \ 'args': ['-f', 'compact'],
        \ 'errorformat': '%E%f: line %l\, col %c\, Error - %m,' .
        \   '%W%f: line %l\, col %c\, Warning - %m,%-G,%-G%*\d problems%#',
        \ 'cwd': getcwd(),
        \ }
