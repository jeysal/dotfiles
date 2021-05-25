let g:vimwiki_list = [{
       \ 'path': '~/docs/notes/',
       \ 'syntax':'markdown', 'ext': '.md'
       \ }]
" undo vimwiki markdown handling
autocmd FileType vimwiki set ft=markdown
